From: Chris Chiu <chiu@endlessm.com>
Subject: [PATCH] platform/x86: Add Acer Wireless Radio Control driver
Date: Thu, 16 Nov 2017 21:44:05 +0800
Message-ID: <20171116134405.24819-1-chiu@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:45051 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933636AbdKPNoK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2017 08:44:10 -0500
Received: by mail-pf0-f194.google.com with SMTP id x7so19659067pfa.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Nov 2017 05:44:10 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: linux@endlessm.com

New Acer laptops in 2018 will have a separate ACPI device for
notifications from the airplane mode hotkey. The device name in
the DSDT is SMKB and its ACPI _HID is 10251229.

For these models, when the airplane mode hotkey (Fn+F3) pressed,
a query 0x02 is started in the Embedded Controller, and all this
query does is a notify SMKB with the value 0x80.

        Scope (_SB.PCI0.LPCB.EC0)
        {
                (...)
                Method (_Q02, 0, NotSerialized)  // _Qxx: EC Query
                {
                    HKEV (0x2, One)
		    Notify (SMKB, 0x80)	// Status Change
                }
        }

Based on code from asus-wireless

Signed-off-by: Chris Chiu <chiu@endlessm.com>
Reviewed-by: João Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/Kconfig         | 14 ++++++
 drivers/platform/x86/Makefile        |  1 +
 drivers/platform/x86/acer-wireless.c | 86 ++++++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 drivers/platform/x86/acer-wireless.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 80b87954f6dd..6c8b3eaf35df 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -36,6 +36,20 @@ config ACER_WMI
 	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
 	  here.
 
+config ACER_WIRELESS
+        tristate "Acer Wireless Radio Control Driver"
+        depends on ACPI
+        depends on INPUT
+        ---help---
+          The Acer Wireless Radio Control handles the airplane mode hotkey
+          present on new Acer laptops.
+
+          Say Y or M here if you have an Acer notebook with an airplane mode
+          hotkey.
+
+          If you choose to compile this driver as a module the module will be
+          called acer-wireless.
+
 config ACERHDF
 	tristate "Acer Aspire One temperature and fan driver"
 	depends on ACPI && THERMAL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 91cec1751461..4fd15503d842 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_DELL_WMI_LED)	+= dell-wmi-led.o
 obj-$(CONFIG_DELL_SMO8800)	+= dell-smo8800.o
 obj-$(CONFIG_DELL_RBTN)		+= dell-rbtn.o
 obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
+obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
 obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
 obj-$(CONFIG_HP_WIRELESS)	+= hp-wireless.o
diff --git a/drivers/platform/x86/acer-wireless.c b/drivers/platform/x86/acer-wireless.c
new file mode 100644
index 000000000000..9c320943d3f5
--- /dev/null
+++ b/drivers/platform/x86/acer-wireless.c
@@ -0,0 +1,86 @@
+/*
+ * Acer Wireless Radio Control Driver
+ *
+ * Copyright (C) 2017 Endless Mobile, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
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
+struct acer_wireless_data {
+	struct input_dev *idev;
+	struct acpi_device *adev;
+};
+
+static const struct acpi_device_id device_ids[] = {
+	{"10251229", 0},
+	{"", 0},
+};
+MODULE_DEVICE_TABLE(acpi, device_ids);
+
+static void acer_wireless_notify(struct acpi_device *adev, u32 event)
+{
+	struct acer_wireless_data *data = acpi_driver_data(adev);
+
+	dev_dbg(&adev->dev, "event=%#x\n", event);
+	if (event != 0x80) {
+		dev_notice(&adev->dev, "Unknown SMKB event: %#x\n", event);
+		return;
+	}
+	input_report_key(data->idev, KEY_RFKILL, 1);
+	input_report_key(data->idev, KEY_RFKILL, 0);
+	input_sync(data->idev);
+}
+
+static int acer_wireless_add(struct acpi_device *adev)
+{
+	struct acer_wireless_data *data;
+
+	data = devm_kzalloc(&adev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	adev->driver_data = data;
+	data->adev = adev;
+
+	data->idev = devm_input_allocate_device(&adev->dev);
+	if (!data->idev)
+		return -ENOMEM;
+	data->idev->name = "Acer Wireless Radio Control";
+	data->idev->phys = "acer-wireless/input0";
+	data->idev->id.bustype = BUS_HOST;
+	data->idev->id.vendor = PCI_VENDOR_ID_AI;
+	set_bit(EV_KEY, data->idev->evbit);
+	set_bit(KEY_RFKILL, data->idev->keybit);
+
+	return input_register_device(data->idev);
+}
+
+static int acer_wireless_remove(struct acpi_device *adev)
+{
+	return 0;
+}
+
+static struct acpi_driver acer_wireless_driver = {
+	.name = "Acer Wireless Radio Control Driver",
+	.class = "hotkey",
+	.ids = device_ids,
+	.ops = {
+		.add = acer_wireless_add,
+		.remove = acer_wireless_remove,
+		.notify = acer_wireless_notify,
+	},
+};
+module_acpi_driver(acer_wireless_driver);
+
+MODULE_DESCRIPTION("Acer Wireless Radio Control Driver");
+MODULE_AUTHOR("Chris Chiu <chiu@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.11.0
