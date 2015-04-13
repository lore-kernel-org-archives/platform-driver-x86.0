From: gavinli@thegavinli.com
Subject: [PATCH] platform: add samsung-wmi driver for newer Samsung laptops
Date: Mon, 13 Apr 2015 01:21:45 -0700
Message-ID: <1428913305-27473-2-git-send-email-gavinli@thegavinli.com>
References: <alpine.LNX.2.03.1504130851490.1155@localhost.localdomain>
 <1428913305-27473-1-git-send-email-gavinli@thegavinli.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:33858 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751604AbbDMIWO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Apr 2015 04:22:14 -0400
Received: by pdbqa5 with SMTP id qa5so99599887pdb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Apr 2015 01:22:13 -0700 (PDT)
In-Reply-To: <1428913305-27473-1-git-send-email-gavinli@thegavinli.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: giedrius.statkevicius@gmail.com
Cc: platform-driver-x86@vger.kernel.org, Gavin Li <git@thegavinli.com>

From: Gavin Li <git@thegavinli.com>

This driver adds support for coarse (on or off) fan control and
the keyboard backlight on newer Samsung laptops.
---
 drivers/platform/x86/Kconfig       |  10 ++
 drivers/platform/x86/Makefile      |   1 +
 drivers/platform/x86/samsung-wmi.c | 217 +++++++++++++++++++++++++++++++++++++
 3 files changed, 228 insertions(+)
 create mode 100644 drivers/platform/x86/samsung-wmi.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9752761..96f4620 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -813,6 +813,16 @@ config SAMSUNG_LAPTOP
 	  To compile this driver as a module, choose M here: the module
 	  will be called samsung-laptop.
 
+config SAMSUNG_WMI
+	tristate "Samsung WMI driver (for newer Samsung laptops)"
+	depends on ACPI
+	depends on ACPI_WMI
+	select LEDS_CLASS
+	select NEW_LEDS
+	  ---help---
+	  This driver adds support for coarse (on or off) fan control
+	  and the keyboard backlight for newer Samsung laptops.
+
 config MXM_WMI
        tristate "WMI support for MXM Laptop Graphics"
        depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index f82232b..4c65e51 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
 obj-$(CONFIG_XO15_EBOOK)	+= xo15-ebook.o
 obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
 obj-$(CONFIG_SAMSUNG_LAPTOP)	+= samsung-laptop.o
+obj-$(CONFIG_SAMSUNG_WMI)	+= samsung-wmi.o
 obj-$(CONFIG_MXM_WMI)		+= mxm-wmi.o
 obj-$(CONFIG_INTEL_MID_POWER_BUTTON)	+= intel_mid_powerbtn.o
 obj-$(CONFIG_INTEL_OAKTRAIL)	+= intel_oaktrail.o
