From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v3] Add driver to force WMI Thunderbolt controller power status
Date: Fri,  8 Sep 2017 10:23:11 -0500
Message-ID: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:14619 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752485AbdIHPYa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Sep 2017 11:24:30 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Richard Hughes <hughsient@gmail.com>, Yehezkel Bernat <yehezkelshb@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mario Limonciello <mario.limonciello@dell.com>

Current implementations of Intel Thunderbolt controllers will go
into a low power mode when not in use.

Many machines containing these controllers also have a GPIO wired up
that can force the controller awake.  This is offered via a ACPI-WMI
interface intended to be manipulated by a userspace utility.

This mechanism is provided by Intel to OEMs to include in BIOS.
It uses an industry wide GUID that is populated in a separate _WDG
entry with no binary MOF.

This interface allows software such as fwupd to wake up thunderbolt
controllers to query the firmware version or flash new firmware.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
changes from v2 to v3:
 * Fix typographical error
 * Send KOBJ_CHANGE event
 
changes from v1 to v2:
 * Add ABI documentation
 * Update thunderbolt.rst
 * Remove unnecessary cast
 * Remove unneeded whitespace
 * Adjust references of "Intel Wmi thunderbolt" -> 
   "Intel WMI thunderbolt force power"

 .../testing/sysfs-platform-intel-wmi-thunderbolt   |  11 +++
 Documentation/admin-guide/thunderbolt.rst          |  15 +++
 MAINTAINERS                                        |   5 +
 drivers/platform/x86/Kconfig                       |  13 +++
 drivers/platform/x86/Makefile                      |   1 +
 drivers/platform/x86/intel-wmi-thunderbolt.c       | 101 +++++++++++++++++++++
 6 files changed, 146 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt
 create mode 100644 drivers/platform/x86/intel-wmi-thunderbolt.c

diff --git a/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt b/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt
new file mode 100644
index 0000000..bf3dedb
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt
@@ -0,0 +1,11 @@
+What:		/sys/devices/platform/<platform>/force_power
+Date:		September 2017
+KernelVersion:	4.14
+Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
+Description:
+		Modify the platform force power state, influencing
+		Thunderbolt controllers to turn on or off when no
+		devices are connected (write-only)
+		There are two available states:
+		    * 0 -> Force power disabled
+		    * 1 -> Force power enabled
diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index 6a4cd1f..dadcd66 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -197,3 +197,18 @@ information is missing.
 
 To recover from this mode, one needs to flash a valid NVM image to the
 host host controller in the same way it is done in the previous chapter.
+
+Forcing power
+-------------
+Many OEMs include a method that can be used to force the power of a
+thunderbolt controller to an "On" state even if nothing is connected.
+If supported by your machine this will be exposed by the WMI bus with
+a sysfs attribute called "force_power".
+
+For example the intel-wmi-thunderbolt driver exposes this attribute in:
+  /sys/devices/platform/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/86CCFD48-205E-4A77-9C48-2021CBEDE341/force_power
+
+  To force the power to on, write 1 to this attribute file.
+  To disable force power, write 0 to this attribute file.
+
+Note: it's currently not possible to query the force power state of a platform.
diff --git a/MAINTAINERS b/MAINTAINERS
index 1c3feff..9a6b73e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3949,6 +3949,11 @@ M:	Pali Rohár <pali.rohar@gmail.com>
 S:	Maintained
 F:	drivers/platform/x86/dell-wmi.c
 
+INTEL WMI THUNDERBOLT FORCE POWER DRIVER
+M:	Mario Limonciello <mario.limonciello@dell.com>
+S:	Maintained
+F:	drivers/platform/x86/intel-wmi-thunderbolt.c
+
 DELTA ST MEDIA DRIVER
 M:	Hugues Fruchet <hugues.fruchet@st.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 80b8795..f401ae4 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -658,6 +658,19 @@ config WMI_BMOF
 	  To compile this driver as a module, choose M here: the module will
 	  be called wmi-bmof.
 
