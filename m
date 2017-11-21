From: Chris Chiu <chiu@endlessm.com>
Subject: [PATCH v2] platform/x86: Add Acer Wireless Radio Control driver
Date: Tue, 21 Nov 2017 13:30:44 +0800
Message-ID: <20171121053044.2424-1-chiu@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:38420 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751284AbdKUFbB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2017 00:31:01 -0500
Received: by mail-pg0-f66.google.com with SMTP id s11so9312298pgc.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2017 21:31:01 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy.shevchenko@gmail.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux@endlessm.com

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

Notes:
  v2: less code and no redundant data structure

 drivers/platform/x86/Kconfig         | 14 +++++++
 drivers/platform/x86/Makefile        |  1 +
 drivers/platform/x86/acer-wireless.c | 71 ++++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)
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
index 000000000000..858037987b33
--- /dev/null
+++ b/drivers/platform/x86/acer-wireless.c
@@ -0,0 +1,71 @@
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
+#include <linux/acpi.h>
+#include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci_ids.h>
+#include <linux/types.h>
+
+static const struct acpi_device_id acer_wireless_acpi_ids[] = {
+	{"10251229", 0},
+	{"", 0},
+};
+MODULE_DEVICE_TABLE(acpi, acer_wireless_acpi_ids);
+
+static void acer_wireless_notify(struct acpi_device *adev, u32 event)
+{
+	struct input_dev *idev = acpi_driver_data(adev);
+
+	dev_dbg(&adev->dev, "event=%#x\n", event);
+	if (event != 0x80) {
+		dev_notice(&adev->dev, "Unknown SMKB event: %#x\n", event);
+		return;
+	}
+	input_report_key(idev, KEY_RFKILL, 1);
+	input_report_key(idev, KEY_RFKILL, 0);
+	input_sync(idev);
+}
+
+static int acer_wireless_add(struct acpi_device *adev)
+{
+	struct input_dev *idev;
+
+	idev = devm_input_allocate_device(&adev->dev);
+	if (!idev)
+		return -ENOMEM;
+
+	adev->driver_data = idev;
+	idev->name = "Acer Wireless Radio Control";
+	idev->phys = "acer-wireless/input0";
+	idev->id.bustype = BUS_HOST;
+	idev->id.vendor = PCI_VENDOR_ID_AI;
+	idev->id.product = 0x1229;
+	set_bit(EV_KEY, idev->evbit);
+	set_bit(KEY_RFKILL, idev->keybit);
+
+	return input_register_device(idev);
+}
+
+static struct acpi_driver acer_wireless_driver = {
+	.name = "Acer Wireless Radio Control Driver",
+	.class = "hotkey",
+	.ids = acer_wireless_acpi_ids,
+	.ops = {
+		.add = acer_wireless_add,
+		.notify = acer_wireless_notify,
+	},
+};
+module_acpi_driver(acer_wireless_driver);
+
+MODULE_DESCRIPTION("Acer Wireless Radio Control Driver");
+MODULE_AUTHOR("Chris Chiu <chiu@gmail.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.11.0
