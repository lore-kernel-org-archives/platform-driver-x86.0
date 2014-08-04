From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 3/3] platform/x86: Enable build support for toshiba_haps
Date: Mon,  4 Aug 2014 09:27:15 -0600
Message-ID: <1407166035-2020-4-git-send-email-coproscefalo@gmail.com>
References: <1407166035-2020-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:63508 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751499AbaHDP1X (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Aug 2014 11:27:23 -0400
Received: by mail-oa0-f45.google.com with SMTP id i7so5152838oag.32
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Aug 2014 08:27:23 -0700 (PDT)
In-Reply-To: <1407166035-2020-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Makefile and Kconfig build support patch for the newly introduced
kernel module toshiba_haps.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 172f26c..f9a8a29 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -652,6 +652,26 @@ config TOSHIBA_BT_RFKILL
 	  If you have a modern Toshiba laptop with a Bluetooth and an
 	  RFKill switch (such as the Portege R500), say Y.
 
+config TOSHIBA_HAPS
+	tristate "Toshiba HDD Active Protection Sensor"
+	depends on ACPI
+	---help---
+	  This driver adds support for the built-in accelerometer
+	  found on recent Toshiba laptops equiped with HID TOS620A
+	  device.
+
+	  This driver receives ACPI notify events 0x80 when the sensor
+	  detects a sudden move or a harsh vibration, as well as an
+	  ACPI notify event 0x81 whenever the movement or vibration has
+	  been stabilized.
+
+	  Also provides sysfs entries to get/set the desired protection
+	  level, reading the movement status of the sensor and resting the
+	  HDD protection interface.
+
+	  If you have a recent Toshiba laptop with a built-in accelerometer
+	  device, say Y.
+
 config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
 	depends on X86 && ACPI
-- 
2.0.0
