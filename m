From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 05/11] sony-laptop: add fan speed regulation function
Date: Fri, 21 Mar 2014 08:01:16 +0900
Message-ID: <1395356482-7446-6-git-send-email-malattia@linux.it>
References: <1395356482-7446-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:42144 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759160AbaCTXJM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Mar 2014 19:09:12 -0400
In-Reply-To: <1395356482-7446-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <jachirica@gmail.com>, Mattia Dongili <malattia@linux.it>

From: Javier Achirica <jachirica@gmail.com>

Rework error exit logic by Mattia Dongili.

Signed-off-by: Javier Achirica <jachirica@gmail.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 119 +++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 9620285..7b5a56d 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -164,6 +164,9 @@ static int __sony_nc_gfx_switch_status_get(void);
 static int sony_nc_highspeed_charging_setup(struct platform_device *pd);
 static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd);
 
+static int sony_nc_fanspeed_setup(struct platform_device *pd);
+static void sony_nc_fanspeed_cleanup(struct platform_device *pd);
+
 static int sony_nc_usb_charge_setup(struct platform_device *pd);
 static void sony_nc_usb_charge_cleanup(struct platform_device *pd);
 
@@ -1391,6 +1394,12 @@ static void sony_nc_function_setup(struct acpi_device *device,
 				pr_err("couldn't set up keyboard backlight function (%d)\n",
 						result);
 			break;
+		case 0x0149:
+			result = sony_nc_fanspeed_setup(pf_device);
+			if (result)
+				pr_err("couldn't set up fan speed function (%d)\n",
+				       result);
+			break;
 		case 0x0155:
 			result = sony_nc_usb_charge_setup(pf_device);
 			if (result)
@@ -1467,6 +1476,9 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x0163:
 			sony_nc_kbd_backlight_cleanup(pd, handle);
 			break;
+		case 0x0149:
+			sony_nc_fanspeed_cleanup(pd);
+			break;
 		case 0x0155:
 			sony_nc_usb_charge_cleanup(pd);
 			break;
@@ -2564,6 +2576,113 @@ static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd)
 	}
 }
 
+/* fan speed function */
+static struct device_attribute *fan_handle, *hsf_handle;
+
+static ssize_t sony_nc_hsfan_store(struct device *dev,
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
+	if (sony_call_snc_handle(0x0149, value << 0x10 | 0x0200, &result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_hsfan_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x0149, 0x0100, &result))
+		return -EIO;
+
+	return snprintf(buffer, PAGE_SIZE, "%d\n", result & 0x01);
+}
+
+static ssize_t sony_nc_fanspeed_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x0149, 0x0300, &result))
+		return -EIO;
+
+	return snprintf(buffer, PAGE_SIZE, "%d\n", result & 0xff);
+}
+
+static int sony_nc_fanspeed_setup(struct platform_device *pd)
+{
+	unsigned int result;
+
+	fan_handle = kzalloc(sizeof(struct device_attribute), GFP_KERNEL);
+	if (!fan_handle)
+		return -ENOMEM;
+
+	hsf_handle = kzalloc(sizeof(struct device_attribute), GFP_KERNEL);
+	if (!hsf_handle) {
+		result = -ENOMEM;
+		goto out_hsf_handle_alloc;
+	}
+
+	sysfs_attr_init(&fan_handle->attr);
+	fan_handle->attr.name = "fanspeed";
+	fan_handle->attr.mode = S_IRUGO;
+	fan_handle->show = sony_nc_fanspeed_show;
+	fan_handle->store = NULL;
+
+	sysfs_attr_init(&hsf_handle->attr);
+	hsf_handle->attr.name = "fan_forced";
+	hsf_handle->attr.mode = S_IRUGO | S_IWUSR;
+	hsf_handle->show = sony_nc_hsfan_show;
+	hsf_handle->store = sony_nc_hsfan_store;
+
+	result = device_create_file(&pd->dev, fan_handle);
+	if (result)
+		goto out_fan_handle;
+
+	result = device_create_file(&pd->dev, hsf_handle);
+	if (result)
+		goto out_hsf_handle;
+
+	return 0;
+
+out_hsf_handle:
+	device_remove_file(&pd->dev, fan_handle);
+
+out_fan_handle:
+	kfree(hsf_handle);
+	hsf_handle = NULL;
+
+out_hsf_handle_alloc:
+	kfree(fan_handle);
+	fan_handle = NULL;
+	return result;
+}
+
+static void sony_nc_fanspeed_cleanup(struct platform_device *pd)
+{
+	if (fan_handle) {
+		device_remove_file(&pd->dev, fan_handle);
+		kfree(fan_handle);
+		fan_handle = NULL;
+	}
+	if (hsf_handle) {
+		device_remove_file(&pd->dev, hsf_handle);
+		kfree(hsf_handle);
+		hsf_handle = NULL;
+	}
+}
+
 /* USB charge function */
 static struct device_attribute *uc_handle;
 
-- 
1.9.0
