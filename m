From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: setup accelerometer when machine has appropriate notify event
Date: Mon, 29 Aug 2016 18:00:21 +0800
Message-ID: <1472464821-10360-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:34333 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756125AbcH2KC3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Aug 2016 06:02:29 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>

The accelerometer event relies on on the ACERWMID_EVENT_GUID notify.
So, this patch changes the codes to setup accelerometer input device
when detected ACERWMID_EVENT_GUID. It avoids that the accel input
device created on every acer machines.

In addition, patch adds a clearly parsing logic of accelerometer hid
to acer_wmi_get_handle_cb callback function. It is positive matching
the "SENR" name with "BST0001" device to avoid non-supported hardware.

Reported-by: Bjørn Mork <bjorn@mork.no>
Cc: Darren Hart <dvhart@infradead.org>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 79d64ea..3bb3162 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1808,11 +1808,24 @@ static int __init acer_wmi_enable_lm(void)
 	return status;
 }
 
+#define ACER_WMID_ACCEL_HID	"BST0001"
+
 static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
 						void *ctx, void **retval)
 {
+	struct acpi_device *dev;
+
+	if (strcmp(ctx, "SENR")) {
+		if (acpi_bus_get_device(ah, &dev))
+			return AE_OK;
+		if (!strcmp(ACER_WMID_ACCEL_HID, acpi_device_hid(dev)))
+			return AE_OK;
+	} else
+		return AE_OK;
+
 	*(acpi_handle *)retval = ah;
-	return AE_OK;
+
+	return AE_CTRL_TERMINATE;
 }
 
 static int __init acer_wmi_get_handle(const char *name, const char *prop,
@@ -1839,7 +1852,7 @@ static int __init acer_wmi_accel_setup(void)
 {
 	int err;
 
-	err = acer_wmi_get_handle("SENR", "BST0001", &gsensor_handle);
+	err = acer_wmi_get_handle("SENR", ACER_WMID_ACCEL_HID, &gsensor_handle);
 	if (err)
 		return err;
 
@@ -2177,10 +2190,11 @@ static int __init acer_wmi_init(void)
 		err = acer_wmi_input_setup();
 		if (err)
 			return err;
+		err = acer_wmi_accel_setup();
+		if (err)
+			return err;
 	}
 
-	acer_wmi_accel_setup();
-
 	err = platform_driver_register(&acer_platform_driver);
 	if (err) {
 		pr_err("Unable to register platform driver\n");
-- 
2.1.4
