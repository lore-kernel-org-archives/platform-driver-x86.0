From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] platform/x86: INT33FE: add I2C dependency
Date: Fri, 21 Apr 2017 23:03:13 +0200
Message-ID: <20170421210331.876697-1-arnd@arndb.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:49854 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1041148AbdDUVER (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Apr 2017 17:04:17 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

When I2C is disabled, we get a link error:

drivers/platform/built-in.o: In function `cht_int33fe_remove':
intel_cht_int33fe.c:(.text+0x8ba): undefined reference to `i2c_unregister_device'
drivers/platform/built-in.o: In function `cht_int33fe_probe':
intel_cht_int33fe.c:(.text+0x9ec): undefined reference to `i2c_acpi_new_device'
intel_cht_int33fe.c:(.text+0xa7a): undefined reference to `i2c_unregister_device'

This adds a Kconfig dependency to ensure I2C is available to this
driver.

Fixes: 1cd706df8a9c ("platform/x86: Add Intel Cherry Trail ACPI INT33FE device driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 76ced87efde5..4c7db1fbac26 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -782,7 +782,7 @@ config ACPI_CMPC
 
 config INTEL_CHT_INT33FE
 	tristate "Intel Cherry Trail ACPI INT33FE Driver"
-	depends on X86 && ACPI
+	depends on X86 && ACPI && I2C
 	---help---
 	  This driver add support for the INT33FE ACPI device found on
 	  some Intel Cherry Trail devices.
-- 
2.9.0
