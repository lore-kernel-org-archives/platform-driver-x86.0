From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] platform/x86: have ACPI_CMPC use depends instead of select
 for INPUT
Date: Sun, 14 Jan 2018 21:11:18 -0800
Message-ID: <913480bb-d06a-3f13-e8fc-20f83ff499a0@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:35668 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753258AbeAOFLW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jan 2018 00:11:22 -0500
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

From: Randy Dunlap <rdunlap@infradead.org>

Drivers should not 'select' a subsystem. Instead they should depend
on it. If the subsystem is disabled, the user probably did that for
a purpose and one driver shouldn't be changing that.

This also makes all platform/x86/ drivers consistent w.r.t depending on
INPUT instead of selecting it.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
---
 drivers/platform/x86/Kconfig |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- lnx-415-rc8.orig/drivers/platform/x86/Kconfig
+++ lnx-415-rc8/drivers/platform/x86/Kconfig
@@ -812,9 +812,8 @@ config TOSHIBA_WMI
 
 config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
-	depends on ACPI
+	depends on ACPI && INPUT
 	depends on RFKILL || RFKILL=n
-	select INPUT
 	select BACKLIGHT_CLASS_DEVICE
 	help
 	  Support for Intel Classmate PC ACPI devices, including some
