From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 3/3] platform/x86: intel-rst: reuse module_acpi_driver
Date: Wed, 28 Aug 2013 14:48:43 +0300
Message-ID: <1377690523-3511-3-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1377690523-3511-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:51523 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752844Ab3H1LtA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 28 Aug 2013 07:49:00 -0400
In-Reply-To: <1377690523-3511-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, Harald Welte <laforge@gnumonks.org>, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There is a macro to register and unregister modules in simple cases, Let's use
it and clean up the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel-rst.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel-rst.c b/drivers/platform/x86/intel-rst.c
index 9385afd..fb2f1e2 100644
--- a/drivers/platform/x86/intel-rst.c
+++ b/drivers/platform/x86/intel-rst.c
@@ -193,17 +193,6 @@ static struct acpi_driver irst_driver = {
 	},
 };
 
-static int irst_init(void)
-{
-	return acpi_bus_register_driver(&irst_driver);
-}
-
-static void irst_exit(void)
-{
-	acpi_bus_unregister_driver(&irst_driver);
-}
-
-module_init(irst_init);
-module_exit(irst_exit);
+module_acpi_driver(&irst_driver);
 
 MODULE_DEVICE_TABLE(acpi, irst_ids);
-- 
1.8.4.rc3
