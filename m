From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
Date: Wed, 29 Apr 2015 11:51:04 +0200
Message-ID: <1430301066-22870-2-git-send-email-pali.rohar@gmail.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1430301066-22870-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430301066-22870-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This is an ACPI driver for Dell laptops which receive HW switch events.
It exports rfkill device dell-rbtn which provide correct hard rfkill st=
ate.

Alex Hung added code for supporting Dell laptops which have toggle butt=
on
instead HW slider switch. On these laptops toggle button event is repor=
ted
by new input device (instead rfkill) as they do not have hw radio switc=
h.

It looks like those are two different functions (rfkill, input device),=
 but
Dell BIOS exports them via same ACPI device and uses same ACPI function=
s.
So code is in one kernel driver.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/Kconfig     |   13 ++
 drivers/platform/x86/Makefile    |    1 +
 drivers/platform/x86/dell-rbtn.c |  344 ++++++++++++++++++++++++++++++=
++++++++
 3 files changed, 358 insertions(+)
 create mode 100644 drivers/platform/x86/dell-rbtn.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index f9f205c..9d065c2 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -138,6 +138,19 @@ config DELL_SMO8800
 	  To compile this driver as a module, choose M here: the module will
 	  be called dell-smo8800.
=20
+config DELL_RBTN
+	tristate "Dell Airplane Mode Switch driver"
+	depends on ACPI
+	depends on RFKILL
+	---help---
+	  Say Y here if you want to support Dell Airplane Mode Switch ACPI
+	  device on Dell laptops. Sometimes it has names: DELLABCE or DELRBTN=
=2E
+	  This driver register rfkill device and receives HW rfkill events
+	  (when wifi/bluetooth was enabled) and set correct hard rfkill state=
=2E
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called dell-rbtn.
+
=20
 config FUJITSU_LAPTOP
 	tristate "Fujitsu Laptop Extras"
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
index f82232b..b3e54ed 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_DELL_LAPTOP)	+=3D dell-laptop.o
 obj-$(CONFIG_DELL_WMI)		+=3D dell-wmi.o
 obj-$(CONFIG_DELL_WMI_AIO)	+=3D dell-wmi-aio.o
 obj-$(CONFIG_DELL_SMO8800)	+=3D dell-smo8800.o
+obj-$(CONFIG_DELL_RBTN)		+=3D dell-rbtn.o
 obj-$(CONFIG_ACER_WMI)		+=3D acer-wmi.o
 obj-$(CONFIG_ACERHDF)		+=3D acerhdf.o
 obj-$(CONFIG_HP_ACCEL)		+=3D hp_accel.o
diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/de=
ll-rbtn.c
new file mode 100644
index 0000000..894cd9a
--- /dev/null
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -0,0 +1,344 @@
+/*
+    Dell Airplane Mode Switch driver
+    Copyright (C) 2014-2015  Pali Roh=C3=A1r <pali.rohar@gmail.com>
+
+    This program is free software; you can redistribute it and/or modi=
fy
+    it under the terms of the GNU General Public License as published =
by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+*/
+
+#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/rfkill.h>
+#include <linux/input.h>
+
+enum rbtn_type {
+	RBTN_UNKNOWN,
+	RBTN_TOGGLE,
+	RBTN_SLIDER,
+};
+
+struct rbtn_data {
+	enum rbtn_type type;
+	struct rfkill *rfkill;
+	struct input_dev *input_dev;
+};
+
+
+/*
+ * acpi functions
+ */
+
+static enum rbtn_type rbtn_check(struct acpi_device *device)
+{
+	unsigned long long output;
+	acpi_status status;
+
+	status =3D acpi_evaluate_integer(device->handle, "CRBT", NULL, &outpu=
t);
+	if (ACPI_FAILURE(status))
+		return RBTN_UNKNOWN;
+
+	switch (output) {
+	case 0:
+	case 1:
+		return RBTN_TOGGLE;
+	case 2:
+	case 3:
+		return RBTN_SLIDER;
+	default:
+		return RBTN_UNKNOWN;
+	}
+}
+
+static int rbtn_get(struct acpi_device *device)
+{
+	unsigned long long output;
+	acpi_status status;
+
+	status =3D acpi_evaluate_integer(device->handle, "GRBT", NULL, &outpu=
t);
+	if (ACPI_FAILURE(status))
+		return -EINVAL;
+
+	return !output;
+}
+
+static int rbtn_radio_enable(struct acpi_device *device, bool enable)
+{
+	struct acpi_object_list input;
+	union acpi_object param;
+	acpi_status status;
+
+	param.type =3D ACPI_TYPE_INTEGER;
+	param.integer.value =3D enable;
+	input.count =3D 1;
+	input.pointer =3D &param;
+
+	status =3D acpi_evaluate_object(device->handle, "ARBT", &input, NULL)=
;
+	if (ACPI_FAILURE(status))
+		return -EINVAL;
+
+	return 0;
+}
+
+
+/*
+ * rfkill device
+ */
+
+static void rbtn_rfkill_query(struct rfkill *rfkill, void *data)
+{
+	struct acpi_device *device =3D data;
+	int state;
+
+	state =3D rbtn_get(device);
+	if (state < 0)
+		return;
+
+	rfkill_set_states(rfkill, state, state);
+}
+
+static int rbtn_rfkill_set_block(void *data, bool blocked)
+{
+	/* NOTE: setting soft rfkill state is not supported */
+	return -EINVAL;
+}
+
+struct rfkill_ops rbtn_ops =3D {
+	.query =3D rbtn_rfkill_query,
+	.set_block =3D rbtn_rfkill_set_block,
+};
+
+static int rbtn_rfkill_init(struct acpi_device *device)
+{
+	struct rbtn_data *rbtn_data =3D device->driver_data;
+	int ret;
+
+	if (rbtn_data->rfkill)
+		return 0;
+
+	/* NOTE: rbtn controls all radio devices, not only WLAN
+	         but rfkill interface does not support "ANY" type
+	         so "WLAN" type is used
+	 */
+	rbtn_data->rfkill =3D rfkill_alloc("dell-rbtn", &device->dev,
+					 RFKILL_TYPE_WLAN, &rbtn_ops, device);
+	if (!rbtn_data->rfkill)
+		return -ENOMEM;
+
+	ret =3D rfkill_register(rbtn_data->rfkill);
+	if (ret) {
+		rfkill_destroy(rbtn_data->rfkill);
+		rbtn_data->rfkill =3D NULL;
+		return ret;
+	}
+
+	return 0;
+}
+
+static void rbtn_rfkill_exit(struct acpi_device *device)
+{
+	struct rbtn_data *rbtn_data =3D device->driver_data;
+
+	if (!rbtn_data->rfkill)
+		return;
+
+	rfkill_unregister(rbtn_data->rfkill);
+	rfkill_destroy(rbtn_data->rfkill);
+	rbtn_data->rfkill =3D NULL;
+}
+
+static void rbtn_rfkill_event(struct acpi_device *device)
+{
+	struct rbtn_data *rbtn_data =3D device->driver_data;
+
+	if (rbtn_data->rfkill)
+		rbtn_rfkill_query(rbtn_data->rfkill, device);
+}
+
+
+/*
+ * input device
+ */
+
+static int rbtn_input_init(struct rbtn_data *rbtn_data)
+{
+	int ret;
+
+	rbtn_data->input_dev =3D input_allocate_device();
+	if (!rbtn_data->input_dev)
+		return -ENOMEM;
+
+	rbtn_data->input_dev->name =3D "DELL Wireless hotkeys";
+	rbtn_data->input_dev->phys =3D "dellabce/input0";
+	rbtn_data->input_dev->id.bustype =3D BUS_HOST;
+	rbtn_data->input_dev->evbit[0] =3D BIT(EV_KEY);
+	set_bit(KEY_RFKILL, rbtn_data->input_dev->keybit);
+
+	ret =3D input_register_device(rbtn_data->input_dev);
+	if (ret) {
+		input_free_device(rbtn_data->input_dev);
+		rbtn_data->input_dev =3D NULL;
+		return ret;
+	}
+
+	return 0;
+}
+
+static void rbtn_input_exit(struct rbtn_data *rbtn_data)
+{
+	input_unregister_device(rbtn_data->input_dev);
+	rbtn_data->input_dev =3D NULL;
+}
+
+static void rbtn_input_event(struct rbtn_data *rbtn_data)
+{
+	input_report_key(rbtn_data->input_dev, KEY_RFKILL, 1);
+	input_sync(rbtn_data->input_dev);
+	input_report_key(rbtn_data->input_dev, KEY_RFKILL, 0);
+	input_sync(rbtn_data->input_dev);
+}
+
+
+/*
+ * acpi driver
+ */
+
+static int rbtn_add(struct acpi_device *device);
+static int rbtn_remove(struct acpi_device *device);
+static void rbtn_notify(struct acpi_device *device, u32 event);
+
+static const struct acpi_device_id rbtn_ids[] =3D {
+	{ "DELRBTN", 0 },
+	{ "DELLABCE", 0 },
+	{ "", 0 },
+};
+
+static struct acpi_driver rbtn_driver =3D {
+	.name =3D "dell-rbtn",
+	.ids =3D rbtn_ids,
+	.ops =3D {
+		.add =3D rbtn_add,
+		.remove =3D rbtn_remove,
+		.notify =3D rbtn_notify,
+	},
+	.owner =3D THIS_MODULE,
+};
+
+
+/*
+ * acpi driver functions
+ */
+
+static int rbtn_add(struct acpi_device *device)
+{
+	struct rbtn_data *rbtn_data;
+	enum rbtn_type type;
+	int ret =3D 0;
+
+	type =3D rbtn_check(device);
+	if (type =3D=3D RBTN_UNKNOWN) {
+		dev_info(&device->dev, "Unknown device type\n");
+		return -EINVAL;
+	}
+
+	ret =3D rbtn_radio_enable(device, true);
+	if (ret < 0) {
+		dev_err(&device->dev, "Cannot enable device\n");
+		return ret;
+	}
+
+	rbtn_data =3D devm_kzalloc(&device->dev, sizeof(*rbtn_data), GFP_KERN=
EL);
+	if (!rbtn_data)
+		return -ENOMEM;
+
+	rbtn_data->type =3D type;
+	device->driver_data =3D rbtn_data;
+
+	switch (rbtn_data->type) {
+	case RBTN_TOGGLE:
+		ret =3D rbtn_input_init(rbtn_data);
+		break;
+	case RBTN_SLIDER:
+		ret =3D rbtn_rfkill_init(device);
+		break;
+	default:
+		ret =3D -EINVAL;
+	}
+
+	return ret;
+
+}
+
+static int rbtn_remove(struct acpi_device *device)
+{
+	struct rbtn_data *rbtn_data =3D device->driver_data;
+	int ret;
+
+	switch (rbtn_data->type) {
+	case RBTN_TOGGLE:
+		rbtn_input_exit(rbtn_data);
+		break;
+	case RBTN_SLIDER:
+		rbtn_rfkill_exit(device);
+		break;
+	default:
+		break;
+	}
+
+	ret =3D rbtn_radio_enable(device, false);
+	if (ret < 0)
+		return ret;
+
+	device->driver_data =3D NULL;
+	return 0;
+}
+
+static void rbtn_notify(struct acpi_device *device, u32 event)
+{
+	struct rbtn_data *rbtn_data =3D device->driver_data;
+
+	if (event !=3D 0x80) {
+		dev_info(&device->dev, "Received unknown event (0x%x)\n", event);
+		return;
+	}
+
+	switch (rbtn_data->type) {
+	case RBTN_TOGGLE:
+		rbtn_input_event(rbtn_data);
+		break;
+	case RBTN_SLIDER:
+		rbtn_rfkill_event(device);
+		break;
+	default:
+		break;
+	}
+}
+
+
+/*
+ * module functions
+ */
+
+static int __init rbtn_init(void)
+{
+	return acpi_bus_register_driver(&rbtn_driver);
+}
+
+static void __exit rbtn_exit(void)
+{
+	acpi_bus_unregister_driver(&rbtn_driver);
+}
+
+module_init(rbtn_init);
+module_exit(rbtn_exit);
+
+MODULE_DEVICE_TABLE(acpi, rbtn_ids);
+MODULE_DESCRIPTION("Dell Airplane Mode Switch driver");
+MODULE_AUTHOR("Pali Roh=C3=A1r <pali.rohar@gmail.com>");
+MODULE_LICENSE("GPL");
--=20
1.7.9.5