diff --git a/drivers/platform/x86/samsung-wmi.c b/drivers/platform/x86/samsung-wmi.c
new file mode 100644
index 0000000..dfc4212
--- /dev/null
+++ b/drivers/platform/x86/samsung-wmi.c
@@ -0,0 +1,217 @@
+/*
+ *  Samsung WMI driver
+ *
+ *  Copyright (C) 2015 Gavin Li <git@thegavinli.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License along
+ *  with this program; if not, write to the Free Software Foundation, Inc.,
+ *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/leds.h>
+#include <linux/platform_device.h>
+
+#define DRIVER_NAME "samsung-wmi"
+#define WMI_GUID "C16C47BA-50E3-444A-AF3A-B1C348380001"
+
+struct samsung_wmi_packet {
+	uint16_t magic;
+	uint16_t opcode;
+	uint8_t reqres;
+	uint8_t data[16];
+} __packed;
+
+static struct platform_device *samsung_wmi_device;
+
+static inline bool string_matches(const char *str, const char *kwd) {
+	size_t len = strlen(kwd);
+	if (strncmp(str, kwd, len) != 0)
+		return false;
+	return str[len] == '\0' || str[len] == '\n';
+}
+
+static int samsung_wmi_method_call(uint16_t opcode, void *data, size_t len) {
+	struct samsung_wmi_packet inpkt = {
+		.magic = 0x5843,
+		.opcode = opcode,
+	};
+	struct acpi_buffer inbuf = { sizeof(inpkt), &inpkt };
+	struct acpi_buffer outbuf = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *outobj;
+	struct samsung_wmi_packet *outpkt;
+	acpi_status st;
+	int ret = -EIO;
+	if (len > 16) {
+		ret = -EINVAL;
+		goto err_no_free;
+	}
+	memcpy(inpkt.data, data, len);
+	st = wmi_evaluate_method(WMI_GUID, 1, 0, &inbuf, &outbuf);
+	if (ACPI_FAILURE(st)) {
+		dev_err(&samsung_wmi_device->dev, "opcode 0x%x failed: %s\n",
+				opcode, acpi_format_exception(st));
+		goto err_no_free;
+	}
+	outobj = outbuf.pointer;
+	if (outobj->type != ACPI_TYPE_BUFFER)
+		goto err_free_outobj;
+	if (outobj->buffer.length < sizeof(outpkt))
+		goto err_free_outobj;
+	outpkt = (struct samsung_wmi_packet *)outobj->buffer.pointer;
+	memcpy(data, outpkt->data, len);
+	ret = 0;
+err_free_outobj:
+	kfree(outobj);
+err_no_free:
+	return ret;
+}
+
+static int samsung_wmi_method_call_with_unlock(
+		uint16_t unlock_opcode,
+		uint16_t opcode, void *data, size_t len) {
+	unsigned int unlock_data = 0xAABB;
+	int ret;
+	ret = samsung_wmi_method_call(unlock_opcode, &unlock_data, sizeof(unlock_data));
+	if (ret)
+		goto err;
+	if (unlock_data != 0xCCDD) {
+		dev_err(&samsung_wmi_device->dev, "incorrect unlock response!\n");
+		ret = -EIO;
+		goto err;
+	}
+	ret = samsung_wmi_method_call(opcode, data, len);
+err:
+	return ret;
+}
+
+static ssize_t samsung_wmi_fan_mode_show(struct device *dev, struct device_attribute *attr,
+		char *buf) {
+	uint32_t data = 0;
+	if (samsung_wmi_method_call_with_unlock(0x31, 0x31, &data, sizeof(data)))
+		return -EIO;
+	if (data)
+		strcpy(buf, "[auto off] on\n");
+	else
+		strcpy(buf, "auto off [on]\n");
+	return strlen(buf);
+}
+
+static ssize_t samsung_wmi_fan_mode_store(struct device *dev, struct device_attribute *attr,
+		const char *buf, size_t count) {
+	uint32_t data;
+	if (string_matches(buf, "auto"))
+		data = 0x810001;
+	else if (string_matches(buf, "on"))
+		data = 0;
+	else if (string_matches(buf, "off"))
+		data = 0x800001;
+	else
+		return -EINVAL;
+	if (samsung_wmi_method_call_with_unlock(0x31, 0x32, &data, sizeof(data)))
+		return -EIO;
+	else
+		return count;
+}
+
+static void samsung_wmi_kbd_backlight_led_brightness_set(
+		struct led_classdev *cdev, enum led_brightness brightness) {
+	unsigned int data = brightness;
+	if (data > 4)
+		data = 4;
+	data = (data << 8) | 0x82;
+	samsung_wmi_method_call_with_unlock(0x78, 0x78, &data, sizeof(data));
+}
+
+static DEVICE_ATTR(fan_mode, S_IRUGO | S_IWUSR, samsung_wmi_fan_mode_show, samsung_wmi_fan_mode_store);
+
+static struct platform_driver samsung_wmi_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+	},
+};
+
+static struct led_classdev samsung_wmi_kbd_backlight_led = {
+	.name = DRIVER_NAME "::kbd_backlight",
+	.max_brightness = 4,
+	.brightness_set = samsung_wmi_kbd_backlight_led_brightness_set,
+};
+
+static int kb_default_brightness = -1;
+module_param(kb_default_brightness, int, S_IRUGO);
+MODULE_PARM_DESC(kb_default_brightness,
+		"Default keyboard backlight brightness right after initialization");
+
+static int samsung_wmi_init(void) {
+	int ret;
+
+	// check whether method is present
+	if (!wmi_has_guid(WMI_GUID))
+		return -ENODEV;
+
+	// we're good to go
+	ret = platform_driver_register(&samsung_wmi_driver);
+	if (ret)
+		goto err_no_free;
+
+	samsung_wmi_device = platform_device_alloc(DRIVER_NAME, -1);
+	if (!samsung_wmi_device) {
+		ret = -ENOMEM;
+		goto err_unregister_driver;
+	}
+
+	ret = platform_device_add(samsung_wmi_device);
+	if (ret)
+		goto err_put_device;
+
+	ret = device_create_file(&samsung_wmi_device->dev, &dev_attr_fan_mode);
+	if (ret)
+		goto err_del_device;
+
+	ret = led_classdev_register(&samsung_wmi_device->dev,
+			&samsung_wmi_kbd_backlight_led);
+	if (ret)
+		goto err_remove_file;
+
+	if (kb_default_brightness >= 0)
+		led_set_brightness(&samsung_wmi_kbd_backlight_led, kb_default_brightness);
+
+	return 0;
+
+err_remove_file:
+	device_remove_file(&samsung_wmi_device->dev, &dev_attr_fan_mode);
+err_del_device:
+	platform_device_del(samsung_wmi_device);
+err_put_device:
+	platform_device_put(samsung_wmi_device);
+err_unregister_driver:
+	platform_driver_unregister(&samsung_wmi_driver);
+err_no_free:
+	return ret;
+}
+
+static void samsung_wmi_exit(void) {
+	led_classdev_unregister(&samsung_wmi_kbd_backlight_led);
+	device_remove_file(&samsung_wmi_device->dev, &dev_attr_fan_mode);
+	platform_device_unregister(samsung_wmi_device);
+	platform_driver_unregister(&samsung_wmi_driver);
+}
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gavin Li");
+MODULE_DESCRIPTION("WMI driver for some Samsung laptops.");
+MODULE_ALIAS("wmi:" WMI_GUID);
+module_init(samsung_wmi_init);
+module_exit(samsung_wmi_exit);
-- 
2.3.5
