From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 3/3] platform/x86: Enable build support for toshiba_haps
Date: Thu, 14 Aug 2014 09:53:10 -0600
Message-ID: <1408031590-2727-4-git-send-email-coproscefalo@gmail.com>
References: <1408031590-2727-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:50766 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755336AbaHNPxl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Aug 2014 11:53:41 -0400
Received: by mail-oa0-f49.google.com with SMTP id eb12so1118827oac.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Aug 2014 08:53:41 -0700 (PDT)
In-Reply-To: <1408031590-2727-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garret <matthew.garret@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Makefile and Kconfig build support patch for the newly introduced
kernel module toshiba_haps.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 Documentation/laptops/00-INDEX |  2 ++
 drivers/platform/x86/Kconfig   | 19 +++++++++++++++++++
 drivers/platform/x86/Makefile  |  1 +
 3 files changed, 22 insertions(+)

diff --git a/Documentation/laptops/00-INDEX b/Documentation/laptops/00-INDEX
index d399ae1..a3b4f20 100644
--- a/Documentation/laptops/00-INDEX
+++ b/Documentation/laptops/00-INDEX
@@ -18,3 +18,5 @@ sonypi.txt
 	- info on Linux Sony Programmable I/O Device support.
 thinkpad-acpi.txt
 	- information on the (IBM and Lenovo) ThinkPad ACPI Extras driver.
+toshiba_haps.txt
+	- information on the Toshiba HDD Active Protection Sensor driver.
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 172f26c..3bbcbf1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -652,6 +652,25 @@ config TOSHIBA_BT_RFKILL
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
+	  level and reseting the HDD protection interface.
+
+	  If you have a recent Toshiba laptop with a built-in accelerometer
+	  device, say Y.
+
 config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
 	depends on X86 && ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index c4ca428..f82232b 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
 obj-$(CONFIG_ACPI_TOSHIBA)	+= toshiba_acpi.o
 
 obj-$(CONFIG_TOSHIBA_BT_RFKILL)	+= toshiba_bluetooth.o
+obj-$(CONFIG_TOSHIBA_HAPS)	+= toshiba_haps.o
 obj-$(CONFIG_INTEL_SCU_IPC)	+= intel_scu_ipc.o
 obj-$(CONFIG_INTEL_SCU_IPC_UTIL) += intel_scu_ipcutil.o
 obj-$(CONFIG_INTEL_MFLD_THERMAL) += intel_mid_thermal.o
-- 
2.0.0
