From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] samsung-laptop: fix config build error
Date: Thu, 22 Aug 2013 09:06:23 -0700
Message-ID: <521636FF.7090008@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:58359 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752807Ab3HVQGi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Aug 2013 12:06:38 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Matthew Garrett <matthew.garrett@nebula.com>

From: Randy Dunlap <rdunlap@infradead.org>

Fix build failure when ACPI_VIDEO=m and SAMSUNG_LAPTOP=y.
The patch prevents that specific config combination.

drivers/built-in.o: In function `samsung_init':
samsung-laptop.c:(.init.text+0x128ff): undefined reference to `acpi_video_unregister'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>

build testing:
ACPI_VIDEO=m, SAMSUNG_LAPTOP=m: OK
ACPI_VIDEO=y, SAMSUNG_LAPTOP=m: OK
ACPI_VIDEO=y, SAMSUNG_LAPTOP=y: OK
ACPI=n, SAMSUNG_LAPTOP=y: OK
ACPI=n, SAMSUNG_LAPTOP=m: OK
---
 drivers/platform/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20130820.orig/drivers/platform/x86/Kconfig
+++ linux-next-20130820/drivers/platform/x86/Kconfig
@@ -732,6 +732,7 @@ config SAMSUNG_LAPTOP
 	tristate "Samsung Laptop driver"
 	depends on X86
 	depends on RFKILL || RFKILL = n
+	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on BACKLIGHT_CLASS_DEVICE
 	select LEDS_CLASS
 	select NEW_LEDS
