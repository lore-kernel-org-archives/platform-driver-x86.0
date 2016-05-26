From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH 1/2] dell-wmi, dell-laptop: hide dell-smbios
Date: Thu, 26 May 2016 11:42:12 +0200
Message-ID: <20160526114212.2b17ee2d@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35602 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753305AbcEZJmP convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 May 2016 05:42:15 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>

Dell-smbios is a helper module, it serves no purpose on its own, so
do not present it as an option to the user. Instead, select it
automatically whenever a driver which needs it is selected.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
Cc: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>
---
 drivers/platform/x86/Kconfig |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- linux-4.6.orig/drivers/platform/x86/Kconfig	2016-05-16 00:43:13.000=
000000 +0200
+++ linux-4.6/drivers/platform/x86/Kconfig	2016-05-26 11:18:50.02910379=
0 +0200
@@ -92,7 +92,7 @@ config ASUS_LAPTOP
 	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
=20
 config DELL_SMBIOS
-	tristate "Dell SMBIOS Support"
+	tristate
 	depends on DCDBAS
 	default n
 	---help---
@@ -104,12 +104,13 @@ config DELL_SMBIOS
 config DELL_LAPTOP
 	tristate "Dell Laptop Extras"
 	depends on X86
-	depends on DELL_SMBIOS
 	depends on DMI
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
 	depends on RFKILL || RFKILL =3D n
 	depends on SERIO_I8042
+	depends on DCDBAS
+	select DELL_SMBIOS
 	select POWER_SUPPLY
 	select LEDS_CLASS
 	select NEW_LEDS
@@ -124,7 +125,8 @@ config DELL_WMI
 	depends on DMI
 	depends on INPUT
 	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
-	depends on DELL_SMBIOS
+	depends on DCDBAS
+	select DELL_SMBIOS
 	select INPUT_SPARSEKMAP
 	---help---
 	  Say Y here if you want to support WMI-based hotkeys on Dell laptops=
=2E


--=20
Jean Delvare
SUSE L3 Support
