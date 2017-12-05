From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] intel-hid: add a DMI quirk to support Wacom Mobile Studio Pro
Date: Tue,  5 Dec 2017 15:52:12 +0800
Message-ID: <1512460332-7420-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:34068 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752397AbdLEHwT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Dec 2017 02:52:19 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org
Cc: killertofu@gmail.com

HEBC method reports capabilities of 5 button array but Wacom Mobile
Studio Pro does not have this control method. A DMI quirk was created to
enable 5 button array for this system.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197991

Reported-by: Jason Gerecke <killertofu@gmail.com>
Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/intel-hid.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index f470279..54d761c 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -25,6 +25,7 @@
 #include <linux/acpi.h>
 #include <linux/suspend.h>
 #include <acpi/acpi_bus.h>
+#include <linux/dmi.h>
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alex Hung");
@@ -73,6 +74,17 @@ static const struct key_entry intel_array_keymap[] = {
 	{ KE_END },
 };
 
+static const struct dmi_system_id button_array_table[] = {
+	{
+		.ident = "Wacom Mobile Studio Pro",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Skylake"),
+		},
+	},
+	{ }
+};
+
 struct intel_hid_priv {
 	struct input_dev *input_dev;
 	struct input_dev *array;
@@ -263,10 +275,27 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
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
@@ -299,8 +328,7 @@ static int intel_hid_probe(struct platform_device *device)
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
