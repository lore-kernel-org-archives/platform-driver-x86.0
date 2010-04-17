From: =?UTF-8?B?w4lyaWMgUGllbA==?= <Eric.Piel@tremplin-utc.net>
Subject: [PATCH 2/2] Make BACKLIGHT_CLASS_DEVICE be selected automatically
 when needed
Date: Sat, 17 Apr 2010 02:24:04 +0200
Message-ID: <4BC8FFA4.2090906@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailservice.tudelft.nl ([130.161.131.5]:47744 "EHLO
	mailservice.tudelft.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932816Ab0DQAYG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 16 Apr 2010 20:24:06 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Andrew Morton <akpm@osdl.org>
Cc: "Brown, Len" <len.brown@intel.com>, Matthew Garrett <mjg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Many different modules depend on BACKLIGHT_CLASS_DEVICE, and are
situated in completely different places. In Kconfig, some used to "depe=
nd"
on it, while others "selected" it. Excepted for the drivers just below
the option, it's easier for the user to have it automatically
selected whenever needed. So we consistently "select" it for platform
and ACPI drivers.

Signed-off-by: =C3=89ric Piel <eric.piel@tremplin-utc.net>
---
 drivers/acpi/Kconfig         |    3 ++-
 drivers/platform/x86/Kconfig |   18 +++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index 93d2c79..50b45ca 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -161,8 +161,9 @@ config ACPI_BUTTON
=20
 config ACPI_VIDEO
 	tristate "Video"
-	depends on X86 && BACKLIGHT_CLASS_DEVICE && VIDEO_OUTPUT_CONTROL
+	depends on X86 && VIDEO_OUTPUT_CONTROL
 	depends on INPUT
+	select BACKLIGHT_CLASS_DEVICE
 	select THERMAL
 	help
 	  This driver implements the ACPI Extensions For Display Adapters
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index 9808ef3..f8a43de 100644
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
@@ -57,9 +57,9 @@ config ASUS_LAPTOP
 	depends on !ACPI_ASUS
 	select LEDS_CLASS
 	select NEW_LEDS
-	select BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
 	depends on RFKILL || RFKILL =3D n
+	select BACKLIGHT_CLASS_DEVICE
 	select INPUT_SPARSEKMAP
 	---help---
 	  This is the new Linux driver for Asus laptops. It may also support =
some
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
@@ -101,8 +101,8 @@ config FUJITSU_LAPTOP
 	tristate "Fujitsu Laptop Extras"
 	depends on ACPI
 	depends on INPUT
-	depends on BACKLIGHT_CLASS_DEVICE
 	depends on LEDS_CLASS || LEDS_CLASS=3Dn
+	select BACKLIGHT_CLASS_DEVICE
 	---help---
 	  This is a driver for laptops built by Fujitsu:
=20
@@ -149,8 +149,8 @@ config HP_WMI
 config MSI_LAPTOP
 	tristate "MSI Laptop Extras"
 	depends on ACPI
-	depends on BACKLIGHT_CLASS_DEVICE
 	depends on RFKILL
+	select BACKLIGHT_CLASS_DEVICE
 	---help---
 	  This is a driver for laptops built by MSI (MICRO-STAR
 	  INTERNATIONAL):
@@ -168,7 +168,7 @@ config MSI_LAPTOP
 config PANASONIC_LAPTOP
 	tristate "Panasonic Laptop Extras"
 	depends on INPUT && ACPI
-	depends on BACKLIGHT_CLASS_DEVICE
+	select BACKLIGHT_CLASS_DEVICE
 	---help---
 	  This driver adds support for access to backlight control and hotkey=
s
 	  on Panasonic Let's Note laptops.
@@ -179,8 +179,8 @@ config PANASONIC_LAPTOP
 config COMPAL_LAPTOP
 	tristate "Compal Laptop Extras"
 	depends on ACPI
-	depends on BACKLIGHT_CLASS_DEVICE
 	depends on RFKILL
+	select BACKLIGHT_CLASS_DEVICE
 	---help---
 	  This is a driver for laptops built by Compal:
=20
@@ -196,9 +196,9 @@ config COMPAL_LAPTOP
 config SONY_LAPTOP
 	tristate "Sony Laptop Extras"
 	depends on ACPI
-	select BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
 	depends on RFKILL
+	select BACKLIGHT_CLASS_DEVICE
 	  ---help---
 	  This mini-driver drives the SNC and SPIC devices present in the ACP=
I
 	  BIOS of the Sony Vaio laptops.
@@ -420,7 +420,7 @@ config ACPI_WMI
 config MSI_WMI
 	tristate "MSI WMI extras"
 	depends on INPUT
-	depends on BACKLIGHT_CLASS_DEVICE
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
