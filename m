From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 08/11] sony-laptop: add smart connect control function
Date: Fri, 21 Mar 2014 08:01:19 +0900
Message-ID: <1395356482-7446-9-git-send-email-malattia@linux.it>
References: <1395356482-7446-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:42141 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758342AbaCTXJL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Mar 2014 19:09:11 -0400
In-Reply-To: <1395356482-7446-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <jachirica@gmail.com>, Mattia Dongili <malattia@linux.it>

From: Javier Achirica <jachirica@gmail.com>

The current value is not available through the SNC device and therefore
the attribute is writable only.

Signed-off-by: Javier Achirica <jachirica@gmail.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 67 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 48e7e5b..19d769e 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -177,6 +177,9 @@ static void sony_nc_usb_charge_cleanup(struct platform_device *pd);
 static int sony_nc_panelid_setup(struct platform_device *pd);
 static void sony_nc_panelid_cleanup(struct platform_device *pd);
 
+static int sony_nc_smart_conn_setup(struct platform_device *pd);
+static void sony_nc_smart_conn_cleanup(struct platform_device *pd);
+
 static int sony_nc_touchpad_setup(struct platform_device *pd,
 				  unsigned int handle);
 static void sony_nc_touchpad_cleanup(struct platform_device *pd);
@@ -1422,6 +1425,12 @@ static void sony_nc_function_setup(struct acpi_device *device,
 				pr_err("couldn't set up panel ID function (%d)\n",
 				       result);
 			break;
+		case 0x0168:
+			result = sony_nc_smart_conn_setup(pf_device);
+			if (result)
+				pr_err("couldn't set up smart connect support (%d)\n",
+						result);
+			break;
 		default:
 			continue;
 		}
@@ -1498,6 +1507,9 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x011D:
 			sony_nc_panelid_cleanup(pd);
 			break;
+		case 0x0168:
+			sony_nc_smart_conn_cleanup(pd);
+			break;
 		default:
 			continue;
 		}
@@ -2885,6 +2897,61 @@ static void sony_nc_panelid_cleanup(struct platform_device *pd)
 	}
 }
 
+/* smart connect function */
+static struct device_attribute *sc_handle;
+
+static ssize_t sony_nc_smart_conn_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	unsigned int result;
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+
+	if (kstrtoul(buffer, 10, &value) || value > 1)
+		return -EINVAL;
+
+	if (sony_call_snc_handle(0x0168, value << 0x10, &result))
+		return -EIO;
+
+	return count;
+}
+
+static int sony_nc_smart_conn_setup(struct platform_device *pd)
+{
+	unsigned int result;
+
+	sc_handle = kzalloc(sizeof(struct device_attribute), GFP_KERNEL);
+	if (!sc_handle)
+		return -ENOMEM;
+
+	sysfs_attr_init(&sc_handle->attr);
+	sc_handle->attr.name = "smart_connect";
+	sc_handle->attr.mode = S_IWUSR;
+	sc_handle->show = NULL;
+	sc_handle->store = sony_nc_smart_conn_store;
+
+	result = device_create_file(&pd->dev, sc_handle);
+	if (result) {
+		kfree(sc_handle);
+		sc_handle = NULL;
+		return result;
+	}
+
+	return 0;
+}
+
+static void sony_nc_smart_conn_cleanup(struct platform_device *pd)
+{
+	if (sc_handle) {
+		device_remove_file(&pd->dev, sc_handle);
+		kfree(sc_handle);
+		sc_handle = NULL;
+	}
+}
+
 /* Touchpad enable/disable */
 struct touchpad_control {
 	struct device_attribute attr;
-- 
1.9.0
