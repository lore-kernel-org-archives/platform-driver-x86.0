From: Robert Gerlach <khnz@gmx.de>
Subject: [PATCH v2] Fujitsu tablet extras driver
Date: Wed, 18 Jan 2012 14:26:22 +0100
Message-ID: <1326893182-19478-1-git-send-email-khnz@gmx.de>
References: <20120118053258.GB32285@core.coreip.homeip.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:35238 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1757489Ab2ARN0h (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 18 Jan 2012 08:26:37 -0500
Received: from localhost (localhost [127.0.0.1])
	by kolab.lan (Postfix) with ESMTP id B6BDB1667D
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jan 2012 14:26:27 +0100 (CET)
Received: from kolab.lan ([127.0.0.1])
	by localhost (kolab.lan [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4su3j8qUbHZF for <platform-driver-x86@vger.kernel.org>;
	Wed, 18 Jan 2012 14:26:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by kolab.lan (Postfix) with ESMTP id 51B4516680
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jan 2012 14:26:25 +0100 (CET)
In-Reply-To: <20120118053258.GB32285@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthew Garrett <mjg@redhat.com>
Cc: Robert Gerlach <khnz@gmx.de>, platform-driver-x86@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Ryan Lewis <me@ryanlewis.net>

This patch adds support for some of the devices within a wide variety
of Fujitsu Tablet Computers, both convertibles and slates. Primarily
it allows for the automatic detection of the tablet/notebook mode for
convertible tablet pc's, and orientation for docked slates. It also
adds support for the application panel buttons usually found next to
the tablet screen, and docking station detection for slates.

Signed-off-by: Robert Gerlach <khnz@gmx.de>
---
 MAINTAINERS                           |    6 +
 drivers/platform/x86/Kconfig          |   17 ++
 drivers/platform/x86/Makefile         |    1 +
 drivers/platform/x86/fujitsu-tablet.c |  478 +++++++++++++++++++++++++++++++++
 4 files changed, 502 insertions(+), 0 deletions(-)
 create mode 100644 drivers/platform/x86/fujitsu-tablet.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fa3f5e6..db901ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2838,6 +2838,12 @@ S:	Maintained
 F:	drivers/media/video/m5mols/
 F:	include/media/m5mols.h
 
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
index f995e6e..0f4cc26 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -143,6 +143,23 @@ config FUJITSU_LAPTOP_DEBUG
 
 	  If you are not sure, say N here.
 
+config FUJITSU_TABLET
+	tristate "Fujitsu Tablet Extras"
+	depends on ACPI
+	depends on INPUT
+	---help---
+	  This is a driver for tablets built by Fujitsu:
+
+	    * Lifebook P1510/P1610/P1620/Txxxx
+	    * Stylistic ST5xxx
+	    * Possibly other Fujitsu tablet models
+
+	  It adds support for the panel buttons, docking station detection,
+	  tablet/notebook mode detection for convertible and
+	  orientation detection for docked slates.
+
+	  If you have a Fujitsu convertible or slate, say Y or M here.
+
 config TC1100_WMI
 	tristate "HP Compaq TC1100 Tablet WMI Extras (EXPERIMENTAL)"
 	depends on !X86_64
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 293a320..d6f5655 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
 obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
 obj-$(CONFIG_FUJITSU_LAPTOP)	+= fujitsu-laptop.o
+obj-$(CONFIG_FUJITSU_TABLET)	+= fujitsu-tablet.o
 obj-$(CONFIG_PANASONIC_LAPTOP)	+= panasonic-laptop.o
 obj-$(CONFIG_INTEL_MENLOW)	+= intel_menlow.o
 obj-$(CONFIG_ACPI_WMI)		+= wmi.o
diff --git a/drivers/platform/x86/fujitsu-tablet.c b/drivers/platform/x86/fujitsu-tablet.c
new file mode 100644
index 0000000..580d80a
--- /dev/null
+++ b/drivers/platform/x86/fujitsu-tablet.c
@@ -0,0 +1,478 @@
+/*
+ * Copyright (C) 2006-2012 Robert Gerlach <khnz@gmx.de>
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
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/input.h>
+#include <linux/delay.h>
+#include <linux/dmi.h>
+
+#define MODULENAME "fujitsu-tablet"
+
+#define ACPI_FUJITSU_CLASS "fujitsu"
+
+#define INVERT_TABLET_MODE_BIT      0x01
+#define FORCE_TABLET_MODE_IF_UNDOCK 0x02
+
+#define KEYMAP_LEN 16
+
+static const struct acpi_device_id fujitsu_ids[] = {
+	{ .id = "FUJ02BD" },
+	{ .id = "FUJ02BF" },
+	{ .id = "" }
+};
+
+struct fujitsu_config {
+	unsigned short keymap[KEYMAP_LEN];
+	unsigned int quirks;
+};
+
+static unsigned short keymap_Lifebook_Tseries[KEYMAP_LEN] __initconst = {
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_SCROLLDOWN,
+	KEY_SCROLLUP,
+	KEY_DIRECTION,
+	KEY_LEFTCTRL,
+	KEY_BRIGHTNESSUP,
+	KEY_BRIGHTNESSDOWN,
+	KEY_BRIGHTNESS_ZERO,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_LEFTALT
+};
+
+static unsigned short keymap_Lifebook_U810[KEYMAP_LEN] __initconst = {
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_PROG1,
+	KEY_PROG2,
+	KEY_DIRECTION,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_UP,
+	KEY_DOWN,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_LEFTCTRL,
+	KEY_LEFTALT
+};
+
+static unsigned short keymap_Stylistic_Tseries[KEYMAP_LEN] __initconst = {
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_PRINT,
+	KEY_BACKSPACE,
+	KEY_SPACE,
+	KEY_ENTER,
+	KEY_BRIGHTNESSUP,
+	KEY_BRIGHTNESSDOWN,
+	KEY_DOWN,
+	KEY_UP,
+	KEY_SCROLLUP,
+	KEY_SCROLLDOWN,
+	KEY_LEFTCTRL,
+	KEY_LEFTALT
+};
+
+static unsigned short keymap_Stylistic_ST5xxx[KEYMAP_LEN] __initconst = {
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_RESERVED,
+	KEY_MAIL,
+	KEY_DIRECTION,
+	KEY_ESC,
+	KEY_ENTER,
+	KEY_BRIGHTNESSUP,
+	KEY_BRIGHTNESSDOWN,
+	KEY_DOWN,
+	KEY_UP,
+	KEY_SCROLLUP,
+	KEY_SCROLLDOWN,
+	KEY_LEFTCTRL,
+	KEY_LEFTALT
+};
+
+static struct {
+	struct input_dev *idev;
+	struct fujitsu_config config;
+	unsigned long prev_keymask;
+
+	char phys[21];
+
+	int irq;
+	int io_base;
+	int io_length;
+} fujitsu;
+
+static u8 fujitsu_ack(void)
+{
+	return inb(fujitsu.io_base + 2);
+}
+
+static u8 fujitsu_status(void)
+{
+	return inb(fujitsu.io_base + 6);
+}
+
+static u8 fujitsu_read_register(const u8 addr)
+{
+	outb(addr, fujitsu.io_base);
+	return inb(fujitsu.io_base + 4);
+}
+
+static void fujitsu_send_state(void)
+{
+	int state;
+	int dock, tablet_mode;
+
+	state = fujitsu_read_register(0xdd);
+
+	dock = state & 0x02;
+
+	if ((fujitsu.config.quirks & FORCE_TABLET_MODE_IF_UNDOCK) && (!dock)) {
+		tablet_mode = 1;
+	} else{
+		tablet_mode = state & 0x01;
+		if (fujitsu.config.quirks & INVERT_TABLET_MODE_BIT)
+			tablet_mode = !tablet_mode;
+	}
+
+	input_report_switch(fujitsu.idev, SW_DOCK, dock);
+	input_report_switch(fujitsu.idev, SW_TABLET_MODE, tablet_mode);
+	input_sync(fujitsu.idev);
+}
+
+static void fujitsu_reset(void)
+{
+	int timeout = 50;
+
+	fujitsu_ack();
+
+	while ((fujitsu_status() & 0x02) && (--timeout))
+		msleep(20);
+
+	fujitsu_send_state();
+}
+
+static int __devinit input_fujitsu_setup(struct device *parent,
+					 const char *name, const char *phys)
+{
+	struct input_dev *idev;
+	int error;
+	int i;
+
+	idev = input_allocate_device();
+	if (!idev)
+		return -ENOMEM;
+
+	idev->dev.parent = parent;
+	idev->phys = phys;
+	idev->name = name;
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
+
+	for (i = 0; i < ARRAY_SIZE(fujitsu.config.keymap); i++)
+		if (fujitsu.config.keymap[i])
+			input_set_capability(idev, EV_KEY, fujitsu.config.keymap[i]);
+
+	input_set_capability(idev, EV_MSC, MSC_SCAN);
+
+	input_set_capability(idev, EV_SW, SW_DOCK);
+	input_set_capability(idev, EV_SW, SW_TABLET_MODE);
+
+	input_set_capability(idev, EV_SW, SW_DOCK);
+	input_set_capability(idev, EV_SW, SW_TABLET_MODE);
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
+	input_unregister_device(fujitsu.idev);
+}
+
+static irqreturn_t fujitsu_interrupt(int irq, void *dev_id)
+{
+	unsigned long keymask, changed;
+	unsigned int keycode;
+	int pressed;
+	int i;
+
+	if (unlikely(!(fujitsu_status() & 0x01)))
+		return IRQ_NONE;
+
+	fujitsu_send_state();
+
+	keymask  = fujitsu_read_register(0xde);
+	keymask |= fujitsu_read_register(0xdf) << 8;
+	keymask ^= 0xffff;
+
+	changed = keymask ^ fujitsu.prev_keymask;
+	if (changed) {
+		fujitsu.prev_keymask = keymask;
+
+		for_each_set_bit(i, &changed, KEYMAP_LEN) {
+			keycode = fujitsu.config.keymap[i];
+			pressed = keymask & changed & BIT(i);
+
+			if (pressed)
+				input_event(fujitsu.idev, EV_MSC, MSC_SCAN, i);
+
+			input_report_key(fujitsu.idev, keycode, pressed);
+			input_sync(fujitsu.idev);
+		}
+	}
+
+	fujitsu_ack();
+	return IRQ_HANDLED;
+}
+
+static int __devinit fujitsu_dmi_default(const struct dmi_system_id *dmi)
+{
+	printk(KERN_INFO MODULENAME ": %s\n", dmi->ident);
+	memcpy(fujitsu.config.keymap, dmi->driver_data,
+			sizeof(fujitsu.config.keymap));
+	return 1;
+}
+
+static int __devinit fujitsu_dmi_stylistic(const struct dmi_system_id *dmi)
+{
+	fujitsu_dmi_default(dmi);
+	fujitsu.config.quirks |= FORCE_TABLET_MODE_IF_UNDOCK;
+	fujitsu.config.quirks |= INVERT_TABLET_MODE_BIT;
+	return 1;
+}
+
+static struct dmi_system_id dmi_ids[] __initconst = {
+	{
+		.callback = fujitsu_dmi_default,
+		.ident = "Fujitsu Siemens P/T Series",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK")
+		},
+		.driver_data = keymap_Lifebook_Tseries
+	},
+	{
+		.callback = fujitsu_dmi_default,
+		.ident = "Fujitsu Lifebook T Series",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook T")
+		},
+		.driver_data = keymap_Lifebook_Tseries
+	},
+	{
+		.callback = fujitsu_dmi_stylistic,
+		.ident = "Fujitsu Siemens Stylistic T Series",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Stylistic T")
+		},
+		.driver_data = keymap_Stylistic_Tseries
+	},
+	{
+		.callback = fujitsu_dmi_default,
+		.ident = "Fujitsu LifeBook U810",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook U810")
+		},
+		.driver_data = keymap_Lifebook_U810
+	},
+	{
+		.callback = fujitsu_dmi_stylistic,
+		.ident = "Fujitsu Siemens Stylistic ST5xxx Series",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "STYLISTIC ST5")
+		},
+		.driver_data = keymap_Stylistic_ST5xxx
+	},
+	{
+		.callback = fujitsu_dmi_stylistic,
+		.ident = "Fujitsu Siemens Stylistic ST5xxx Series",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Stylistic ST5")
+		},
+		.driver_data = keymap_Stylistic_ST5xxx
+	},
+	{
+		.callback = fujitsu_dmi_default,
+		.ident = "Unknown (using defaults)",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, ""),
+			DMI_MATCH(DMI_PRODUCT_NAME, "")
+		},
+		.driver_data = keymap_Lifebook_Tseries
+	},
+	{ NULL }
+};
+
+static acpi_status __devinit
+fujitsu_walk_resources(struct acpi_resource *res, void *data)
+{
+	switch (res->type) {
+	case ACPI_RESOURCE_TYPE_IRQ:
+		fujitsu.irq = res->data.irq.interrupts[0];
+		return AE_OK;
+
+	case ACPI_RESOURCE_TYPE_IO:
+		fujitsu.io_base = res->data.io.minimum;
+		fujitsu.io_length = res->data.io.address_length;
+		return AE_OK;
+
+	case ACPI_RESOURCE_TYPE_END_TAG:
+		if (fujitsu.irq && fujitsu.io_base)
+			return AE_OK;
+		else
+			return AE_NOT_FOUND;
+
+	default:
+		return AE_ERROR;
+	}
+}
+
+static int __devinit acpi_fujitsu_add(struct acpi_device *adev)
+{
+	acpi_status status;
+	int error;
+
+	if (!adev)
+		return -EINVAL;
+
+	status = acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
+			fujitsu_walk_resources, NULL);
+	if (ACPI_FAILURE(status) || !fujitsu.irq || !fujitsu.io_base)
+		return -ENODEV;
+
+	sprintf(acpi_device_name(adev), "Fujitsu %s", acpi_device_hid(adev));
+	sprintf(acpi_device_class(adev), "%s", ACPI_FUJITSU_CLASS);
+
+	snprintf(fujitsu.phys, sizeof(fujitsu.phys),
+			"%s/input0", acpi_device_hid(adev));
+
+	error = input_fujitsu_setup(&adev->dev,
+		acpi_device_name(adev), fujitsu.phys);
+	if (error)
+		return error;
+
+	if (!request_region(fujitsu.io_base, fujitsu.io_length, MODULENAME)) {
+		input_fujitsu_remove();
+		return -EBUSY;
+	}
+
+	fujitsu_reset();
+
+	error = request_irq(fujitsu.irq, fujitsu_interrupt,
+			IRQF_SHARED, MODULENAME, fujitsu_interrupt);
+	if (error) {
+		release_region(fujitsu.io_base, fujitsu.io_length);
+		input_fujitsu_remove();
+		return error;
+	}
+
+	return 0;
+}
+
+static int __devexit acpi_fujitsu_remove(struct acpi_device *adev, int type)
+{
+	free_irq(fujitsu.irq, fujitsu_interrupt);
+	release_region(fujitsu.io_base, fujitsu.io_length);
+	input_fujitsu_remove();
+	return 0;
+}
+
+static int acpi_fujitsu_resume(struct acpi_device *adev)
+{
+	fujitsu_reset();
+	return 0;
+}
+
+static struct acpi_driver acpi_fujitsu_driver = {
+	.name  = MODULENAME,
+	.class = "hotkey",
+	.ids   = fujitsu_ids,
+	.ops   = {
+		.add    = acpi_fujitsu_add,
+		.remove	= acpi_fujitsu_remove,
+		.resume = acpi_fujitsu_resume,
+	}
+};
+
+static int __init fujitsu_module_init(void)
+{
+	int error;
+
+	dmi_check_system(dmi_ids);
+
+	error = acpi_bus_register_driver(&acpi_fujitsu_driver);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static void __exit fujitsu_module_exit(void)
+{
+	acpi_bus_unregister_driver(&acpi_fujitsu_driver);
+}
+
+module_init(fujitsu_module_init);
+module_exit(fujitsu_module_exit);
+
+MODULE_AUTHOR("Robert Gerlach <khnz@gmx.de>");
+MODULE_DESCRIPTION("Fujitsu tablet pc extras driver");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("2.4");
+
+MODULE_DEVICE_TABLE(acpi, fujitsu_ids);
-- 
1.7.5.4
