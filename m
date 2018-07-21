From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] x86: czc-tablet: add driver that fixes the buttons on CZC P10T tablet
Date: Sun, 22 Jul 2018 00:36:30 +0200
Message-ID: <20180721223630.24559-1-lkundrak@v3.sk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: platform-driver-x86.vger.kernel.org

This driver switches the P10T tablet to "Android" mode, where the Home
button sends a single sancode instead of a Windows-specific key
combination and the other button doesn't disable the Wi-Fi.

The driver also supports the ViewSonic ViewPad 10 which is almost identical
to P10T.

Complementary hwdb patch with the scan code mapping:
https://github.com/systemd/systemd/commit/40a3078b.patch

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 MAINTAINERS                       |  6 +++
 drivers/platform/x86/Kconfig      |  8 ++++
 drivers/platform/x86/Makefile     |  1 +
 drivers/platform/x86/czc-tablet.c | 80 +++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 drivers/platform/x86/czc-tablet.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 07d1576fc766..64bd3f330f85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3979,6 +3979,12 @@ S:	Supported
 F:	drivers/input/touchscreen/cyttsp*
 F:	include/linux/input/cyttsp.h
 
+CZC TABLET DRIVER
+M:	Lubomir Rintel <lkundrak@v3.sk>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/czc-tablet.c
+
 D-LINK DIR-685 TOUCHKEYS DRIVER
 M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-input@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index ac4d48830415..4ec8576129dc 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1218,6 +1218,14 @@ config INTEL_CHTDC_TI_PWRBTN
 	  To compile this driver as a module, choose M here: the module
 	  will be called intel_chtdc_ti_pwrbtn.
 
+config CZC_TABLET
+        tristate "CZC Tablet Extras"
+        help
+          This driver adds support for buttons on a CZC ODEON TPC-10 ("P10T")
+          and ViewSonic ViewPad 10 tablet computers.
+
+	  If you have an 10" CZC or ViewSonic tablet, say Y or M here.
+
 endif # X86_PLATFORM_DEVICES
 
 config PMC_ATOM
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 2ba6cb795338..5cb772bbbfb6 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_SURFACE3_WMI)	+= surface3-wmi.o
 obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
 obj-$(CONFIG_WMI_BMOF)		+= wmi-bmof.o
 obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= intel-wmi-thunderbolt.o
+obj-$(CONFIG_CZC_TABLET)	+= czc-tablet.o
 
 # toshiba_acpi must link after wmi to ensure that wmi devices are found
 # before toshiba_acpi initializes
diff --git a/drivers/platform/x86/czc-tablet.c b/drivers/platform/x86/czc-tablet.c
new file mode 100644
index 000000000000..8ff94c4bfe43
--- /dev/null
+++ b/drivers/platform/x86/czc-tablet.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * CZC Tablet Support
+ *
+ * Copyright (C) 2018 Lubomir Rintel <lkundrak@v3.sk>
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/dmi.h>
+
+static bool force;
+module_param(force, bool, 0);
+MODULE_PARM_DESC(force, "Disable the DMI check and force the driver to be loaded");
+
+/*
+ * The device boots up in "Windows 7" mode, when the home button sends a
+ * Windows specific key sequence (Left Meta + D) and the second button
+ * sends an unknown one while also toggling the Radio Kill Switch.
+ * This is a surprising behavior when the second button is labeled "Back".
+ *
+ * The vendor-supplied Android-x86 build switches the device to a "Android"
+ * mode by writing value 0x63 to the I/O port 0x68. This just seems to just
+ * set bit 6 on address 0x96 in the EC region; switching the bit directly
+ * seems to achieve the same result. It uses a "p10t_switcher" to do the
+ * job. It doesn't seem to be able to do anything else, and no other use
+ * of the port 0x68 is known.
+ *
+ * In the Android mode, the home button sends just a single scancode,
+ * which can be handled in Linux userspace more reasonably and the back
+ * button only sends a scancode without toggling the kill switch.
+ * The scancode can then be mapped either to Back or RF Kill functionality
+ * in userspace, depending on how the button is labeled on that particular
+ * model.
+ */
+
+#define CZC_EC_EXTRA_PORT   0x68
+
+#define CZC_EC_ANDROID_KEYS 0x63
+
+static const struct dmi_system_id czc_tablet_table[] __initconst = {
+	{
+		.ident = "CZC ODEON TPC-10 (\"P10T\")",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "CZC"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ODEON*TPC-10"),
+		},
+	},
+	{
+		.ident = "ViewSonic ViewPad 10",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ViewSonic"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VPAD10"),
+		},
+	},
+	{ }
+};
+
+static int __init czc_tablet_init(void)
+{
+	if (!force && !dmi_check_system(czc_tablet_table))
+		return -ENODEV;
+
+	outb(CZC_EC_ANDROID_KEYS, CZC_EC_EXTRA_PORT);
+
+	return 0;
+}
+
+static void __exit czc_tablet_exit(void)
+{
+}
+
+module_init(czc_tablet_init);
+module_exit(czc_tablet_exit);
+
+MODULE_DEVICE_TABLE(dmi, czc_tablet_table);
+
+MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
+MODULE_DESCRIPTION("CZC Tablet Support");
+MODULE_LICENSE("GPL");
-- 
2.18.0
