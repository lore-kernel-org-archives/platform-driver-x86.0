From: Peter Kaestle <peter@piie.net>
Subject: [PATCH 2/2] treewide: Rename Peter Feuerer to Peter Kaestle
Date: Sat, 19 Oct 2019 00:59:36 +0200
Message-ID: <20191018225936.131763-2-peter@piie.net>
References: <20191018225936.131763-1-peter@piie.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191018225936.131763-1-peter@piie.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: platform-driver-x86.vger.kernel.org

treewide: Rename Peter Feuerer to Peter Kaestle

Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Peter Kaestle <peter@piie.net>

---
 MAINTAINERS                     | 2 +-
 drivers/platform/x86/acerhdf.c  | 4 ++--
 drivers/thermal/gov_bang_bang.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0154674cbad3..a907670c5e79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,7 +295,7 @@ S:	Maintained
 F:	drivers/net/ethernet/alteon/acenic*
 
 ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER
-M:	Peter Feuerer <peter@piie.net>
+M:	Peter Kaestle <peter@piie.net>
 L:	platform-driver-x86@vger.kernel.org
 W:	http://piie.net/?section=acerhdf
 S:	Maintained
diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index d40f365d8d7a..8cc86f4e3ac1 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -4,7 +4,7 @@
  *           of the aspire one netbook, turns on/off the fan
  *           as soon as the upper/lower threshold is reached.
  *
- * (C) 2009 - Peter Feuerer     peter (a) piie.net
+ * (C) 2009 - Peter Kaestle     peter (a) piie.net
  *                              http://piie.net
  *     2009 Borislav Petkov	bp (a) alien8.de
  *
@@ -803,7 +803,7 @@ static void __exit acerhdf_exit(void)
 }
 
 MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Peter Feuerer");
+MODULE_AUTHOR("Peter Kaestle");
 MODULE_DESCRIPTION("Aspire One temperature and fan driver");
 MODULE_ALIAS("dmi:*:*Acer*:pnAOA*:");
 MODULE_ALIAS("dmi:*:*Acer*:pnAO751h*:");
diff --git a/drivers/thermal/gov_bang_bang.c b/drivers/thermal/gov_bang_bang.c
index e0575d29023a..b831fc77cf64 100644
--- a/drivers/thermal/gov_bang_bang.c
+++ b/drivers/thermal/gov_bang_bang.c
@@ -2,7 +2,7 @@
 /*
  *  gov_bang_bang.c - A simple thermal throttling governor using hysteresis
  *
- *  Copyright (C) 2014 Peter Feuerer <peter@piie.net>
+ *  Copyright (C) 2014 Peter Kaestle <peter@piie.net>
  *
  *  Based on step_wise.c with following Copyrights:
  *  Copyright (C) 2012 Intel Corp
-- 
2.23.0
