From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH v2] dell-wmi, dell-laptop: hide dell-smbios
Date: Wed, 4 Jan 2017 13:59:17 +0100
Message-ID: <20170104135917.43eedcc0@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?B?TWljaGHFgiBLxJlwaWU=?= =?UTF-8?B?xYQ=?= <kernel@kempniu.pl>, Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Dell-smbios is a helper module, it serves no purpose on its own, so
do not present it as an option to the user. Instead, select it
automatically whenever a driver which needs it is selected.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Michał Kępień <kernel@kempniu.pl>
Cc: Pali Rohár <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>
---
Changes since v1:
 * Select DCDBAS instead of depending on it. This is more
   user-friendly and avoids the confusing transitive dependencies
   which Pali didn't like.

 drivers/platform/x86/Kconfig |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-4.10-rc2.orig/drivers/platform/x86/Kconfig	2017-01-01 23:31:53.000000000 +0100
+++ linux-4.10-rc2/drivers/platform/x86/Kconfig	2017-01-04 13:53:41.691262664 +0100
@@ -92,8 +92,8 @@ config ASUS_LAPTOP
 	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
 
 config DELL_SMBIOS
-	tristate "Dell SMBIOS Support"
-	depends on DCDBAS
+	tristate
+	select DCDBAS
 	default n
 	---help---
 	This module provides common functions for kernel modules using
@@ -103,12 +103,12 @@ config DELL_SMBIOS
 
 config DELL_LAPTOP
 	tristate "Dell Laptop Extras"
-	depends on DELL_SMBIOS
 	depends on DMI
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on RFKILL || RFKILL = n
 	depends on SERIO_I8042
+	select DELL_SMBIOS
 	select POWER_SUPPLY
 	select LEDS_CLASS
 	select NEW_LEDS
@@ -123,7 +123,7 @@ config DELL_WMI
 	depends on DMI
 	depends on INPUT
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
-	depends on DELL_SMBIOS
+	select DELL_SMBIOS
 	select INPUT_SPARSEKMAP
 	---help---
 	  Say Y here if you want to support WMI-based hotkeys on Dell laptops.

-- 
Jean Delvare
SUSE L3 Support
