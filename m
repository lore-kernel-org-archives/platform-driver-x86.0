From: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] Lenovo IdeaPAD ACPI driver
Date: Tue, 10 Aug 2010 23:52:38 +0100
Message-ID: <1281480758.5887.33.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:47425 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756150Ab0HJWwo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 Aug 2010 18:52:44 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: platform-driver-x86@vger.kernel.org


Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
---
 drivers/platform/x86/Kconfig        |    7 +
 drivers/platform/x86/Makefile       |    1 +
 drivers/platform/x86/ideapad_acpi.c |  284 +++++++++++++++++++++++++++=
++++++++
 3 files changed, 292 insertions(+), 0 deletions(-)
 create mode 100644 drivers/platform/x86/ideapad_acpi.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index 79baa63..044f430 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -219,6 +219,13 @@ config SONYPI_COMPAT
 	  ---help---
 	  Build the sonypi driver compatibility code into the sony-laptop dri=
ver.
=20
+config IDEAPAD_ACPI
+	tristate "Lenovo IdeaPad ACPI Laptop Extras"
+	depends on ACPI
+	depends on RFKILL
+	help
+	  This is a driver for the rfkill switches on Lenovo IdeaPad netbooks=
=2E
+
 config THINKPAD_ACPI
 	tristate "ThinkPad ACPI Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
index 4744c77..85fb2b84 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_ACERHDF)		+=3D acerhdf.o
 obj-$(CONFIG_HP_WMI)		+=3D hp-wmi.o
 obj-$(CONFIG_TC1100_WMI)	+=3D tc1100-wmi.o
 obj-$(CONFIG_SONY_LAPTOP)	+=3D sony-laptop.o
+obj-$(CONFIG_IDEAPAD_ACPI)	+=3D ideapad_acpi.o
 obj-$(CONFIG_THINKPAD_ACPI)	+=3D thinkpad_acpi.o
 obj-$(CONFIG_FUJITSU_LAPTOP)	+=3D fujitsu-laptop.o
 obj-$(CONFIG_PANASONIC_LAPTOP)	+=3D panasonic-laptop.o
