From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] platform/x86: fix surface3_button build errors
Date: Tue, 27 Dec 2016 14:28:51 -0800
Message-ID: <4b805dc9-4eeb-10bb-7db5-85defa32a304@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:47192 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753801AbcL0W3Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Dec 2016 17:29:16 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>
Cc: kbuild test robot <fengguang.wu@intel.com>, Benjamin Tissoires <benjamin.tissoires@gmail.com>

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors when I2C=m and SURFACE_3_BUTTON=y.
The driver uses i2c interfaces so it should depend on I2C.

drivers/built-in.o: In function `surface3_driver_init':
surface3_button.c:(.init.text+0x75cb0): undefined reference to `i2c_register_driver'
drivers/built-in.o: In function `surface3_driver_exit':
surface3_button.c:(.exit.text+0x31a8): undefined reference to `i2c_del_driver'

Fixes: 1a64b719d3ae (platform/x86: Introduce button support for the Surface 3)

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>
---
 drivers/platform/x86/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-410-rc1.orig/drivers/platform/x86/Kconfig
+++ lnx-410-rc1/drivers/platform/x86/Kconfig
@@ -1034,7 +1034,7 @@ config SURFACE_PRO3_BUTTON
 
 config SURFACE_3_BUTTON
 	tristate "Power/home/volume buttons driver for Microsoft Surface 3 tablet"
-	depends on ACPI && KEYBOARD_GPIO
+	depends on ACPI && KEYBOARD_GPIO && I2C
 	---help---
 	  This driver handles the power/home/volume buttons on the Microsoft Surface 3 tablet.
 
