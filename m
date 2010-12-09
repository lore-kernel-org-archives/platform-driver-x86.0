From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: [PATCH] Add WMI driver for some Megaware notebook models.
Date: Thu,  9 Dec 2010 18:53:54 -0200
Message-ID: <1291928034-29199-1-git-send-email-cascardo@holoscopio.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade2.minaslivre.org ([74.50.53.203]:48023 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753708Ab0LIUyI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Dec 2010 15:54:08 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: ceolin@ulevel.com, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>

This driver supports some keys for Megaware notebook models. This particular
driver was sponsored by Ulevel <http://ulevel.com>.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
---

Perhaps, some function names are a little odd or some of the functions
should be open-coded instead. Comments, please?

Note that it depends on both the last fix for WMI and the recent touchpad keys
in input.h.

Thanks,
Cascardo.

---
 drivers/platform/x86/Kconfig        |    8 ++
 drivers/platform/x86/Makefile       |    1 +
 drivers/platform/x86/megaware-wmi.c |  226 +++++++++++++++++++++++++++++++++++
 3 files changed, 235 insertions(+), 0 deletions(-)
 create mode 100644 drivers/platform/x86/megaware-wmi.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4c7f8b9..9e20ee0 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -651,4 +651,12 @@ config XO1_RFKILL
 	  Support for enabling/disabling the WLAN interface on the OLPC XO-1
 	  laptop.
 
+config MEGAWARE_WMI
+	tristate "Megaware WMI input keys"
+	depends on ACPI_WMI
+	select INPUT
+	select INPUT_SPARSEKMAP
+	---help---
+	  This adds support for the keys in some Megaware notebook models.
+
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 4ec4ff8..e7942f8 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -34,3 +34,4 @@ obj-$(CONFIG_INTEL_IPS)		+= intel_ips.o
 obj-$(CONFIG_GPIO_INTEL_PMIC)	+= intel_pmic_gpio.o
 obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
 obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
+obj-$(CONFIG_MEGAWARE_WMI)	+= megaware-wmi.o
diff --git a/drivers/platform/x86/megaware-wmi.c b/drivers/platform/x86/megaware-wmi.c
new file mode 100644
index 0000000..0ea0dac
--- /dev/null
+++ b/drivers/platform/x86/megaware-wmi.c
@@ -0,0 +1,226 @@
+/*
+ *  Copyright (C) 2010  Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License along
+ *  with this program; if not, write to the Free Software Foundation, Inc.,
+ *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/platform_device.h>
+#include <linux/acpi.h>
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>");
+
+#define MEGAWARE_DRIVER_NAME "megaware"
+
+#define MEGAWARE_GUID_CODE "39142400-C6A3-40FA-BADB-8A2652834100"
+#define MEGAWARE_GUID_EVENT "59142400-C6A3-40FA-BADB-8A2652834100"
+#define MEGAWARE_GUID_INIT "79142400-C6A3-40FA-BADB-8A2652834100"
+
+MODULE_ALIAS("wmi:"MEGAWARE_GUID_INIT);
+
+struct megaware_device {
+	struct input_dev *idev;
+};
+
+static acpi_status megaware_call_wq00(acpi_handle handle,
+				unsigned long long *ret)
+{
+	struct acpi_buffer output;
+	union acpi_object *obj;
+	acpi_status status;
+	output.length = ACPI_ALLOCATE_BUFFER;
+	output.pointer = NULL;
+	status = wmi_query_block(MEGAWARE_GUID_CODE, 1, &output);
+	if (status)
+		return status;
+	obj = output.pointer;
+	if (obj && obj->type == ACPI_TYPE_INTEGER)
+		*ret = obj->integer.value;
+	else
+		status = AE_TYPE;
+	kfree(obj);
+	return status;
+}
+
+static acpi_status megaware_call_init(struct megaware_device *megaware)
+{
+	struct acpi_buffer input;
+	unsigned long long value = 0;
+	acpi_status status;
+	input.length = sizeof(value);
+	input.pointer = &value;
+	status = wmi_evaluate_method(MEGAWARE_GUID_INIT, 1, 0, &input, NULL);
+	return status;
+}
+
+static const struct key_entry megaware_keys[] = {
+	{ KE_KEY, 0x100, { KEY_WLAN } },
+	{ KE_KEY, 0x101, { KEY_BLUETOOTH } },
+	{ KE_KEY, 0x102, { KEY_PROG1 } },
+	{ KE_KEY, 0x107, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 0x108, { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_KEY, 0x109, { KEY_MUTE } },
+	{ KE_KEY, 0x10A, { KEY_VOLUMEUP } },
+	{ KE_KEY, 0x10B, { KEY_VOLUMEDOWN } },
+	{ KE_END, }
+};
+
+static int megaware_add(struct platform_device *dev)
+{
+	struct megaware_device *megaware = dev_get_drvdata(&dev->dev);
+	struct input_dev *inputdev;
+	int error;
+	acpi_status status;
+
+	status = megaware_call_init(megaware);
+	if (!ACPI_SUCCESS(status))
+		return -EIO;
+
+	inputdev = input_allocate_device();
+	if (!inputdev)
+		return -ENOMEM;
+	inputdev->name = MEGAWARE_DRIVER_NAME "_keys";
+	inputdev->dev.parent = &dev->dev;
+
+	error = sparse_keymap_setup(inputdev, megaware_keys, NULL);
+	if (error)
+		goto err_alloc;
+
+	error = input_register_device(inputdev);
+	if (error)
+		goto err_keymap;
+	megaware->idev = inputdev;
+	return 0;
+
+err_keymap:
+	sparse_keymap_free(inputdev);
+err_alloc:
+	input_free_device(inputdev);
+	return error;
+}
+
+static int megaware_del(struct platform_device *dev)
+{
+	struct megaware_device *megaware = dev_get_drvdata(&dev->dev);
+	struct input_dev *inputdev = megaware->idev;
+	sparse_keymap_free(inputdev);
+	input_unregister_device(inputdev);
+	return 0;
+}
+
+static void megaware_notify(u32 event, void *data)
+{
+	struct megaware_device *megaware = data;
+	struct input_dev *inputdev = megaware->idev;
+	acpi_status status;
+	unsigned long long value = 0;
+	if (event != 0x80)
+		return;
+	status = megaware_call_wq00(megaware, &value);
+	if (!ACPI_SUCCESS(status))
+		return;
+	sparse_keymap_report_event(inputdev, value, 1, true);
+}
+
+static __devinit int megaware_probe(struct platform_device *dev)
+{
+	struct megaware_device *megaware = dev_get_drvdata(&dev->dev);
+	int ret;
+	acpi_status status;
+	ret = megaware_add(dev);
+	if (ret)
+		return ret;
+	status = wmi_install_notify_handler(MEGAWARE_GUID_EVENT,
+			megaware_notify, megaware);
+	if (ACPI_FAILURE(status)) {
+		megaware_del(dev);
+		ret = -EIO;
+	}
+	return ret;
+}
+
+static __devexit int megaware_remove(struct platform_device *dev)
+{
+	int ret;
+	wmi_remove_notify_handler(MEGAWARE_GUID_EVENT);
+	ret = megaware_del(dev);
+	return ret;
+}
+
+static struct platform_driver megaware_driver = {
+	.driver = {
+		.owner = THIS_MODULE,
+		.name = MEGAWARE_DRIVER_NAME,
+	},
+	.probe = megaware_probe,
+	.remove = __devexit_p(megaware_remove),
+};
+
+static struct platform_device *megaware_device;
+
+static __init int megaware_init(void)
+{
+	struct megaware_device *megaware;
+	int ret;
+	if (!wmi_has_guid(MEGAWARE_GUID_INIT)) {
+		printk(KERN_WARNING "Could not find megaware WMI device.\n");
+		ret = -ENODEV;
+		goto out_guid;
+	}
+	megaware = kzalloc(sizeof(*megaware), GFP_KERNEL);
+	if (!megaware) {
+		ret = -ENOMEM;
+		goto out_alloc;
+	}
+	megaware_device = platform_device_alloc(MEGAWARE_DRIVER_NAME, 0);
+	if (!megaware_device) {
+		ret = -ENOMEM;
+		goto out_devalloc;
+	}
+	ret = platform_device_add(megaware_device);
+	if (ret)
+		goto out_devadd;
+	dev_set_drvdata(&megaware_device->dev, megaware);
+	ret = platform_driver_register(&megaware_driver);
+	if (ret)
+		goto out_driver;
+	return 0;
+out_driver:
+	platform_device_del(megaware_device);
+out_devadd:
+	platform_device_put(megaware_device);
+out_devalloc:
+	kfree(megaware);
+out_alloc:
+out_guid:
+	return ret;
+}
+
+static __exit void megaware_exit(void)
+{
+	struct megaware_device *megaware;
+	platform_driver_unregister(&megaware_driver);
+	megaware = dev_get_drvdata(&megaware_device->dev);
+	platform_device_unregister(megaware_device);
+	kfree(megaware);
+}
+
+module_init(megaware_init);
+module_exit(megaware_exit);
-- 
1.7.2.3