diff --git a/drivers/platform/x86/ideapad_acpi.c b/drivers/platform/x86=
/ideapad_acpi.c
new file mode 100644
index 0000000..26a29d4
--- /dev/null
+++ b/drivers/platform/x86/ideapad_acpi.c
@@ -0,0 +1,284 @@
+/*
+ *  ideapad_acpi.c - Lenovo IdeaPad ACPI Extras
+ *
+ *  Copyright =C2=A9 2010 Intel Corporation
+ *  Copyright =C2=A9 2010 David Woodhouse <dwmw2@infradead.org>
+ *
+ *  This program is free software; you can redistribute it and/or modi=
fy
+ *  it under the terms of the GNU General Public License as published =
by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
+ *  02110-1301, USA.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <acpi/acpi_bus.h>
+#include <acpi/acpi_drivers.h>
+#include <linux/rfkill.h>
+
+#define IDEAPAD_DEV_CAMERA	0
+#define IDEAPAD_DEV_WLAN	1
+#define IDEAPAD_DEV_BLUETOOTH	2
+#define IDEAPAD_DEV_3G		3
+#define IDEAPAD_DEV_KILLSW	4
+
+static struct rfkill *ideapad_rfkill[5];
+
+static const char *ideapad_rfk_names[] =3D {
+	"ideapad_camera", "ideapad_wlan", "ideapad_bluetooth", "ideapad_3g", =
"ideapad_rfkill"
+};
+static const int ideapad_rfk_types[] =3D {
+	0, RFKILL_TYPE_WLAN, RFKILL_TYPE_BLUETOOTH, RFKILL_TYPE_WWAN, RFKILL_=
TYPE_WLAN
+};
+
+static int ideapad_dev_exists(int device)
+{
+	acpi_status status;
+	union acpi_object in_param;
+	struct acpi_object_list input =3D { 1, &in_param };
+	struct acpi_buffer output;
+	union acpi_object out_obj;
+
+	output.length =3D sizeof(out_obj);
+	output.pointer =3D &out_obj;
+
+	in_param.type =3D ACPI_TYPE_INTEGER;
+	in_param.integer.value =3D device + 1;
+
+	status =3D acpi_evaluate_object(NULL, "\\_SB_.DECN", &input, &output)=
;
+	if (ACPI_FAILURE(status)) {
+		printk(KERN_WARNING "IdeaPAD \\_SB_.DECN method failed %d. Is this a=
n IdeaPAD?\n", status);
+		return -ENODEV;
+	}
+	if (out_obj.type !=3D ACPI_TYPE_INTEGER) {
+		printk(KERN_WARNING "IdeaPAD \\_SB_.DECN method returned unexpected =
type\n");
+		return -ENODEV;
+	}
+	return out_obj.integer.value;
+}
+
+static int ideapad_dev_get_state(int device)
+{
+	acpi_status status;
+	union acpi_object in_param;
+	struct acpi_object_list input =3D { 1, &in_param };
+	struct acpi_buffer output;
+	union acpi_object out_obj;
+
+	output.length =3D sizeof(out_obj);
+	output.pointer =3D &out_obj;
+
+	in_param.type =3D ACPI_TYPE_INTEGER;
+	in_param.integer.value =3D device + 1;
+
+	status =3D acpi_evaluate_object(NULL, "\\_SB_.GECN", &input, &output)=
;
+	if (ACPI_FAILURE(status)) {
+		printk(KERN_WARNING "IdeaPAD \\_SB_.GECN method failed %d\n", status=
);
+		return -ENODEV;
+	}
+	if (out_obj.type !=3D ACPI_TYPE_INTEGER) {
+		printk(KERN_WARNING "IdeaPAD \\_SB_.GECN method returned unexpected =
type\n");
+		return -ENODEV;
+	}
+	return out_obj.integer.value;
+}
+
+static int ideapad_dev_set_state(int device, int state)
+{
+	acpi_status status;
+	union acpi_object in_params[2];
+	struct acpi_object_list input =3D { 2, in_params };
+
+	in_params[0].type =3D ACPI_TYPE_INTEGER;
+	in_params[0].integer.value =3D device + 1;
+	in_params[1].type =3D ACPI_TYPE_INTEGER;
+	in_params[1].integer.value =3D state;
+
+	status =3D acpi_evaluate_object(NULL, "\\_SB_.SECN", &input, NULL);
+	if (ACPI_FAILURE(status)) {
+		printk(KERN_WARNING "IdeaPAD \\_SB_.SECN method failed %d\n", status=
);
+		return -ENODEV;
+	}
+	return 0;
+}
+static ssize_t show_ideapad_cam(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	int state =3D ideapad_dev_get_state(IDEAPAD_DEV_CAMERA);
+	if (state < 0)
+		return state;
+
+	return sprintf(buf, "%d\n", state);
+}
+
+static ssize_t store_ideapad_cam(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	int ret, state;
+
+	if (!count)
+		return 0;
+	if (sscanf(buf, "%i", &state) !=3D 1)
+		return -EINVAL;
+	ret =3D ideapad_dev_set_state(IDEAPAD_DEV_CAMERA, state);
+	if (ret < 0)
+		return ret;
+	return count;
+}
+
+static DEVICE_ATTR(camera_power, 0644, show_ideapad_cam, store_ideapad=
_cam);
+
+static int ideapad_rfk_set(void *data, bool blocked)
+{
+	int device =3D (unsigned long)data;
+
+	if (device =3D=3D IDEAPAD_DEV_KILLSW)
+		return -EINVAL;
+	return ideapad_dev_set_state(device, !blocked);
+}
+
+static struct rfkill_ops ideapad_rfk_ops =3D {
+	.set_block =3D ideapad_rfk_set,
+};
+
+static void ideapad_sync_rfk_state(void)
+{
+	int hw_blocked =3D !ideapad_dev_get_state(IDEAPAD_DEV_KILLSW);
+	int i;
+
+	rfkill_set_hw_state(ideapad_rfkill[IDEAPAD_DEV_KILLSW], hw_blocked);
+	for (i =3D IDEAPAD_DEV_WLAN; i < IDEAPAD_DEV_KILLSW; i++)
+		if (ideapad_rfkill[i])
+			rfkill_set_hw_state(ideapad_rfkill[i], hw_blocked);
+	if (hw_blocked)
+		return;
+
+	for (i =3D IDEAPAD_DEV_WLAN; i < IDEAPAD_DEV_KILLSW; i++)
+		if (ideapad_rfkill[i])
+			rfkill_set_sw_state(ideapad_rfkill[i], !ideapad_dev_get_state(i));
+}
+
+static int __init ideapad_register_rfkill(struct acpi_device *device, =
int dev)
+{
+	int ret;
+
+	ideapad_rfkill[dev] =3D rfkill_alloc(ideapad_rfk_names[dev], &device-=
>dev,
+					   ideapad_rfk_types[dev], &ideapad_rfk_ops,
+					   (void *)(long)dev);
+	if (!ideapad_rfkill[dev])
+		return -ENOMEM;
+
+	ret =3D rfkill_register(ideapad_rfkill[dev]);
+	if (ret) {
+		rfkill_destroy(ideapad_rfkill[dev]);
+		return ret;
+	}
+	return 0;
+}
+
+static void __exit ideapad_unregister_rfkill(int dev)
+{
+	if (!ideapad_rfkill[dev])
+		return;
+
+	rfkill_unregister(ideapad_rfkill[dev]);
+	rfkill_destroy(ideapad_rfkill[dev]);
+}
+
+static const struct acpi_device_id ideapad_device_ids[] =3D {
+        { "VPC2004", 0},
+        { "", 0},
+};
+MODULE_DEVICE_TABLE(acpi, ideapad_device_ids);
+
+static int ideapad_acpi_add(struct acpi_device *device)
+{
+	int i;
+	int devs_present[5];
+
+	for (i =3D IDEAPAD_DEV_CAMERA; i < IDEAPAD_DEV_KILLSW; i++) {
+		devs_present[i] =3D ideapad_dev_exists(i);
+		if (devs_present[i] < 0)
+			return devs_present[i];
+	}
+
+	/* The hardware switch is always present */
+	devs_present[IDEAPAD_DEV_KILLSW] =3D 1;
+
+	if (devs_present[IDEAPAD_DEV_CAMERA]) {
+		int ret =3D device_create_file(&device->dev, &dev_attr_camera_power)=
;
+		if (ret)
+			return ret;
+	}
+
+	for (i =3D IDEAPAD_DEV_WLAN; i <=3D IDEAPAD_DEV_KILLSW; i++) {
+		if (!devs_present[i])
+			continue;
+
+		ideapad_register_rfkill(device, i);
+	}
+	ideapad_sync_rfk_state();
+	return 0;
+}
+
+static int ideapad_acpi_remove(struct acpi_device *device, int type)
+{
+	int i;
+	device_remove_file(&device->dev, &dev_attr_camera_power);
+	for (i =3D 0; i < 5; i++)
+		ideapad_unregister_rfkill(i);
+	return 0;
+}
+
+static void ideapad_acpi_notify(struct acpi_device *device, u32 event)
+{
+	ideapad_sync_rfk_state();
+}
+
+static struct acpi_driver ideapad_acpi_driver =3D {
+	.name =3D "ideapad_acpi",
+	.class =3D "IdeaPad",
+	.ids =3D ideapad_device_ids,
+	.ops.add =3D ideapad_acpi_add,
+	.ops.remove =3D ideapad_acpi_remove,
+	.ops.notify =3D ideapad_acpi_notify,
+	.owner =3D THIS_MODULE,
+};
+
+
+static int __init ideapad_acpi_module_init(void)
+{
+	acpi_bus_register_driver(&ideapad_acpi_driver);
+
+	return 0;
+}
+
+
+static void ideapad_acpi_module_exit(void)
+{
+	acpi_bus_unregister_driver(&ideapad_acpi_driver);
+
+}
+/* Support only the S10-3 for now, until we verify other models */
+MODULE_ALIAS("dmi:bvnLENOVO*:pnS10-3:*");
+
+MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
+MODULE_DESCRIPTION("IdeaPad ACPI Extras");
+MODULE_LICENSE("GPL");
+
+module_init(ideapad_acpi_module_init);
+module_exit(ideapad_acpi_module_exit);
--=20
1.7.2.1


--=20
David Woodhouse                            Open Source Technology Centr=
e
David.Woodhouse@intel.com                              Intel Corporatio=
n
