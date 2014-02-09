From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 6/7] sony-laptop: add hibernate on low battery function
Date: Mon, 10 Feb 2014 08:07:33 +0900
Message-ID: <1391987254-3103-7-git-send-email-malattia@linux.it>
References: <1391987254-3103-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:46364 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752081AbaBIXNv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 9 Feb 2014 18:13:51 -0500
In-Reply-To: <1391987254-3103-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <jachirica@gmail.com>, Mattia Dongili <malattia@linux.it>

From: Javier Achirica <jachirica@gmail.com>

Signed-off-by: Javier Achirica <jachirica@gmail.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 78 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 7b5a56d..ba39a29 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -164,6 +164,9 @@ static int __sony_nc_gfx_switch_status_get(void);
 static int sony_nc_highspeed_charging_setup(struct platform_device *pd);
 static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd);
 
+static int sony_nc_lowbatt_setup(struct platform_device *pd);
+static void sony_nc_lowbatt_cleanup(struct platform_device *pd);
+
 static int sony_nc_fanspeed_setup(struct platform_device *pd);
 static void sony_nc_fanspeed_cleanup(struct platform_device *pd);
 
@@ -1394,6 +1397,12 @@ static void sony_nc_function_setup(struct acpi_device *device,
 				pr_err("couldn't set up keyboard backlight function (%d)\n",
 						result);
 			break;
+		case 0x0121:
+			result = sony_nc_lowbatt_setup(pf_device);
+			if (result)
+				pr_err("couldn't set up low battery function (%d)\n",
+				       result);
+			break;
 		case 0x0149:
 			result = sony_nc_fanspeed_setup(pf_device);
 			if (result)
@@ -1476,6 +1485,9 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x0163:
 			sony_nc_kbd_backlight_cleanup(pd, handle);
 			break;
+		case 0x0121:
+			sony_nc_lowbatt_cleanup(pd);
+			break;
 		case 0x0149:
 			sony_nc_fanspeed_cleanup(pd);
 			break;
@@ -2576,6 +2588,72 @@ static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd)
 	}
 }
 
+/* low battery function */
+static struct device_attribute *lowbatt_handle;
+
+static ssize_t sony_nc_lowbatt_store(struct device *dev,
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
+	if (sony_call_snc_handle(0x0121, value << 8, &result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_lowbatt_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x0121, 0x0200, &result))
+		return -EIO;
+
+	return snprintf(buffer, PAGE_SIZE, "%d\n", result & 1);
+}
+
+static int sony_nc_lowbatt_setup(struct platform_device *pd)
+{
+	unsigned int result;
+
+	lowbatt_handle = kzalloc(sizeof(struct device_attribute), GFP_KERNEL);
+	if (!lowbatt_handle)
+		return -ENOMEM;
+
+	sysfs_attr_init(&lowbatt_handle->attr);
+	lowbatt_handle->attr.name = "lowbatt_hibernate";
+	lowbatt_handle->attr.mode = S_IRUGO | S_IWUSR;
+	lowbatt_handle->show = sony_nc_lowbatt_show;
+	lowbatt_handle->store = sony_nc_lowbatt_store;
+
+	result = device_create_file(&pd->dev, lowbatt_handle);
+	if (result) {
+		kfree(lowbatt_handle);
+		lowbatt_handle = NULL;
+		return result;
+	}
+
+	return 0;
+}
+
+static void sony_nc_lowbatt_cleanup(struct platform_device *pd)
+{
+	if (lowbatt_handle) {
+		device_remove_file(&pd->dev, lowbatt_handle);
+		kfree(lowbatt_handle);
+		lowbatt_handle = NULL;
+	}
+}
+
 /* fan speed function */
 static struct device_attribute *fan_handle, *hsf_handle;
 
-- 
1.9.rc1
