From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 4/7] sony-laptop: add usb charge function
Date: Mon, 10 Feb 2014 08:07:31 +0900
Message-ID: <1391987254-3103-5-git-send-email-malattia@linux.it>
References: <1391987254-3103-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:46367 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751938AbaBIXNv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 9 Feb 2014 18:13:51 -0500
In-Reply-To: <1391987254-3103-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <jachirica@gmail.com>, Mattia Dongili <malattia@linux.it>

From: Javier Achirica <jachirica@gmail.com>

Allows to specify if the USB socket should charge attached devices while
the laptop is suspended to ram.

Signed-off-by: Javier Achirica <jachirica@gmail.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 86 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index d1f712e..9620285 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -164,6 +164,9 @@ static int __sony_nc_gfx_switch_status_get(void);
 static int sony_nc_highspeed_charging_setup(struct platform_device *pd);
 static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd);
 
+static int sony_nc_usb_charge_setup(struct platform_device *pd);
+static void sony_nc_usb_charge_cleanup(struct platform_device *pd);
+
 static int sony_nc_panelid_setup(struct platform_device *pd);
 static void sony_nc_panelid_cleanup(struct platform_device *pd);
 
@@ -1388,6 +1391,12 @@ static void sony_nc_function_setup(struct acpi_device *device,
 				pr_err("couldn't set up keyboard backlight function (%d)\n",
 						result);
 			break;
+		case 0x0155:
+			result = sony_nc_usb_charge_setup(pf_device);
+			if (result)
+				pr_err("couldn't set up USB charge support (%d)\n",
+						result);
+			break;
 		case 0x011D:
 			result = sony_nc_panelid_setup(pf_device);
 			if (result)
@@ -1458,6 +1467,9 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x0163:
 			sony_nc_kbd_backlight_cleanup(pd, handle);
 			break;
+		case 0x0155:
+			sony_nc_usb_charge_cleanup(pd);
+			break;
 		case 0x011D:
 			sony_nc_panelid_cleanup(pd);
 			break;
@@ -2552,6 +2564,80 @@ static void sony_nc_highspeed_charging_cleanup(struct platform_device *pd)
 	}
 }
 
+/* USB charge function */
+static struct device_attribute *uc_handle;
+
+static ssize_t sony_nc_usb_charge_store(struct device *dev,
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
+	if (sony_call_snc_handle(0x0155, value << 0x10 | 0x0100, &result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_usb_charge_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x0155, 0x0000, &result))
+		return -EIO;
+
+	return snprintf(buffer, PAGE_SIZE, "%d\n", result & 0x01);
+}
+
+static int sony_nc_usb_charge_setup(struct platform_device *pd)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(0x0155, 0x0000, &result) || !(result & 0x01)) {
+		/* some models advertise the handle but have no implementation
+		 * for it
+		 */
+		pr_info("No USB Charge capability found\n");
+		return 0;
+	}
+
+	uc_handle = kzalloc(sizeof(struct device_attribute), GFP_KERNEL);
+	if (!uc_handle)
+		return -ENOMEM;
+
+	sysfs_attr_init(&uc_handle->attr);
+	uc_handle->attr.name = "usb_charge";
+	uc_handle->attr.mode = S_IRUGO | S_IWUSR;
+	uc_handle->show = sony_nc_usb_charge_show;
+	uc_handle->store = sony_nc_usb_charge_store;
+
+	result = device_create_file(&pd->dev, uc_handle);
+	if (result) {
+		kfree(uc_handle);
+		uc_handle = NULL;
+		return result;
+	}
+
+	return 0;
+}
+
+static void sony_nc_usb_charge_cleanup(struct platform_device *pd)
+{
+	if (uc_handle) {
+		device_remove_file(&pd->dev, uc_handle);
+		kfree(uc_handle);
+		uc_handle = NULL;
+	}
+}
+
 /* Panel ID function */
 static struct device_attribute *panel_handle;
 
-- 
1.9.rc1
