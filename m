From: Tobias Regnery <tobias.regnery@gmail.com>
Subject: [PATCH] platform/x86: INT33FE: add i2c dependency
Date: Thu, 20 Apr 2017 14:51:59 +0200
Message-ID: <20170420125159.23846-1-tobias.regnery@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35535 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S945461AbdDTMzU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Apr 2017 08:55:20 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org, hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tobias Regnery <tobias.regnery@gmail.com>

With CONFIG_I2C=m and CONFIG_INTEL_CHT_INT33FE=y we see the following link
errors:

drivers/built-in.o: In function 'cht_int33fe_remove':
intel_cht_int33fe.c:(.text+0x391f6e): undefined reference to 'i2c_unregister_device'
intel_cht_int33fe.c:(.text+0x391f76): undefined reference to 'i2c_unregister_device'
intel_cht_int33fe.c:(.text+0x391f7d): undefined reference to 'i2c_unregister_device'
drivers/built-in.o: In function 'cht_int33fe_probe':
intel_cht_int33fe.c:(.text+0x392147): undefined reference to 'i2c_acpi_new_device'
intel_cht_int33fe.c:(.text+0x392185): undefined reference to 'i2c_acpi_new_device'
intel_cht_int33fe.c:(.text+0x3921bd): undefined reference to 'i2c_acpi_new_device'
intel_cht_int33fe.c:(.text+0x3921d9): undefined reference to 'i2c_unregister_device'
intel_cht_int33fe.c:(.text+0x3921e8): undefined reference to 'i2c_unregister_device'
drivers/built-in.o: In function 'cht_int33fe_driver_init':
intel_cht_int33fe.c:(.init.text+0x2386d): undefined reference to 'i2c_register_driver'
drivers/built-in.o: In function 'cht_int33fe_driver_exit':
intel_cht_int33fe.c:(.exit.text+0x206e): undefined reference to 'i2c_del_driver'

Fix this by adding a kconfig dependency on the I2C subsystem.

Fixes: 1cd706df8a9c ("platform/x86: Add Intel Cherry Trail ACPI INT33FE device driver")
Signed-off-by: Tobias Regnery <tobias.regnery@gmail.com>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 6b33db6c9d22..ea264fefb845 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -783,7 +783,7 @@ config ACPI_CMPC
 
 config INTEL_CHT_INT33FE
 	tristate "Intel Cherry Trail ACPI INT33FE Driver"
-	depends on X86 && ACPI
+	depends on X86 && ACPI && I2C
 	---help---
 	  This driver add support for the INT33FE ACPI device found on
 	  some Intel Cherry Trail devices.
-- 
2.11.0
