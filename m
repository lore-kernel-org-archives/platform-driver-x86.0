From: Ismael Luceno <ismael.luceno@gmail.com>
Subject: [PATCH] platform: x86: Kconfig: Mention Dell models supported by the Compal driver
Date: Sun, 18 May 2014 14:36:11 -0300
Message-ID: <1400434571-17644-1-git-send-email-ismael.luceno@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yh0-f41.google.com ([209.85.213.41]:48923 "EHLO
	mail-yh0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751927AbaERRgq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 18 May 2014 13:36:46 -0400
Received: by mail-yh0-f41.google.com with SMTP id f73so6107361yha.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 May 2014 10:36:45 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Ismael Luceno <ismael.luceno@gmail.com>

Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
---
 drivers/platform/x86/Kconfig | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 27df2c5..4dbe1e4 100644
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
@@ -265,7 +265,7 @@ config PANASONIC_LAPTOP
 	  R2, R3, R5, T2, W2 and Y2 series), say Y.
 
 config COMPAL_LAPTOP
-	tristate "Compal Laptop Extras"
+	tristate "Compal (and Dell) Laptop Extras"
 	depends on ACPI
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on RFKILL
@@ -279,9 +279,19 @@ config COMPAL_LAPTOP
 	  Compal FL92/JFL92
 	  Compal FT00/IFT00
 
-	  It adds support for Bluetooth, WLAN and LCD brightness control.
+	  And following laptops by Dell:
+
+	  Dell Mini 9 (Inspiron 910)
+	  Dell Mini 10 (Inspiron 1010)
+	  Dell Mini 10v (Inspiron 1011)
+	  Dell Mini 1012 (Inspiron 1012)
+	  Dell Inspiron 11z (Inspiron 1110)
+	  Dell Mini 12 (Inspiron 1210)
+
+	  It adds support for rfkill, Bluetooth, WLAN and LCD brightness
+	  control.
 
-	  If you have an Compal FL9x/IFL9x/FT00 laptop, say Y or M here.
+	  If you have any of the aforementioned models, say Y or M here.
 
 config SONY_LAPTOP
 	tristate "Sony Laptop Extras"
-- 
1.9.1
