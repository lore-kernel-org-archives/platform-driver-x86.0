From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 2/3] platform/x86: intel-smartconnect: reuse module_acpi_driver
Date: Wed, 28 Aug 2013 14:48:42 +0300
Message-ID: <1377690523-3511-2-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1377690523-3511-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:23155 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752724Ab3H1LtA (ORCPT
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
 drivers/platform/x86/intel-smartconnect.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel-smartconnect.c b/drivers/platform/x86/intel-smartconnect.c
index f74e93d..d207497 100644
--- a/drivers/platform/x86/intel-smartconnect.c
+++ b/drivers/platform/x86/intel-smartconnect.c
@@ -74,17 +74,6 @@ static struct acpi_driver smartconnect_driver = {
 	},
 };
 
-static int smartconnect_init(void)
-{
-	return acpi_bus_register_driver(&smartconnect_driver);
-}
-
-static void smartconnect_exit(void)
-{
-	acpi_bus_unregister_driver(&smartconnect_driver);
-}
-
-module_init(smartconnect_init);
-module_exit(smartconnect_exit);
+module_acpi_driver(&smartconnect_driver);
 
 MODULE_DEVICE_TABLE(acpi, smartconnect_ids);
-- 
1.8.4.rc3
