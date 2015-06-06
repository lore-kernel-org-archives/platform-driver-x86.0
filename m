From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v5 1/3] dell-rbtn: Dell Airplane Mode Switch driver
Date: Sat,  6 Jun 2015 10:23:28 +0200
Message-ID: <1433579010-10509-2-git-send-email-pali.rohar@gmail.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1433579010-10509-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:34196 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751191AbbFFIX6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 6 Jun 2015 04:23:58 -0400
In-Reply-To: <1433579010-10509-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis.Kletnieks@vt.edu, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Darren Hart <dvhart@linux.intel.com>

This is an ACPI driver for Dell laptops which receive HW slider radio
switch or hotkey toggle wifi button events. It exports rfkill device
dell-rbtn (which provide correct hard rfkill state) or hotkey input dev=
ice.

Alex Hung is author of original hotkey input device code.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Tested-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>

rbtn_ops can be static

Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>

Correct multi-line comment formatting.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
Changes for v5:
* fixed commit message
---
 MAINTAINERS                      |    5 +
 drivers/platform/x86/Kconfig     |   16 ++
 drivers/platform/x86/Makefile    |    1 +
 drivers/platform/x86/dell-rbtn.c |  332 ++++++++++++++++++++++++++++++=
++++++++
 4 files changed, 354 insertions(+)
 create mode 100644 drivers/platform/x86/dell-rbtn.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e5bbc0..5808066 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3071,6 +3071,11 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/dell-laptop.c
=20
+DELL LAPTOP RBTN DRIVER
+M:	Pali Roh=C3=A1r <pali.rohar@gmail.com>
+S:	Maintained
+F:	drivers/platform/x86/dell-rbtn.*
+
 DELL LAPTOP FREEFALL DRIVER
 M:	Pali Roh=C3=A1r <pali.rohar@gmail.com>
 S:	Maintained
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index 399085d..bca0aee 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -138,6 +138,22 @@ config DELL_SMO8800
 	  To compile this driver as a module, choose M here: the module will
 	  be called dell-smo8800.
=20
+config DELL_RBTN
+	tristate "Dell Airplane Mode Switch driver"
+	depends on ACPI
+	depends on INPUT
+	depends on RFKILL
+	---help---
+	  Say Y here if you want to support Dell Airplane Mode Switch ACPI
+	  device on Dell laptops. Sometimes it has names: DELLABCE or DELRBTN=
=2E
+	  This driver register rfkill device or input hotkey device depending
+	  on hardware type (hw switch slider or keyboard toggle button). For
+	  rfkill devices it receive HW switch events and set correct hard
+	  rfkill state.
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
index 0000000..1c19fff
--- /dev/null
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -0,0 +1,332 @@
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
+static int rbtn_acquire(struct acpi_device *device, bool enable)
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
+static struct rfkill_ops rbtn_ops =3D {
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
+	/*
+	 * NOTE: rbtn controls all radio devices, not only WLAN
+	 *       but rfkill interface does not support "ANY" type
+	 *       so "WLAN" type is used
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
+	ret =3D rbtn_acquire(device, true);
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
+	rbtn_acquire(device, false);
+	device->driver_data =3D NULL;
+
+	return 0;
+}
+
+static void rbtn_notify(struct acpi_device *device, u32 event)
+{
+	struct rbtn_data *rbtn_data =3D device->driver_data;
+
+	if (event !=3D 0x80) {
+		dev_info(&device->dev, "Received unknown event (0x%x)\n",
+			 event);
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
+module_acpi_driver(rbtn_driver);
+
+MODULE_DEVICE_TABLE(acpi, rbtn_ids);
+MODULE_DESCRIPTION("Dell Airplane Mode Switch driver");
+MODULE_AUTHOR("Pali Roh=C3=A1r <pali.rohar@gmail.com>");
+MODULE_LICENSE("GPL");
--=20
1.7.9.5
