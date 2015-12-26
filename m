From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 1/4] platform/x86: Add Asus Wireless Radio Control driver
Date: Sat, 26 Dec 2015 09:56:34 -0500
Message-ID: <1451141797-1066-2-git-send-email-jprvita@endlessm.com>
References: <1451141797-1066-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451141797-1066-1-git-send-email-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

Some Asus notebooks like the Asus E202SA and the Asus X555UB have a
separate ACPI device for notifications from the airplane mode hotkey.
This device is called "Wireless Radio Control" in Asus websites and ASH=
S
in the DSDT, and its ACPI _HID is ATK4002 in the two models mentioned
above.

=46or these models, when the airplane mode hotkey (Fn+F2) is pressed, a
query 0x0B is started in the Embedded Controller, and all this query do=
es
is a notify ASHS with the value 0x88 (for acpi_osi >=3D "Windows 2012")=
:

	Scope (_SB.PCI0.SBRG.EC0)
	{
		(...)
		Method (_Q0B, 0, NotSerialized)  // _Qxx: EC Query
		{
			If ((MSOS () >=3D OSW8))
			{
				Notify (ASHS, 0x88) // Device-Specific
			}
			Else
			{
				(...)
			}
		}
	}

Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
---
 MAINTAINERS                          |   6 ++
 drivers/platform/x86/Kconfig         |  15 +++++
 drivers/platform/x86/Makefile        |   1 +
 drivers/platform/x86/asus-wireless.c | 105 +++++++++++++++++++++++++++=
++++++++
 4 files changed, 127 insertions(+)
 create mode 100644 drivers/platform/x86/asus-wireless.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c984136..e1860f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1791,6 +1791,12 @@ S:	Maintained
 F:	drivers/platform/x86/asus*.c
 F:	drivers/platform/x86/eeepc*.c
=20
+ASUS WIRELESS RADIO CONTROL DRIVER
+M:	Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/asus-wireless.c
+
 ASYNCHRONOUS TRANSFERS/TRANSFORMS (IOAT) API
 R:	Dan Williams <dan.j.williams@intel.com>
 W:	http://sourceforge.net/projects/xscaleiop
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index d0bfcf8..d3a088b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -587,6 +587,21 @@ config EEEPC_WMI
 	  If you have an ACPI-WMI compatible Eee PC laptop (>=3D 1000), say Y=
 or M
 	  here.
=20
+config ASUS_WIRELESS
+	tristate "Asus Wireless Radio Control Driver"
+	depends on ACPI
+	depends on INPUT
+	default m
+	---help---
+	  The Asus Wireless Radio Control handles the airplane mode hotkey
+	  present on some Asus laptops.
+
+	  Say Y or M here if you have an ASUS notebook with an airplane mode
+	  hotkey.
+
+	  If you choose to compile this driver as a module the module will be
+	  called asus-wireless.
+
 config ACPI_WMI
 	tristate "WMI"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
index 4410e91..8b8df29 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -5,6 +5,7 @@
 obj-$(CONFIG_ASUS_LAPTOP)	+=3D asus-laptop.o
 obj-$(CONFIG_ASUS_WMI)		+=3D asus-wmi.o
 obj-$(CONFIG_ASUS_NB_WMI)	+=3D asus-nb-wmi.o
+obj-$(CONFIG_ASUS_WIRELESS)	+=3D asus-wireless.o
 obj-$(CONFIG_EEEPC_LAPTOP)	+=3D eeepc-laptop.o
 obj-$(CONFIG_EEEPC_WMI)		+=3D eeepc-wmi.o
 obj-$(CONFIG_MSI_LAPTOP)	+=3D msi-laptop.o
diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x8=
6/asus-wireless.c
new file mode 100644
index 0000000..ef7dba5
--- /dev/null
+++ b/drivers/platform/x86/asus-wireless.c
@@ -0,0 +1,105 @@
+/*
+ * Asus Wireless Radio Control Driver
+ *
+ * Copyright (C) 2015 Endless Mobile, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/acpi.h>
+#include <linux/input.h>
+#include <linux/pci_ids.h>
+
+#define ASUS_WIRELESS_MODULE_NAME "Asus Wireless Radio Control Driver"
+
+struct asus_wireless_data {
+	struct input_dev *inputdev;
+};
+
+static void asus_wireless_notify(struct acpi_device *device, u32 event=
)
+{
+	struct asus_wireless_data *data =3D acpi_driver_data(device);
+
+	pr_debug("event=3D0x%X\n", event);
+	if (event !=3D 0x88) {
+		pr_info("Unknown ASHS event: 0x%X\n", event);
+		return;
+	}
+	input_report_key(data->inputdev, KEY_RFKILL, 1);
+	input_report_key(data->inputdev, KEY_RFKILL, 0);
+	input_sync(data->inputdev);
+}
+
+static int asus_wireless_add(struct acpi_device *device)
+{
+	struct asus_wireless_data *data;
+	int err =3D -ENOMEM;
+
+	pr_info(ASUS_WIRELESS_MODULE_NAME"\n");
+	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	device->driver_data =3D data;
+
+	data->inputdev =3D input_allocate_device();
+	if (!data->inputdev)
+		goto fail;
+
+	data->inputdev->name =3D "Asus Wireless Radio Control";
+	data->inputdev->phys =3D "asus-wireless/input0";
+	data->inputdev->id.bustype =3D BUS_HOST;
+	data->inputdev->id.vendor =3D PCI_VENDOR_ID_ASUSTEK;
+	data->inputdev->dev.parent =3D &device->dev;
+	set_bit(EV_REP, data->inputdev->evbit);
+	set_bit(KEY_RFKILL, data->inputdev->keybit);
+
+	err =3D input_register_device(data->inputdev);
+	if (err)
+		goto fail;
+	return 0;
+
+fail:
+	device->driver->ops.remove(device);
+	return err;
+}
+
+static int asus_wireless_remove(struct acpi_device *device)
+{
+	struct asus_wireless_data *data =3D acpi_driver_data(device);
+
+	pr_info("Removing "ASUS_WIRELESS_MODULE_NAME"\n");
+	if (data->inputdev)
+		input_unregister_device(data->inputdev);
+	kfree(data);
+	return 0;
+}
+
+static const struct acpi_device_id device_ids[] =3D {
+	{"ATK4002", 0},
+	{"", 0},
+};
+MODULE_DEVICE_TABLE(acpi, device_ids);
+
+static struct acpi_driver asus_wireless_driver =3D {
+	.name =3D ASUS_WIRELESS_MODULE_NAME,
+	.class =3D "hotkey",
+	.ids =3D device_ids,
+	.ops =3D {
+		.add =3D asus_wireless_add,
+		.remove =3D asus_wireless_remove,
+		.notify =3D asus_wireless_notify,
+	},
+};
+module_acpi_driver(asus_wireless_driver);
+
+MODULE_DESCRIPTION(ASUS_WIRELESS_MODULE_NAME);
+MODULE_AUTHOR("Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.com>");
+MODULE_LICENSE("GPL");
--=20
2.5.0
