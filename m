From: Robert Gerlach <khnz@gmx.de>
Subject: [PATCH] Fujitsu tablet pc extras driver
Date: Mon, 25 Oct 2010 02:28:53 +0200
Message-ID: <20101025002853.GA7787@knothebonkz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.23]:36460 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with SMTP
	id S1750920Ab0JYA3O (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 24 Oct 2010 20:29:14 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.its-rgerlach.de (Postfix) with ESMTP id 2E6064B24
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Oct 2010 02:29:11 +0200 (CEST)
Received: from mail.its-rgerlach.de ([127.0.0.1])
	by localhost (fais.berlin.local [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwN+CbRVzmUL for <platform-driver-x86@vger.kernel.org>;
	Mon, 25 Oct 2010 02:28:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.its-rgerlach.de (Postfix) with ESMTP id 6552B4B2C
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Oct 2010 02:28:58 +0200 (CEST)
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

This is a patch which adds support for the tablet buttons and
automatic screen rotation for many Fujitsu tablet PCs.

Signed-off-by: Robert Gerlach <khnz@gmx.de>
---

Note: This is the third attempt to have this patch accepted, and
should settle all known style issues.
http://patchwork.kernel.org/patch/57747/
http://patchwork.kernel.org/patch/195352/

 MAINTAINERS                           |    6 
 drivers/platform/x86/Kconfig          |   12 
 drivers/platform/x86/Makefile         |    1 
 drivers/platform/x86/fujitsu-tablet.c |  480 ++++++++++++++++++++++++++++++++++
 4 files changed, 499 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2523,6 +2523,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/fujitsu-laptop.c
 
+FUJITSU TABLET EXTRAS
+M:	Robert Gerlach <khnz@gmx.de>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/fujitsu-tablet.c
+
 FUSE: FILESYSTEM IN USERSPACE
 M:	Miklos Szeredi <miklos@szeredi.hu>
 L:	fuse-devel@lists.sourceforge.net
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -125,6 +125,18 @@ config FUJITSU_LAPTOP_DEBUG
 
 	  If you are not sure, say N here.
 
+config FUJITSU_TABLET
+	tristate "Fujitsu Tablet PC Extras"
+	depends on X86
+	depends on INPUT
+	default n
+	---help---
+	  Say Y here for support of the tablet buttons and the display
+	  orientation switch, used on many Fujitsu tablet PCs (like
+	  Stylistic ST5xxx, Lifebook P1xxx and Lifebook T-Series).
+
+	  If you have a Fujitsu tablet pc, say Y or M here.
+
 config TC1100_WMI
 	tristate "HP Compaq TC1100 Tablet WMI Extras (EXPERIMENTAL)"
 	depends on !X86_64
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_SONY_LAPTOP)	+= sony-laptop.o
 obj-$(CONFIG_IDEAPAD_ACPI)	+= ideapad_acpi.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
 obj-$(CONFIG_FUJITSU_LAPTOP)	+= fujitsu-laptop.o
+obj-$(CONFIG_FUJITSU_TABLET)	+= fujitsu-tablet.o
 obj-$(CONFIG_PANASONIC_LAPTOP)	+= panasonic-laptop.o
 obj-$(CONFIG_INTEL_MENLOW)	+= intel_menlow.o
 obj-$(CONFIG_ACPI_WMI)		+= wmi.o
diff --git a/drivers/platform/x86/fujitsu-tablet.c b/drivers/platform/x86/fujitsu-tablet.c
new file mode 100644
--- /dev/null
+++ b/drivers/platform/x86/fujitsu-tablet.c
@@ -0,0 +1,480 @@
+/* Kernel driver for FSC Tablet PC buttons
+ *
+ * Copyright (C) 2006-2010 Robert Gerlach <khnz@users.sourceforge.net>
+ * Copyright (C) 2005-2006 Jan Rychter <jan@rychter.com>
+ *
+ * You can redistribute and/or modify this program under the terms of the
+ * GNU General Public License version 2 as published by the Free Software
+ * Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
+ * Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, write to the Free Software Foundation, Inc.,
+ * 59 Temple Place Suite 330, Boston, MA 02111-1307, USA.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/input.h>
+#include <linux/delay.h>
+#include <linux/dmi.h>
+
+#define MODULENAME "fujitsu-tablet"
+
+#define INTERRUPT 5
+#define IO_BASE 0xfd70
+
+static const struct acpi_device_id fujitsu_ids[] = {
+	{ .id = "FUJ02BD" },
+	{ .id = "FUJ02BF" },
+	{ .id = "" }
+};
+
+struct fujitsu_config {
+	int invert_orientation_bit;
+	unsigned short keymap[16];
+};
+
+static struct fujitsu_config config_Lifebook_Tseries __initconst = {
+	.invert_orientation_bit = 1,
+	.keymap = {
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_SCROLLDOWN,
+		KEY_SCROLLUP,
+		KEY_DIRECTION,
+		KEY_LEFTCTRL,
+		KEY_BRIGHTNESSUP,
+		KEY_BRIGHTNESSDOWN,
+		KEY_BRIGHTNESS_ZERO,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_LEFTALT
+	}
+};
+
+static struct fujitsu_config config_Lifebook_U810 __initconst = {
+	.invert_orientation_bit = 1,
+	.keymap = {
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_PROG1,
+		KEY_PROG2,
+		KEY_DIRECTION,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_UP,
+		KEY_DOWN,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_FN,
+		KEY_SLEEP
+	}
+};
+
+static struct fujitsu_config config_Stylistic_Tseries __initconst = {
+	.invert_orientation_bit = 0,
+	.keymap = {
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_PRINT,
+		KEY_BACKSPACE,
+		KEY_SPACE,
+		KEY_ENTER,
+		KEY_BRIGHTNESSUP,
+		KEY_BRIGHTNESSDOWN,
+		KEY_DOWN,
+		KEY_UP,
+		KEY_SCROLLUP,
+		KEY_SCROLLDOWN,
+		KEY_FN
+	}
+};
+
+static struct fujitsu_config config_Stylistic_ST5xxx __initconst = {
+	.invert_orientation_bit = 0,
+	.keymap = {
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_RESERVED,
+		KEY_MAIL,
+		KEY_DIRECTION,
+		KEY_ESC,
+		KEY_ENTER,
+		KEY_BRIGHTNESSUP,
+		KEY_BRIGHTNESSDOWN,
+		KEY_DOWN,
+		KEY_UP,
+		KEY_SCROLLUP,
+		KEY_SCROLLDOWN,
+		KEY_FN,
+		KEY_LEFTALT
+	}
+};
+
+static struct {						/* fujitsu_t */
+	struct platform_device *pdev;
+	struct input_dev *idev;
+	struct fujitsu_config config;
+	int orientation;
+	unsigned long prev_keymask;
+} fujitsu;
+
+/*** HELPER *******************************************************************/
+
+static inline u8 fujitsu_ack(void)
+{
+	return inb(IO_BASE+2);
+}
+
+static inline u8 fujitsu_status(void)
+{
+	return inb(IO_BASE+6);
+}
+
+static inline u8 fujitsu_read_register(const u8 addr)
+{
+	outb(addr, IO_BASE);
+	return inb(IO_BASE+4);
+}
+
+
+/*** INPUT ********************************************************************/
+
+static int __devinit input_fujitsu_setup(struct device *dev)
+{
+	struct input_dev *idev;
+	int error;
+	int x;
+
+	idev = input_allocate_device();
+	if (!idev)
+		return -ENOMEM;
+
+	idev->dev.parent = dev;
+	idev->phys = KBUILD_MODNAME "/input0";
+	idev->name = "Fujitsu tablet buttons";
+	idev->id.bustype = BUS_HOST;
+	idev->id.vendor  = 0x1734;	/* Fujitsu Siemens Computer GmbH */
+	idev->id.product = 0x0001;
+	idev->id.version = 0x0101;
+
+	idev->keycode = fujitsu.config.keymap;
+	idev->keycodesize = sizeof(fujitsu.config.keymap[0]);
+	idev->keycodemax = ARRAY_SIZE(fujitsu.config.keymap);
+
+	__set_bit(EV_REP, idev->evbit);
+	__set_bit(EV_KEY, idev->evbit);
+
+	for (x = 0; x < ARRAY_SIZE(fujitsu.config.keymap); x++)
+		if (fujitsu.config.keymap[x])
+			__set_bit(fujitsu.config.keymap[x], idev->keybit);
+
+	__set_bit(EV_MSC, idev->evbit);
+	__set_bit(MSC_SCAN, idev->mscbit);
+
+	__set_bit(EV_SW, idev->evbit);
+	__set_bit(SW_TABLET_MODE, idev->swbit);
+
+	error = input_register_device(idev);
+	if (error) {
+		input_free_device(idev);
+		return error;
+	}
+
+	fujitsu.idev = idev;
+	return 0;
+}
+
+static void input_fujitsu_remove(void)
+{
+	if (fujitsu.idev)
+		input_unregister_device(fujitsu.idev);
+}
+
+static void fujitsu_report_orientation(void)
+{
+	struct input_dev *idev = fujitsu.idev;
+	int orientation = fujitsu_read_register(0xdd);
+
+	if (orientation & 0x02) {
+		orientation ^= fujitsu.config.invert_orientation_bit;
+		orientation &= 0x01;
+
+		if (orientation != fujitsu.orientation) {
+			input_report_switch(idev, SW_TABLET_MODE,
+					fujitsu.orientation = orientation);
+			input_sync(idev);
+		}
+	}
+}
+
+static void fujitsu_report_key(void)
+{
+	unsigned long keymask;
+	unsigned long changed;
+
+	keymask  = fujitsu_read_register(0xde);
+	keymask |= fujitsu_read_register(0xdf) << 8;
+	keymask ^= 0xffff;
+
+	changed = keymask ^ fujitsu.prev_keymask;
+
+	if (changed) {
+		int keycode, pressed;
+		int x = 0;
+
+		/* save current state and filter not changed bits */
+		fujitsu.prev_keymask = keymask;
+
+		/* looking for the location of the first bit which is set */
+		while (!test_bit(x, &changed))
+			x++;
+
+		keycode = fujitsu.config.keymap[x];
+		pressed = !!(keymask & changed);
+
+		if (pressed)
+			input_event(fujitsu.idev, EV_MSC, MSC_SCAN, x);
+
+		input_report_key(fujitsu.idev, keycode, pressed);
+		input_sync(fujitsu.idev);
+	}
+}
+
+
+/*** INTERRUPT ****************************************************************/
+
+static irqreturn_t fujitsu_isr(int irq, void *dev_id)
+{
+	if (!(fujitsu_status() & 0x01))
+		return IRQ_NONE;
+
+	fujitsu_report_orientation();
+	fujitsu_report_key();
+	fujitsu_ack();
+
+	return IRQ_HANDLED;
+}
+
+
+/*** DEVICE *******************************************************************/
+
+static int fujitsu_busywait(void)
+{
+	int timeout_counter = 50;
+
+	while (fujitsu_status() & 0x02 && --timeout_counter)
+		msleep(20);
+
+	return !timeout_counter;
+}
+
+static void fujitsu_reset(void)
+{
+	fujitsu_ack();
+	if (fujitsu_busywait())
+		printk(KERN_WARNING MODULENAME ": timeout, real reset needed!\n");
+}
+
+static int __devinit fujitsu_probe(struct platform_device *pdev)
+{
+	int error;
+
+	error = input_fujitsu_setup(&pdev->dev);
+	if (error)
+		goto err_input;
+
+	if (!request_region(IO_BASE, 8, MODULENAME)) {
+		dev_err(&pdev->dev, "region 0x%04x busy\n", IO_BASE);
+		error = -EBUSY;
+		goto err_input;
+	}
+
+	fujitsu_reset();
+
+	fujitsu_report_orientation();
+	input_sync(fujitsu.idev);
+
+	error = request_irq(INTERRUPT, fujitsu_isr,
+			IRQF_SHARED, MODULENAME, fujitsu_isr);
+	if (error) {
+		dev_err(&pdev->dev, "unable to get irq %d\n", INTERRUPT);
+		goto err_io;
+	}
+
+	return 0;
+
+err_io:
+	release_region(IO_BASE, 8);
+err_input:
+	input_fujitsu_remove();
+	return error;
+}
+
+static int __devexit fujitsu_remove(struct platform_device *pdev)
+{
+	free_irq(INTERRUPT, fujitsu_isr);
+	release_region(IO_BASE, 8);
+	input_fujitsu_remove();
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int fujitsu_resume(struct platform_device *pdev)
+{
+	fujitsu_reset();
+	fujitsu_report_orientation();
+	return 0;
+}
+#else
+#define fujitsu_resume NULL
+#endif
+
+static struct platform_driver fujitsu_platform_driver = {
+	.driver		= {
+		.name	= MODULENAME,
+		.owner	= THIS_MODULE,
+	},
+	.probe		= fujitsu_probe,
+	.remove		= __devexit_p(fujitsu_remove),
+	.resume		= fujitsu_resume,
+};
+
+
+/*** DMI **********************************************************************/
+
+static int __init fujitsu_dmi_matched(const struct dmi_system_id *dmi)
+{
+	printk(KERN_INFO MODULENAME ": %s detected\n", dmi->ident);
+	memcpy(&fujitsu.config, dmi->driver_data,
+			sizeof(struct fujitsu_config));
+	return 1;
+}
+
+static struct dmi_system_id dmi_ids[] __initdata = {
+	{
+		.callback = fujitsu_dmi_matched,
+		.ident = "Fujitsu Siemens P/T Series",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK")
+		},
+		.driver_data = &config_Lifebook_Tseries
+	},
+	{
+		.callback = fujitsu_dmi_matched,
+		.ident = "Fujitsu Lifebook T Series",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook T")
+		},
+		.driver_data = &config_Lifebook_Tseries
+	},
+	{
+		.callback = fujitsu_dmi_matched,
+		.ident = "Fujitsu Siemens Stylistic T Series",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Stylistic T")
+		},
+		.driver_data = &config_Stylistic_Tseries
+	},
+	{
+		.callback = fujitsu_dmi_matched,
+		.ident = "Fujitsu LifeBook U810",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook U810")
+		},
+		.driver_data = &config_Lifebook_U810
+	},
+	{
+		.callback = fujitsu_dmi_matched,
+		.ident = "Fujitsu Siemens Stylistic ST5xxx Series",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "STYLISTIC ST5")
+		},
+		.driver_data = &config_Stylistic_ST5xxx
+	},
+	{
+		.callback = fujitsu_dmi_matched,
+		.ident = "Fujitsu Siemens Stylistic ST5xxx Series",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Stylistic ST5")
+		},
+		.driver_data = &config_Stylistic_ST5xxx
+	},
+	{
+		.callback = fujitsu_dmi_matched,
+		.ident = "Unknown (using defaults)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, ""),
+			DMI_MATCH(DMI_PRODUCT_NAME, "")
+		},
+		.driver_data = &config_Lifebook_Tseries
+	},
+	{ NULL }
+};
+
+
+/*** MODULE *******************************************************************/
+
+static int __init fujitsu_module_init(void)
+{
+	int error;
+
+	dmi_check_system(dmi_ids);
+
+	error = platform_driver_register(&fujitsu_platform_driver);
+	if (error)
+		return error;
+
+	fujitsu.pdev = platform_device_register_simple(MODULENAME, -1, NULL, 0);
+	if (IS_ERR(fujitsu.pdev)) {
+		error = PTR_ERR(fujitsu.pdev);
+		platform_driver_unregister(&fujitsu_platform_driver);
+		return error;
+	}
+
+	return 0;
+}
+
+static void __exit fujitsu_module_exit(void)
+{
+	platform_device_unregister(fujitsu.pdev);
+	platform_driver_unregister(&fujitsu_platform_driver);
+}
+
+module_init(fujitsu_module_init);
+module_exit(fujitsu_module_exit);
+
+MODULE_AUTHOR("Robert Gerlach <khnz@users.sourceforge.net>");
+MODULE_DESCRIPTION("Fujitsu Siemens tablet button driver");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("git");
+
+MODULE_DEVICE_TABLE(acpi, fujitsu_ids);
