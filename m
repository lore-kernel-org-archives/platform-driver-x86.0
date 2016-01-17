From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 1/2] eeepc-wmi: Use acpi_dev_present()
Date: Sun, 17 Jan 2016 21:49:41 +0100
Message-ID: <d36c5ce68d2757834f2954a0555a258c20dd6b62.1453060661.git.lukas@wunner.de>
References: <cover.1453060661.git.lukas@wunner.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout1.hostsharing.net ([83.223.95.204]:35771 "EHLO
	mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751788AbcAQUuI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Jan 2016 15:50:08 -0500
In-Reply-To: <cover.1453060661.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net

Use shiny new acpi_dev_present() and remove all the boilerplate
to search for a particular ACPI device. No functional change.
Cf. 2d12b6b381ba ("ACPI / utils: Add acpi_dev_present()").

Cc: Corentin Chary <corentin.chary@gmail.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Acked-by: Darren Hart <dvhart@linux.intel.com>
---
 drivers/platform/x86/eeepc-wmi.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 14fd2ec..e1490db 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -204,30 +204,10 @@ static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
 	}
 }
 
-static acpi_status eeepc_wmi_parse_device(acpi_handle handle, u32 level,
-						 void *context, void **retval)
-{
-	pr_warn("Found legacy ATKD device (%s)\n", EEEPC_ACPI_HID);
-	*(bool *)context = true;
-	return AE_CTRL_TERMINATE;
-}
-
-static int eeepc_wmi_check_atkd(void)
-{
-	acpi_status status;
-	bool found = false;
-
-	status = acpi_get_devices(EEEPC_ACPI_HID, eeepc_wmi_parse_device,
-				  &found, NULL);
-
-	if (ACPI_FAILURE(status) || !found)
-		return 0;
-	return -1;
-}
-
 static int eeepc_wmi_probe(struct platform_device *pdev)
 {
-	if (eeepc_wmi_check_atkd()) {
+	if (acpi_dev_present(EEEPC_ACPI_HID)) {
+		pr_warn("Found legacy ATKD device (%s)\n", EEEPC_ACPI_HID);
 		pr_warn("WMI device present, but legacy ATKD device is also "
 			"present and enabled\n");
 		pr_warn("You probably booted with acpi_osi=\"Linux\" or "
-- 
1.8.5.2 (Apple Git-48)
