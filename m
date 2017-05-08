From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: peaq-wmi: Add new peaq-wmi driver
Date: Mon,  8 May 2017 21:56:31 +0200
Message-ID: <20170508195631.2704-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43670 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755563AbdEHT4f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 May 2017 15:56:35 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

PEAQ is a new European OEM, I've bought one of their 2-in-1 x86
devices, which is actually quite a nice device. Under Windows it has
Dolby software for "better" sound and you can select different equalizer
presets using a special button.

This WMI interface for this button is not really nice, as it does not do
notifies (it really does not I tripple checked), but since I had already
figured out the entire WMI interface for this I decided to go the full
mile anyways and also implent a WMI based input driver for this using
input_polldev since, well, we need to poll.

This commit adds support for this button making it report KEY_SOUND input
events. KEY_SOUND is already used in various places to switch sound into
theatre mode and things like that so it seems appropriate here.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig    |  7 +++
 drivers/platform/x86/Makefile   |  1 +
 drivers/platform/x86/peaq-wmi.c | 94 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 drivers/platform/x86/peaq-wmi.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index be2ffbd6eb6c..2bac2b2644f9 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -660,6 +660,13 @@ config MSI_WMI
 	 To compile this driver as a module, choose M here: the module will
 	 be called msi-wmi.
 
+config PEAQ_WMI
+	tristate "PEAQ 2-in-1 WMI hotkey driver"
+	depends on ACPI_WMI
+	depends on INPUT
+	help
+	 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
+
 config TOPSTAR_LAPTOP
 	tristate "Topstar Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index de4ffb594ba5..02487f95dd27 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_PANASONIC_LAPTOP)	+= panasonic-laptop.o
 obj-$(CONFIG_INTEL_MENLOW)	+= intel_menlow.o
 obj-$(CONFIG_ACPI_WMI)		+= wmi.o
 obj-$(CONFIG_MSI_WMI)		+= msi-wmi.o
+obj-$(CONFIG_PEAQ_WMI)		+= peaq-wmi.o
 obj-$(CONFIG_SURFACE3_WMI)	+= surface3-wmi.o
 obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
 
diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
new file mode 100644
index 000000000000..8cd6b962ce5e
--- /dev/null
+++ b/drivers/platform/x86/peaq-wmi.c
@@ -0,0 +1,94 @@
+/*
+ * PEAQ 2-in-1 WMI hotkey driver
+ * Copyright (C) 2017 Hans de Goede <hdegoede@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/acpi.h>
+#include <linux/input.h>
+#include <linux/input-polldev.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#define PEAQ_DOLBY_BUTTON_GUID		"ABBC0F6F-8EA1-11D1-00A0-C90629100000"
+#define PEAQ_DOLBY_BUTTON_METHOD_ID	5
+#define PEAQ_POLL_INTERVAL_MS		250
+
+MODULE_ALIAS("wmi:"PEAQ_DOLBY_BUTTON_GUID);
+
+struct input_polled_dev *peaq_poll_dev;
+int peaq_ignore_events_counter;
+
+/*
+ * The Dolby button (yes really a Dolby button) causes an ACPI variable to get
+ * set on both press and release. The WMI method checks and clears that flag.
+ * So for a press + release we will get back One from the WMI method either once
+ * (if polling after the release) or twice (polling between press and release).
+ * We ignore events for 0.5s after the first event to avoid reporting 2 presses.
+ */
+static void peaq_wmi_poll(struct input_polled_dev *dev)
+{
+	union acpi_object obj;
+	struct acpi_buffer buffer = { sizeof(obj), &obj };
+	acpi_status status;
+
+	status = wmi_evaluate_method(PEAQ_DOLBY_BUTTON_GUID, 1,
+				     PEAQ_DOLBY_BUTTON_METHOD_ID,
+				     NULL, &buffer);
+	if (ACPI_FAILURE(status))
+		return;
+
+	if (obj.type != ACPI_TYPE_INTEGER) {
+		dev_err(&peaq_poll_dev->input->dev,
+			"Error WMBC did not return an integer\n");
+		return;
+	}
+
+	if (peaq_ignore_events_counter && --peaq_ignore_events_counter > 0)
+		return;
+
+	if (obj.integer.value) {
+		input_event(peaq_poll_dev->input, EV_KEY, KEY_SOUND, 1);
+		input_event(peaq_poll_dev->input, EV_KEY, KEY_SOUND, 0);
+		input_sync(peaq_poll_dev->input);
+		peaq_ignore_events_counter = 500 / peaq_poll_dev->poll_interval;
+	}
+}
+
+static int __init peaq_wmi_init(void)
+{
+	if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
+		return -ENODEV;
+
+	peaq_poll_dev = input_allocate_polled_device();
+	if (!peaq_poll_dev)
+		return -ENOMEM;
+
+	peaq_poll_dev->poll = peaq_wmi_poll;
+	peaq_poll_dev->poll_interval = PEAQ_POLL_INTERVAL_MS;
+	peaq_poll_dev->poll_interval_max = 1000; /* 1 second */
+	peaq_poll_dev->input->name = "PEAQ WMI hotkeys";
+	peaq_poll_dev->input->phys = "wmi/input0";
+	peaq_poll_dev->input->id.bustype = BUS_HOST;
+	input_set_capability(peaq_poll_dev->input, EV_KEY, KEY_SOUND);
+
+	return input_register_polled_device(peaq_poll_dev);
+}
+
+static void __exit peaq_wmi_exit(void)
+{
+	if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
+		return;
+
+	input_unregister_polled_device(peaq_poll_dev);
+}
+
+module_init(peaq_wmi_init);
+module_exit(peaq_wmi_exit);
+
+MODULE_DESCRIPTION("PEAQ 2-in-1 WMI hotkey driver");
+MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_LICENSE("GPL");
-- 
2.12.2
