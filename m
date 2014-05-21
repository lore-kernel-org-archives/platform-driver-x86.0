From: Ismael Luceno <ismael.luceno@gmail.com>
Subject: [PATCHv2 2/2] platform x86 Kconfig: Refer to the laptop list in the Compal driver help
Date: Wed, 21 May 2014 17:24:28 -0300
Message-ID: <1400703868-17571-2-git-send-email-ismael.luceno@gmail.com>
References: <1400703868-17571-1-git-send-email-ismael.luceno@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yh0-f51.google.com ([209.85.213.51]:51066 "EHLO
	mail-yh0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752673AbaEUUZS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 May 2014 16:25:18 -0400
Received: by mail-yh0-f51.google.com with SMTP id f73so2161414yha.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 May 2014 13:25:17 -0700 (PDT)
In-Reply-To: <1400703868-17571-1-git-send-email-ismael.luceno@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Ismael Luceno <ismael.luceno@gmail.com>

Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
---
 drivers/platform/x86/Kconfig | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 27df2c5..3ba9c42 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -102,7 +102,7 @@ config DELL_LAPTOP
 	default n
 	---help---
 	This driver adds support for rfkill and backlight control to Dell
-	laptops.
+	laptops (except for some models covered by the Compal driver).
 
 config DELL_WMI
 	tristate "Dell WMI extras"
@@ -265,23 +265,21 @@ config PANASONIC_LAPTOP
 	  R2, R3, R5, T2, W2 and Y2 series), say Y.
 
 config COMPAL_LAPTOP
-	tristate "Compal Laptop Extras"
+	tristate "Compal (and others) Laptop Extras"
 	depends on ACPI
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on RFKILL
 	depends on HWMON
 	depends on POWER_SUPPLY
 	---help---
-	  This is a driver for laptops built by Compal:
+	  This is a driver for laptops built by Compal, and some models by
+	  other brands (e.g. Dell, Toshiba).
 
-	  Compal FL90/IFL90
-	  Compal FL91/IFL91
-	  Compal FL92/JFL92
-	  Compal FT00/IFT00
+	  It adds support for rfkill, Bluetooth, WLAN and LCD brightness
+	  control.
 
-	  It adds support for Bluetooth, WLAN and LCD brightness control.
-
-	  If you have an Compal FL9x/IFL9x/FT00 laptop, say Y or M here.
+	  For a (possibly incomplete) list of supported laptops, please refer
+	  to: Documentation/platform/x86-laptop-drivers.txt
 
 config SONY_LAPTOP
 	tristate "Sony Laptop Extras"
-- 
1.9.1
