From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 03/11] sony-laptop: add panel_id function
Date: Fri, 21 Mar 2014 08:01:14 +0900
Message-ID: <1395356482-7446-4-git-send-email-malattia@linux.it>
References: <1395356482-7446-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:42150 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759656AbaCTXJN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Mar 2014 19:09:13 -0400
In-Reply-To: <1395356482-7446-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <jachirica@gmail.com>, Mattia Dongili <malattia@linux.it>

From: Javier Achirica <jachirica@gmail.com>

Signed-off-by: Javier Achirica <jachirica@gmail.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 59 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index de17390..d1f712e 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -164,6 +164,9 @@ static int __sony_nc_gfx_switch_status_get(void);
 static int sony_nc_highspeed_charging_setup(struct platform_device *pd);
 static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd);
 
+static int sony_nc_panelid_setup(struct platform_device *pd);
+static void sony_nc_panelid_cleanup(struct platform_device *pd);
+
 static int sony_nc_touchpad_setup(struct platform_device *pd,
 				  unsigned int handle);
 static void sony_nc_touchpad_cleanup(struct platform_device *pd);
@@ -1385,6 +1388,12 @@ static void sony_nc_function_setup(struct acpi_device *device,
 				pr_err("couldn't set up keyboard backlight function (%d)\n",
 						result);
 			break;
+		case 0x011D:
+			result = sony_nc_panelid_setup(pf_device);
+			if (result)
+				pr_err("couldn't set up panel ID function (%d)\n",
+				       result);
+			break;
 		default:
 			continue;
 		}
@@ -1449,6 +1458,9 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x0163:
 			sony_nc_kbd_backlight_cleanup(pd, handle);
 			break;
+		case 0x011D:
+			sony_nc_panelid_cleanup(pd);
+			break;
 		default:
 			continue;
 		}
@@ -2540,6 +2552,53 @@ static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd)
 	}
 }
 
+/* Panel ID function */
+static struct device_attribute *panel_handle;
+
+static ssize_t sony_nc_panelid_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x011D, 0x0000, &result))
+		return -EIO;
+
+	return snprintf(buffer, PAGE_SIZE, "%d\n", result);
+}
+
+static int sony_nc_panelid_setup(struct platform_device *pd)
+{
+	unsigned int result;
+
+	panel_handle = kzalloc(sizeof(struct device_attribute), GFP_KERNEL);
+	if (!panel_handle)
+		return -ENOMEM;
+
+	sysfs_attr_init(&panel_handle->attr);
+	panel_handle->attr.name = "panel_id";
+	panel_handle->attr.mode = S_IRUGO;
+	panel_handle->show = sony_nc_panelid_show;
+	panel_handle->store = NULL;
+
+	result = device_create_file(&pd->dev, panel_handle);
+	if (result) {
+		kfree(panel_handle);
+		panel_handle = NULL;
+		return result;
+	}
+
+	return 0;
+}
+
+static void sony_nc_panelid_cleanup(struct platform_device *pd)
+{
+	if (panel_handle) {
+		device_remove_file(&pd->dev, panel_handle);
+		kfree(panel_handle);
+		panel_handle = NULL;
+	}
+}
+
 /* Touchpad enable/disable */
 struct touchpad_control {
 	struct device_attribute attr;
-- 
1.9.0
