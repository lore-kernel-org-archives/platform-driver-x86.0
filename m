From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v4 1/1] Add WMI driver for controlling AlienFX and HDMI on Alienware
Date: Thu, 27 Feb 2014 14:33:02 -0600
Message-ID: <1393533182-2725-2-git-send-email-mario_limonciello@dell.com>
References: <1393533182-2725-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxippc101.us.dell.com ([143.166.85.207]:15952 "EHLO
	ausxippc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904AbaB0UdU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 27 Feb 2014 15:33:20 -0500
In-Reply-To: <1393533182-2725-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com
Cc: platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

Specifically for platforms that don't contain an AlienFX USB based MCU
such as the Alienware X51 family.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/Kconfig         |   15 ++
 drivers/platform/x86/Makefile        |    1 +
 drivers/platform/x86/alienware-wmi.c |  307 ++++++++++++++++++++++++++++++++++
 3 files changed, 323 insertions(+)
 create mode 100644 drivers/platform/x86/alienware-wmi.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 5ae65c1..640145b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -55,6 +55,21 @@ config ACERHDF
 	  If you have an Acer Aspire One netbook, say Y or M
 	  here.
 
+config ALIENWARE_WMI
+	tristate "Alienware Special feature control"
+	depends on ACPI
+	depends on LEDS_CLASS
+	depends on NEW_LEDS
+	depends on ACPI_WMI
+	---help---
+	 This is a driver for controlling ALienware BIOS driven
+	 features.  It exposes an interface for controlling the AlienFX
+	 zones on Alienware machines that don't contain a dedicated AlienFX
+	 USB MCU such as the X51-R2.
+
+	 If you have an ACPI-WMI compatible Alienware desktop, say Y or M
+	 here.
+
 config ASUS_LAPTOP
 	tristate "Asus Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 9b87cfc..4fddf1a 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -56,3 +56,4 @@ obj-$(CONFIG_INTEL_SMARTCONNECT)	+= intel-smartconnect.o
 
 obj-$(CONFIG_PVPANIC)           += pvpanic.o
 obj-$(CONFIG_INTEL_BAYTRAIL_MBI)	+= intel_baytrail.o
+obj-$(CONFIG_ALIENWARE_WMI)	+= alienware-wmi.o
diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
new file mode 100644
index 0000000..fdffa10
--- /dev/null
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -0,0 +1,307 @@
+/*
+ * Alienware AlienFX control
+ *
+ * Copyright (C) 2014 Dell Inc <mario_limonciello@dell.com>
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
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/dmi.h>
+#include <linux/acpi.h>
+#include <linux/leds.h>
+
+MODULE_AUTHOR("Mario Limonciello <mario_limonciello@dell.com>");
+MODULE_DESCRIPTION("Alienware special feature control");
+MODULE_LICENSE("GPL");
+
+static struct platform_driver platform_driver = {
+	.driver = {
+		.name = "alienware-wmi",
+		.owner = THIS_MODULE,
+	}
+};
+
+static struct platform_device *platform_device;
+
+static const struct dmi_system_id hdmi_device_table[] __initconst = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TBD"),
+		},
+	},
+	{}
+};
+
+MODULE_DEVICE_TABLE(dmi, hdmi_device_table);
+
+#define RUNNING_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
+#define POWERSTATE_CONTROL_GUID		"A80593CE-A997-11DA-B012-B622A1EF5492"
+
+MODULE_ALIAS("wmi:" RUNNING_CONTROL_GUID);
+
+/*
+  Lighting Zone control groups
+*/
+
+#define ALIENWARE_HEAD_ZONE	1
+#define ALIENWARE_LEFT_ZONE	2
+#define ALIENWARE_RIGHT_ZONE	3
+
+enum LIGHTING_CONTROL_STATE {
+	RUNNING = 1,
+	BOOTING = 0,
+	SUSPEND = 3,
+};
+
+struct color_platform {
+	u8 blue;
+	u8 green;
+	u8 red;
+	u8 brightness;
+} __packed;
+
+struct platform_zone {
+	struct color_platform colors;
+	u8 location;
+};
+
+static struct platform_zone head = {
+	.location = ALIENWARE_HEAD_ZONE,
+};
+
+static struct platform_zone left = {
+	.location = ALIENWARE_LEFT_ZONE,
+};
+
+static struct platform_zone right = {
+	.location = ALIENWARE_RIGHT_ZONE,
+};
+
+static void update_leds(u8 lighting_state, struct platform_zone zone)
+{
+	acpi_status status;
+	char *guid;
+	struct acpi_buffer input;
+	struct platform_zone args;
+	if (lighting_state == BOOTING || lighting_state == SUSPEND) {
+		guid = POWERSTATE_CONTROL_GUID;
+		args.colors = zone.colors;
+		args.location = lighting_state;
+		input.length = (acpi_size) sizeof(args);
+		input.pointer = &args;
+	} else {
+		guid = RUNNING_CONTROL_GUID;
+		input.length = (acpi_size) sizeof(zone.colors);
+		input.pointer = &zone.colors;
+	}
+	pr_debug("alienware-wmi: evaluate [ guid %s | zone %d ]\n",
+		guid, zone.location);
+
+	status = wmi_evaluate_method(guid, 1, zone.location, &input, NULL);
+	if (ACPI_FAILURE(status))
+		pr_err("alienware-wmi: zone set failure: %u\n", status);
+}
+
+/*
+	The atomic device is a representation of the LED's in a given
+	zone.  It modifies all color components at the same time.
+	It ranges from 0x00000000 to 0x0f0f0f0f.
+	the components are in this order:
+	0x [Brightness] [ red ] [ green ] [ blue]
+*/
+#define ALIEN_CREATE_ATOMIC_DEVICE(_state, _zone)			\
+	static void _state##_##_zone##_set(				\
+	struct led_classdev *led_cdev, enum led_brightness value)	\
+	{								\
+		union color_union {					\
+			struct color_platform cp;			\
+			int package;					\
+		} repackager;						\
+		repackager.package = value & 0x0f0f0f0f;		\
+		pr_debug("alienware-wmi: br: %d r: %d g:%d b: %d\n",	\
+			repackager.cp.brightness, repackager.cp.red,	\
+			repackager.cp.green, repackager.cp.blue);	\
+		_zone.colors = repackager.cp;				\
+		update_leds(_state, _zone);				\
+	}								\
+									\
+	static struct led_classdev _state##_##_zone##_led = {\
+		.brightness_set = _state##_##_zone##_set,		\
+		.max_brightness = 0x0F0F0F0F,				\
+		.name = __stringify(alienware_state##_##_zone),\
+	};								\
+
+ALIEN_CREATE_ATOMIC_DEVICE(RUNNING, head);
+ALIEN_CREATE_ATOMIC_DEVICE(RUNNING, left);
+ALIEN_CREATE_ATOMIC_DEVICE(RUNNING, right);
+
+ALIEN_CREATE_ATOMIC_DEVICE(BOOTING, head);
+ALIEN_CREATE_ATOMIC_DEVICE(BOOTING, left);
+ALIEN_CREATE_ATOMIC_DEVICE(BOOTING, right);
+
+ALIEN_CREATE_ATOMIC_DEVICE(SUSPEND, head);
+ALIEN_CREATE_ATOMIC_DEVICE(SUSPEND, left);
+ALIEN_CREATE_ATOMIC_DEVICE(SUSPEND, right);
+
+
+static int alienware_zone_init(struct device *dev)
+{
+	led_classdev_register(dev, &RUNNING_head_led);
+	led_classdev_register(dev, &RUNNING_left_led);
+	led_classdev_register(dev, &RUNNING_right_led);
+	led_classdev_register(dev, &BOOTING_head_led);
+	led_classdev_register(dev, &BOOTING_left_led);
+	led_classdev_register(dev, &BOOTING_right_led);
+	led_classdev_register(dev, &SUSPEND_head_led);
+	led_classdev_register(dev, &SUSPEND_left_led);
+	led_classdev_register(dev, &SUSPEND_right_led);
+	return 0;
+}
+
+static void alienware_zone_exit(void)
+{
+	led_classdev_unregister(&RUNNING_head_led);
+	led_classdev_unregister(&RUNNING_right_led);
+	led_classdev_unregister(&RUNNING_left_led);
+	led_classdev_unregister(&BOOTING_head_led);
+	led_classdev_unregister(&BOOTING_right_led);
+	led_classdev_unregister(&BOOTING_left_led);
+	led_classdev_unregister(&SUSPEND_head_led);
+	led_classdev_unregister(&SUSPEND_right_led);
+	led_classdev_unregister(&SUSPEND_left_led);
+}
+
+/*
+	The HDMI mux sysfs node indicates the status of the HDMI input mux.
+	It can toggle between standard system GPU output and HDMI input.
+*/
+
+static ssize_t show_hdmi(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	acpi_status status;
+	status = wmi_evaluate_method(RUNNING_CONTROL_GUID, 3, 0, NULL, NULL);
+	if (status == 1) {
+		sprintf(buf, "hdmi-in\n");
+		return 0;
+	} else if (status == 2) {
+		sprintf(buf, "gpu\n");
+		return 0;
+	}
+	pr_err("alienware-wmi: HDMI mux read failed: results: %u\n", status);
+	return status;
+}
+
+static ssize_t toggle_hdmi(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	acpi_status status;
+	status = wmi_evaluate_method(RUNNING_CONTROL_GUID, 2, 3, NULL, NULL);
+	if (ACPI_FAILURE(status))
+		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n",
+			   status);
+	return count;
+}
+
+static DEVICE_ATTR(hdmi, S_IRUGO | S_IWUSR, show_hdmi, toggle_hdmi);
+
+static void remove_hdmi(struct platform_device *device)
+{
+	device_remove_file(&device->dev, &dev_attr_hdmi);
+}
+
+static int create_hdmi(void)
+{
+	int ret = -ENOMEM;
+
+	ret = device_create_file(&platform_device->dev, &dev_attr_hdmi);
+	if (ret)
+		goto error_create_hdmi;
+	return 0;
+
+error_create_hdmi:
+	remove_hdmi(platform_device);
+	return ret;
+}
+
+static int __init alienware_wmi_init(void)
+{
+	int ret;
+
+	if (!wmi_has_guid(RUNNING_CONTROL_GUID)) {
+		pr_warn("No known WMI GUID found\n");
+		return -ENODEV;
+	}
+
+	ret = platform_driver_register(&platform_driver);
+	if (ret)
+		goto fail_platform_driver;
+	platform_device = platform_device_alloc("alienware-wmi", -1);
+	if (!platform_device) {
+		ret = -ENOMEM;
+		goto fail_platform_device1;
+	}
+	ret = platform_device_add(platform_device);
+	if (ret)
+		goto fail_platform_device2;
+
+	/*
+		HDMI mux control is on the WMAW method too
+		but only on certain systems.
+	*/
+	if (dmi_check_system(hdmi_device_table)) {
+		ret = create_hdmi();
+		if (ret)
+			goto fail_prep_hdmi;
+	}
+	/*
+		Non-MCU driven lighting control
+	*/
+	if (wmi_has_guid(RUNNING_CONTROL_GUID)) {
+		ret = alienware_zone_init(&platform_device->dev);
+		if (ret)
+			goto fail_prep_zones;
+	}
+
+	return 0;
+
+fail_prep_zones:
+	alienware_zone_exit();
+fail_prep_hdmi:
+	platform_device_del(platform_device);
+fail_platform_device2:
+	platform_device_put(platform_device);
+fail_platform_device1:
+	platform_driver_unregister(&platform_driver);
+fail_platform_driver:
+	return ret;
+}
+
+module_init(alienware_wmi_init);
+
+static void __exit alienware_wmi_exit(void)
+{
+	alienware_zone_exit();
+	remove_hdmi(platform_device);
+	if (platform_device) {
+		platform_device_unregister(platform_device);
+		platform_driver_unregister(&platform_driver);
+	}
+}
+
+module_exit(alienware_wmi_exit);
-- 
1.7.9.5