+config INTEL_WMI_THUNDERBOLT
+	tristate "Intel WMI thunderbolt force power driver"
+	depends on ACPI_WMI
+	default ACPI_WMI
+	---help---
+	  Say Y here if you want to be able to use the WMI interface on select
+	  systems to force the power control of Intel Thunderbolt controllers.
+	  This is useful for updating the firmware when devices are not plugged
+	  into the controller.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called intel-wmi-thunderbolt.
+
 config MSI_WMI
 	tristate "MSI WMI extras"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 91cec17..2b315d0 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_PEAQ_WMI)		+= peaq-wmi.o
 obj-$(CONFIG_SURFACE3_WMI)	+= surface3-wmi.o
 obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
 obj-$(CONFIG_WMI_BMOF)		+= wmi-bmof.o
+obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= intel-wmi-thunderbolt.o
 
 # toshiba_acpi must link after wmi to ensure that wmi devices are found
 # before toshiba_acpi initializes
diff --git a/drivers/platform/x86/intel-wmi-thunderbolt.c b/drivers/platform/x86/intel-wmi-thunderbolt.c
new file mode 100644
index 0000000..32fb6cc
--- /dev/null
+++ b/drivers/platform/x86/intel-wmi-thunderbolt.c
@@ -0,0 +1,101 @@
+/*
+ * WMI Thunderbolt driver
+ *
+ * Copyright (C) 2017 Dell Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify it
+ *  under the terms of the GNU General Public License version 2 as published
+ *  by the Free Software Foundation.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#define INTEL_WMI_THUNDERBOLT_GUID "86CCFD48-205E-4A77-9C48-2021CBEDE341"
+
+static ssize_t force_power_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct acpi_buffer input;
+	acpi_status status;
+	u8 mode;
+
+	input.length = sizeof(u8);
+	input.pointer = &mode;
+	mode = hex_to_bin(buf[0]);
+	if (mode == 0 || mode == 1) {
+		status = wmi_evaluate_method(INTEL_WMI_THUNDERBOLT_GUID, 0, 1,
+					     &input, NULL);
+		if (ACPI_FAILURE(status)) {
+			pr_err("intel-wmi-thunderbolt: failed setting %s\n",
+			       buf);
+			return -ENODEV;
+		}
+	} else {
+		pr_err("intel-wmi-thunderbolt: unsupported mode: %d", mode);
+	}
+	return count;
+}
+
+static DEVICE_ATTR_WO(force_power);
+
+static struct attribute *tbt_attrs[] = {
+	&dev_attr_force_power.attr,
+	NULL
+};
+
+static const struct attribute_group tbt_attribute_group = {
+	.attrs = tbt_attrs,
+};
+
+static int intel_wmi_thunderbolt_probe(struct wmi_device *wdev)
+{
+	int ret;
+
+	ret = sysfs_create_group(&wdev->dev.kobj, &tbt_attribute_group);
+	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
+	return ret;
+}
+
+static int intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
+{
+	sysfs_remove_group(&wdev->dev.kobj, &tbt_attribute_group);
+	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
+	return 0;
+}
+
+static const struct wmi_device_id intel_wmi_thunderbolt_id_table[] = {
+	{ .guid_string = INTEL_WMI_THUNDERBOLT_GUID },
+	{ },
+};
+
+static struct wmi_driver intel_wmi_thunderbolt_driver = {
+	.driver = {
+		.name = "intel-wmi-thunderbolt",
+	},
+	.probe = intel_wmi_thunderbolt_probe,
+	.remove = intel_wmi_thunderbolt_remove,
+	.id_table = intel_wmi_thunderbolt_id_table,
+};
+
+module_wmi_driver(intel_wmi_thunderbolt_driver);
+
+MODULE_ALIAS("wmi:" INTEL_WMI_THUNDERBOLT_GUID);
+MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
+MODULE_DESCRIPTION("Intel WMI Thunderbolt force power driver");
+MODULE_LICENSE("GPL");
-- 
2.7.4
