From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH 2/2] platform/x86: Drop duplicate dependencies on X86
Date: Thu, 26 May 2016 11:43:23 +0200
Message-ID: <20160526114323.763237f5@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35735 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752268AbcEZJn0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 May 2016 05:43:26 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>

The whole menu depends on X86 so there is no point in repeating this
dependency on individual driver entries.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Darren Hart <dvhart@infradead.org>
---
 drivers/platform/x86/Kconfig |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

--- linux-4.6.orig/drivers/platform/x86/Kconfig	2016-05-26 11:18:50.029103790 +0200
+++ linux-4.6/drivers/platform/x86/Kconfig	2016-05-26 11:35:23.704400044 +0200
@@ -103,7 +103,6 @@ config DELL_SMBIOS
 
 config DELL_LAPTOP
 	tristate "Dell Laptop Extras"
-	depends on X86
 	depends on DMI
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
@@ -751,7 +750,7 @@ config TOSHIBA_WMI
 
 config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
-	depends on X86 && ACPI
+	depends on ACPI
 	depends on RFKILL || RFKILL=n
 	select INPUT
 	select BACKLIGHT_CLASS_DEVICE
@@ -850,7 +849,7 @@ config INTEL_IMR
 
 config IBM_RTL
 	tristate "Device driver to enable PRTL support"
-	depends on X86 && PCI
+	depends on PCI
 	---help---
 	 Enable support for IBM Premium Real Time Mode (PRTM).
 	 This module will allow you the enter and exit PRTM in the BIOS via
@@ -884,7 +883,6 @@ config XO15_EBOOK
 
 config SAMSUNG_LAPTOP
 	tristate "Samsung Laptop driver"
-	depends on X86
 	depends on RFKILL || RFKILL = n
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on BACKLIGHT_CLASS_DEVICE


-- 
Jean Delvare
SUSE L3 Support
