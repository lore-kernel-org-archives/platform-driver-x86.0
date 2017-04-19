From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] platform/x86: hp-wireless: reuse module_acpi_driver
Date: Wed, 19 Apr 2017 22:27:31 +0300
Message-ID: <20170419192731.17850-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alex Hung <alex.hung@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

There is a macro to register and unregister modules in simple cases,
Let's use it and clean up the driver.

Cc: Alex Hung <alex.hung@canonical.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/hp-wireless.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/hp-wireless.c
index d860ea0d0e60..d6ea5e998fb8 100644
--- a/drivers/platform/x86/hp-wireless.c
+++ b/drivers/platform/x86/hp-wireless.c
@@ -110,21 +110,4 @@ static struct acpi_driver hpwl_driver = {
 	},
 };
 
-static int __init hpwl_init(void)
-{
-	int err;
-
-	err = acpi_bus_register_driver(&hpwl_driver);
-	if (err)
-		pr_err("Unable to register HP wireless control driver.\n");
-
-	return err;
-}
-
-static void __exit hpwl_exit(void)
-{
-	acpi_bus_unregister_driver(&hpwl_driver);
-}
-
-module_init(hpwl_init);
-module_exit(hpwl_exit);
+module_acpi_driver(hpwl_driver);
-- 
2.11.0
