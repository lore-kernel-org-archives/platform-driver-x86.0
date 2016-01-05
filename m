From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH] platform/x86: Add Asus Wireless Radio Control driver
Date: Tue,  5 Jan 2016 11:16:53 -0500
Message-ID: <1452010613-4673-1-git-send-email-jprvita@endlessm.com>
References: <CAHp75VfjbtctO7W7Zge6gNm2QbQHfE=L5ibbM0OFhudh8NZCbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47]:33348 "EHLO
	mail-qg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751456AbcAEQRy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jan 2016 11:17:54 -0500
In-Reply-To: <CAHp75VfjbtctO7W7Zge6gNm2QbQHfE=L5ibbM0OFhudh8NZCbg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 MAINTAINERS                          |  6 +++
 drivers/platform/x86/Kconfig         | 14 ++++++
 drivers/platform/x86/Makefile        |  1 +
 drivers/platform/x86/asus-wireless.c | 83 ++++++++++++++++++++++++++++=
++++++++
 4 files changed, 104 insertions(+)
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
index d0bfcf8..749684e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -587,6 +587,20 @@ config EEEPC_WMI
 	  If you have an ACPI-WMI compatible Eee PC laptop (>=3D 1000), say Y=
 or M
 	  here.
=20
+config ASUS_WIRELESS
+	tristate "Asus Wireless Radio Control Driver"
+	depends on ACPI
+	depends on INPUT
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
index 0000000..5058d48
--- /dev/null
+++ b/drivers/platform/x86/asus-wireless.c
@@ -0,0 +1,83 @@
+/*
+ * Asus Wireless Radio Control Driver
+ *
+ * Copyright (C) 2015-2016 Endless Mobile, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/acpi.h>
+#include <linux/input.h>
+#include <linux/pci_ids.h>
+
+struct asus_wireless_data {
+	struct input_dev *idev;
+};
+
+static void asus_wireless_notify(struct acpi_device *adev, u32 event)
+{
+	struct asus_wireless_data *data =3D acpi_driver_data(adev);
+
+	dev_dbg(&adev->dev, "event=3D%#x\n", event);
+	if (event !=3D 0x88) {
+		dev_notice(&adev->dev, "Unknown ASHS event: %#x\n", event);
+		return;
+	}
+	input_report_key(data->idev, KEY_RFKILL, 1);
+	input_report_key(data->idev, KEY_RFKILL, 0);
+	input_sync(data->idev);
+}
+
+static int asus_wireless_add(struct acpi_device *adev)
+{
+	struct asus_wireless_data *data;
+
+	data =3D devm_kzalloc(&adev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	adev->driver_data =3D data;
+
+	data->idev =3D devm_input_allocate_device(&adev->dev);
+	if (!data->idev)
+		return -ENOMEM;
+	data->idev->name =3D "Asus Wireless Radio Control";
+	data->idev->phys =3D "asus-wireless/input0";
+	data->idev->id.bustype =3D BUS_HOST;
+	data->idev->id.vendor =3D PCI_VENDOR_ID_ASUSTEK;
+	set_bit(EV_KEY, data->idev->evbit);
+	set_bit(KEY_RFKILL, data->idev->keybit);
+	return input_register_device(data->idev);
+}
+
+static int asus_wireless_remove(struct acpi_device *adev)
+{
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
+	.name =3D "Asus Wireless Radio Control Driver",
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
+MODULE_DESCRIPTION("Asus Wireless Radio Control Driver");
+MODULE_AUTHOR("Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.com>");
+MODULE_LICENSE("GPL");
--=20
2.5.0
