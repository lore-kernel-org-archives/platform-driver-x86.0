From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] platform/x86: never 'select DMI' from a driver
Date: Mon, 29 Feb 2016 13:13:31 +0100
Message-ID: <1456748014-358588-1-git-send-email-arnd@arndb.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:54705 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754013AbcB2MOe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 07:14:34 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, Andy Lutomirski <luto@kernel.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Arnd Bergmann <arnd@arndb.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

CONFIG_DMI is a user-selectable Kconfig symbol that some drivers
depend on. As part of a recent patch, other drivers started
adding a 'select' for the same symbol, which now causes
a recursive dependency:

drivers/gpio/Kconfig:34:error: recursive dependency detected!
subsection "Kconfig recursive dependency limitations"
drivers/gpio/Kconfig:34:        symbol GPIOLIB is selected by GEOS
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
arch/x86/Kconfig:2591:  symbol GEOS depends on DMI
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
arch/x86/Kconfig:815:   symbol DMI is selected by DELL_LAPTOP
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/platform/x86/Kconfig:104:       symbol DELL_LAPTOP depends on BACKLIGHT_CLASS_DEVICE
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/backlight/Kconfig:158:    symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:192:        symbol FB_BACKLIGHT is selected by FB_SSD1307
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:2462:       symbol FB_SSD1307 depends on GPIOLIB

Basically we should either always use 'depends on' or always use 'select'
to avoid this kind of loop. Using 'depends on' is more useful here,
as it still allows users to turn off the symbol of they really
want to, without having to track down every driver selecting it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: cbd9d95b2b27 ("dell-wmi, dell-laptop: select DMI")
---
 drivers/platform/x86/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 659e13b1e6f0..a65d974f387a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -105,6 +105,7 @@ config DELL_LAPTOP
 	tristate "Dell Laptop Extras"
 	depends on X86
 	depends on DELL_SMBIOS
+	depends on DMI
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on RFKILL || RFKILL = n
@@ -112,7 +113,6 @@ config DELL_LAPTOP
 	select POWER_SUPPLY
 	select LEDS_CLASS
 	select NEW_LEDS
-	select DMI
 	default n
 	---help---
 	This driver adds support for rfkill and backlight control to Dell
@@ -121,10 +121,10 @@ config DELL_LAPTOP
 config DELL_WMI
 	tristate "Dell WMI extras"
 	depends on ACPI_WMI
+	depends on DMI
 	depends on INPUT
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	select INPUT_SPARSEKMAP
-	select DMI
 	---help---
 	  Say Y here if you want to support WMI-based hotkeys on Dell laptops.
 
-- 
2.7.0
