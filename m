From: "Darren Hart (VMware)" <dvhart@infradead.org>
Subject: [PATCH] platform/x86: Make SILEAD_DMI depend on TOUCHSCREEN_SILEAD
Date: Fri, 28 Apr 2017 14:00:19 -0700
Message-ID: <20170428210019.GA32026@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:39596 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1423378AbdD1VAV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 17:00:21 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>, Jean Delvare <jdelvare@suse.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>

SILEAD_DMI provides platform specific data for the TOUCHSCREEN_SILEAD
driver. Make this explicitly clear in the Kconfig depends.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: Jean Delvare <jdelvare@suse.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9e5b2c2..5690664 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1101,7 +1101,7 @@ config INTEL_TURBO_MAX_3
 
 config SILEAD_DMI
 	bool "Tablets with Silead touchscreens"
-	depends on ACPI && DMI && I2C=y && INPUT
+	depends on ACPI && DMI && I2C=y && INPUT && TOUCHSCREEN_SILEAD
 	---help---
 	  Certain ACPI based tablets with Silead touchscreens do not have
 	  enough data in ACPI tables for the touchscreen driver to handle
-- 
2.9.3


-- 
Darren Hart
VMware Open Source Technology Center
