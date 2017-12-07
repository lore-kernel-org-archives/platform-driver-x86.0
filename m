From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH][V2] intel-hid: add a DMI quirk to support Wacom MobileStudio Pro
Date: Thu,  7 Dec 2017 11:40:23 +0800
Message-ID: <1512618023-30209-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:43058 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751990AbdLGDka (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Dec 2017 22:40:30 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org
Cc: jason.gerecke@wacom.com

HEBC method reports capabilities of 5 button array but Wacom
MobileStudio Pro does not have this control method. A DMI quirk
was created to enable 5 button array for this system.

[V2] Update DMI strings from shipping systems

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197991

Reported-by: Jason Gerecke <jason.gerecke@wacom.com>
Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/intel-hid.c | 41 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index f470279..d1a0131 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -25,6 +25,7 @@
 #include <linux/acpi.h>
 #include <linux/suspend.h>
 #include <acpi/acpi_bus.h>
+#include <linux/dmi.h>
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alex Hung");
@@ -73,6 +74,24 @@ static const struct key_entry intel_array_keymap[] = {
 	{ KE_END },
 };
 
+static const struct dmi_system_id button_array_table[] = {
+	{
+		.ident = "Wacom MobileStudio Pro 13",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Wacom Co.,Ltd"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Wacom MobileStudio Pro 13"),
+		},
+	},
+	{
+		.ident = "Wacom MobileStudio Pro 16",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Wacom Co.,Ltd"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Wacom MobileStudio Pro 16"),
+		},
+	},
+	{ }
+};
+
 struct intel_hid_priv {
 	struct input_dev *input_dev;
 	struct input_dev *array;
@@ -263,10 +282,27 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 			 ev_index);
 }
 
+static bool button_array_present(struct platform_device *device)
+{
+	acpi_handle handle = ACPI_HANDLE(&device->dev);
+	unsigned long long event_cap;
+	acpi_status status;
+	bool supported = false;
+
+	status = acpi_evaluate_integer(handle, "HEBC", NULL, &event_cap);
+	if (ACPI_SUCCESS(status) && (event_cap & 0x20000))
+		supported = true;
+
+	if (dmi_check_system(button_array_table))
+		supported = true;
+
+	return supported;
+}
+
 static int intel_hid_probe(struct platform_device *device)
 {
 	acpi_handle handle = ACPI_HANDLE(&device->dev);
-	unsigned long long event_cap, mode;
+	unsigned long long mode;
 	struct intel_hid_priv *priv;
 	acpi_status status;
 	int err;
@@ -299,8 +335,7 @@ static int intel_hid_probe(struct platform_device *device)
 	}
 
 	/* Setup 5 button array */
-	status = acpi_evaluate_integer(handle, "HEBC", NULL, &event_cap);
-	if (ACPI_SUCCESS(status) && (event_cap & 0x20000)) {
+	if (button_array_present(device)) {
 		dev_info(&device->dev, "platform supports 5 button array\n");
 		err = intel_button_array_input_setup(device);
 		if (err)
-- 
2.7.4
