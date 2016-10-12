From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] platform/x86: asus-wmi: add SERIO_I8042 dependency
Date: Wed, 12 Oct 2016 21:31:40 +0200
Message-ID: <20161012193224.127356-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Oleksij Rempel <linux@rempel-privat.de>, Arnd Bergmann <arnd@arndb.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

A recent bugfix added a call to i8042_install_filter but did
not add the dependency, leading to possible link errors:

drivers/platform/built-in.o: In function `asus_nb_wmi_quirks':
asus-nb-wmi.c:(.text+0x23af): undefined reference to `i8042_install_filter'

This adds a dependency on SERIO_I8042||SERIO_I8042=n to indicate
that we can build the driver when the i8042 driver is disabled,
but it cannot be built-in when that is a loadable module.

Fixes: b5643539b825 ("platform/x86: asus-wmi: Filter buggy scan codes on ASUS Q500A")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9756c8354b37..6bca28472605 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -576,6 +576,7 @@ config ASUS_WMI
 config ASUS_NB_WMI
 	tristate "Asus Notebook WMI Driver"
 	depends on ASUS_WMI
+	depends on SERIO_I8042 || SERIO_I8042 = n
 	---help---
 	  This is a driver for newer Asus notebooks. It adds extra features
 	  like wireless radio and bluetooth control, leds, hotkeys, backlight...
-- 
2.9.0
