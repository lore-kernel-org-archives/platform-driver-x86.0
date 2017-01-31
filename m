From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] platform: x86: fix silead_dmi build error and depends
Date: Mon, 30 Jan 2017 16:44:17 -0800
Message-ID: <8c34389b-9ea3-88af-7d63-db1ca746083b@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:39915 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753689AbdAaBEj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2017 20:04:39 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

This driver cannot be built as a loadable module, so it should not
be built unless I2C=y and INPUT=y.

Fixes this build error:
drivers/built-in.o: In function `silead_ts_dmi_init':
silead_dmi.c:(.init.text+0xf00e): undefined reference to `i2c_bus_type'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

I don't see why the "depends on INPUT" was there at all,
but I modified its requirement anyway.  Maybe it can be removed...

--- linux-next-20170130.orig/drivers/platform/x86/Kconfig
+++ linux-next-20170130/drivers/platform/x86/Kconfig
@@ -1079,7 +1079,7 @@ config INTEL_TURBO_MAX_3
 
 config SILEAD_DMI
 	bool "Tablets with Silead touchscreens"
-	depends on ACPI && DMI && I2C && INPUT
+	depends on ACPI && DMI && I2C=y && INPUT=y
 	---help---
 	  Certain ACPI based tablets with Silead touchscreens do not have
 	  enough data in ACPI tables for the touchscreen driver to handle
