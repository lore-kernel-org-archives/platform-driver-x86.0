From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH] alienware-wmi: Adjust instance of all wmi_evaluate_method calls to 0
Date: Wed, 21 Jun 2017 17:01:35 -0500
Message-ID: <1498082495-3329-1-git-send-email-mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa3.dell-outbound.iphmx.com ([68.232.153.94]:32940 "EHLO
        esa3.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752353AbdFUWBv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jun 2017 18:01:51 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>

Pali recently noticed that WMI instances are zero indexed.

The only reason that these calls all worked properly is because the ASL
didn't verify the instance number.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/alienware-wmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index d6b3492..9866fec 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -303,7 +303,7 @@ static int alienware_update_led(struct platform_zone *zone)
 	}
 	pr_debug("alienware-wmi: guid %s method %d\n", guid, method_id);
 
-	status = wmi_evaluate_method(guid, 1, method_id, &input, NULL);
+	status = wmi_evaluate_method(guid, 0, method_id, &input, NULL);
 	if (ACPI_FAILURE(status))
 		pr_err("alienware-wmi: zone set failure: %u\n", status);
 	return ACPI_FAILURE(status);
@@ -352,7 +352,7 @@ static int wmax_brightness(int brightness)
 	};
 	input.length = (acpi_size) sizeof(args);
 	input.pointer = &args;
-	status = wmi_evaluate_method(WMAX_CONTROL_GUID, 1,
+	status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
 				     WMAX_METHOD_BRIGHTNESS, &input, NULL);
 	if (ACPI_FAILURE(status))
 		pr_err("alienware-wmi: brightness set failure: %u\n", status);
@@ -506,10 +506,10 @@ static acpi_status alienware_wmax_command(struct wmax_basic_args *in_args,
 	if (out_data != NULL) {
 		output.length = ACPI_ALLOCATE_BUFFER;
 		output.pointer = NULL;
-		status = wmi_evaluate_method(WMAX_CONTROL_GUID, 1,
+		status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
 					     command, &input, &output);
 	} else
-		status = wmi_evaluate_method(WMAX_CONTROL_GUID, 1,
+		status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
 					     command, &input, NULL);
 
 	if (ACPI_SUCCESS(status) && out_data != NULL) {
-- 
2.7.4
