From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 1/3] platform/x86: panasonic-laptop: reuse module_acpi_driver
Date: Wed, 28 Aug 2013 14:48:41 +0300
Message-ID: <1377690523-3511-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:51523 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752675Ab3H1LtA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 28 Aug 2013 07:49:00 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, Harald Welte <laforge@gnumonks.org>, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There is a macro to register and unregister modules in simple cases, Let's use
it and clean up the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/panasonic-laptop.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 984253d..014e5ed 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -643,23 +643,6 @@ out_hotkey:
 	return result;
 }
 
-static int __init acpi_pcc_init(void)
-{
-	int result = 0;
-
-	if (acpi_disabled)
-		return -ENODEV;
-
-	result = acpi_bus_register_driver(&acpi_pcc_driver);
-	if (result < 0) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-				  "Error registering hotkey driver\n"));
-		return -ENODEV;
-	}
-
-	return 0;
-}
-
 static int acpi_pcc_hotkey_remove(struct acpi_device *device)
 {
 	struct pcc_acpi *pcc = acpi_driver_data(device);
@@ -679,10 +662,4 @@ static int acpi_pcc_hotkey_remove(struct acpi_device *device)
 	return 0;
 }
 
-static void __exit acpi_pcc_exit(void)
-{
-	acpi_bus_unregister_driver(&acpi_pcc_driver);
-}
-
-module_init(acpi_pcc_init);
-module_exit(acpi_pcc_exit);
+module_acpi_driver(&acpi_pcc_driver);
-- 
1.8.4.rc3
