From: =?UTF-8?B?w4lyaWMgUGllbA==?= <Eric.Piel@tremplin-utc.net>
Subject: [PATCH 2/2 v2] Make BACKLIGHT_CLASS_DEVICE be selected automatically
 when needed
Date: Sat, 17 Apr 2010 14:54:54 +0200
Message-ID: <4BC9AF9E.8040902@tremplin-utc.net>
References: <4BC8FFA4.2090906@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailservice.tudelft.nl ([130.161.131.5]:46345 "EHLO
	mailservice.tudelft.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751112Ab0DQMy7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 17 Apr 2010 08:54:59 -0400
In-Reply-To: <4BC8FFA4.2090906@tremplin-utc.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Andrew Morton <akpm@osdl.org>
Cc: "Brown, Len" <len.brown@intel.com>, Matthew Garrett <mjg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Here is a new version, compatible with the v2 of PATCH 1.

Eric
8<----------------------------------

Many different modules depend on BACKLIGHT_CLASS_DEVICE, and are
situated in completely different places. In Kconfig, some used to "depe=
nd"
on it, while others "selected" it. Excepted for the drivers just below
the option, it's easier for the user to have it automatically
selected whenever needed. So we consistently "select" it for platform
and ACPI drivers.

Signed-off-by: =C3=89ric Piel <eric.piel@tremplin-utc.net>
---
 drivers/platform/x86/Kconfig |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index 28c33e8..de5e99d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -19,9 +19,9 @@ config ACER_WMI
 	depends on ACPI
 	depends on LEDS_CLASS
 	depends on NEW_LEDS
-	depends on BACKLIGHT_CLASS_DEVICE
 	depends on SERIO_I8042
 	depends on RFKILL || RFKILL =3D n
+	select BACKLIGHT_CLASS_DEVICE
 	select ACPI_WMI
 	---help---
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
@@ -78,10 +78,10 @@ config DELL_LAPTOP
 	depends on X86
 	depends on DCDBAS
 	depends on EXPERIMENTAL
-	depends on BACKLIGHT_CLASS_DEVICE
 	depends on RFKILL || RFKILL =3D n
 	depends on POWER_SUPPLY
 	depends on SERIO_I8042
+	select BACKLIGHT_CLASS_DEVICE
 	default n
 	---help---
 	This driver adds support for rfkill and backlight control to Dell
@@ -102,8 +102,8 @@ config FUJITSU_LAPTOP
 	tristate "Fujitsu Laptop Extras"
 	depends on ACPI
 	depends on INPUT
-	depends on BACKLIGHT_CLASS_DEVICE
 	depends on LEDS_CLASS || LEDS_CLASS=3Dn
+	select BACKLIGHT_CLASS_DEVICE
 	---help---
 	  This is a driver for laptops built by Fujitsu:
=20
@@ -151,8 +151,8 @@ config HP_WMI
 config MSI_LAPTOP
 	tristate "MSI Laptop Extras"
 	depends on ACPI
-	depends on BACKLIGHT_CLASS_DEVICE
 	depends on RFKILL
+	select BACKLIGHT_CLASS_DEVICE
 	---help---
 	  This is a driver for laptops built by MSI (MICRO-STAR
 	  INTERNATIONAL):
@@ -170,7 +170,7 @@ config MSI_LAPTOP
 config PANASONIC_LAPTOP
 	tristate "Panasonic Laptop Extras"
 	depends on INPUT && ACPI
-	depends on BACKLIGHT_CLASS_DEVICE
+	select BACKLIGHT_CLASS_DEVICE
 	---help---
 	  This driver adds support for access to backlight control and hotkey=
s
 	  on Panasonic Let's Note laptops.
@@ -181,8 +181,8 @@ config PANASONIC_LAPTOP
 config COMPAL_LAPTOP
 	tristate "Compal Laptop Extras"
 	depends on ACPI
-	depends on BACKLIGHT_CLASS_DEVICE
 	depends on RFKILL
+	select BACKLIGHT_CLASS_DEVICE
 	---help---
 	  This is a driver for laptops built by Compal:
=20
@@ -423,8 +423,8 @@ config ACPI_WMI
 config MSI_WMI
 	tristate "MSI WMI extras"
 	depends on INPUT
-	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI
+	select BACKLIGHT_CLASS_DEVICE
 	select ACPI_WMI
 	select INPUT_SPARSEKMAP
 	help
--=20
1.7.0.5

--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
