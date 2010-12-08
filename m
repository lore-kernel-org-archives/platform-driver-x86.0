From: Peter Huewe <peterhuewe@gmx.de>
Subject: [PATCH] platform/x86: Fix recursive Kconfig dependency
Date: Thu,  9 Dec 2010 00:29:30 +0100
Message-ID: <1291850970-7190-1-git-send-email-peterhuewe@gmx.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.23]:43975 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with SMTP
	id S1754659Ab0LHX3h (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Dec 2010 18:29:37 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>

This patch removes a recursive dependency which causes a build failure
[1-3] by changing the ASUS_WMI from select ACPI_WMI to depend on
ACPI_WMI as most other _WMI config options do.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
Error Message:
drivers/platform/x86/Kconfig:422:error: recursive dependency detected!
drivers/platform/x86/Kconfig:422:	symbol EEEPC_WMI depends on ACPI_WMI
drivers/platform/x86/Kconfig:438:	symbol ACPI_WMI is selected by ACER_WMI
drivers/platform/x86/Kconfig:18:	symbol ACER_WMI depends on LEDS_CLASS
drivers/leds/Kconfig:10:	symbol LEDS_CLASS is selected by EEEPC_WMI


References:
[1] http://kisskb.ellerman.id.au/kisskb/buildresult/3607123/
[2] http://kisskb.ellerman.id.au/kisskb/buildresult/3607218/
[3] http://kisskb.ellerman.id.au/kisskb/buildresult/3607139/

KernelVersion: linux-next-20101208

 drivers/platform/x86/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4c7f8b9..ddf384a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -23,7 +23,7 @@ config ACER_WMI
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on SERIO_I8042
 	depends on RFKILL || RFKILL = n
-	select ACPI_WMI
+	depends on ACPI_WMI
 	---help---
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
 	  wireless radio and bluetooth control, and on some laptops,
-- 
1.7.2.2
