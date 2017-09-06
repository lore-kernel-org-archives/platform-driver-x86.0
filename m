From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH] Add driver to force WMI Thunderbolt controller power status
Date: Wed,  6 Sep 2017 12:54:00 -0500
Message-ID: <1504720440-24423-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Richard Hughes <hughsient@gmail.com>, Yehezkel Bernat <yehezkelshb@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Current implementations of Intel Thunderbolt controllers will go
into a low power mode when not in use.

Many machines containing these controllers also have a GPIO wired up
that can force the controller awake.  This is offered via a ACPI-WMI
interface intended to be manipulated by a userspace utility.

This mechanism is provided by Intel to OEMs to include in BIOS.
It uses an industry wide GUID that is populated in a separate _WDG
entry with no binary MOF.

This interface allow software such as fwupd to wake up thunderbolt
controllers to query the firmware version or flash new firmware.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 MAINTAINERS                                  |  5 ++
 drivers/platform/x86/Kconfig                 | 13 ++++
 drivers/platform/x86/Makefile                |  1 +
 drivers/platform/x86/intel-wmi-thunderbolt.c | 97 ++++++++++++++++++++++++++++
 4 files changed, 116 insertions(+)
 create mode 100644 drivers/platform/x86/intel-wmi-thunderbolt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c3feff..375bea9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3949,6 +3949,11 @@ M:	Pali Rohár <pali.rohar@gmail.com>
 S:	Maintained
 F:	drivers/platform/x86/dell-wmi.c
 
+INTEL WMI THUNDERBOLT DRIVER
+M:	Mario Limonciello <mario.limonciello@dell.com>
+S:	Maintained
+F:	drivers/platform/x86/intel-wmi-thunderbolt.c
+
 DELTA ST MEDIA DRIVER
 M:	Hugues Fruchet <hugues.fruchet@st.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 80b8795..6670a8d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -658,6 +658,19 @@ config WMI_BMOF
 	  To compile this driver as a module, choose M here: the module will
 	  be called wmi-bmof.
 
+config INTEL_WMI_THUNDERBOLT
+	tristate "Intel WMI thunderbolt driver"
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
index 0000000..98f60f2
--- /dev/null
+++ b/drivers/platform/x86/intel-wmi-thunderbolt.c
@@ -0,0 +1,97 @@
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
+
+static ssize_t force_power_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct acpi_buffer input;
+	acpi_status status;
+	u8 mode;
+
+	input.length = (acpi_size) (sizeof(u8));
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
+	return sysfs_create_group(&wdev->dev.kobj, &tbt_attribute_group);
+}
+
+static int intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
+{
+	sysfs_remove_group(&wdev->dev.kobj, &tbt_attribute_group);
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
