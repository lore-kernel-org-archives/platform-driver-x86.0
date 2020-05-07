From: Chih-Wei Huang <cwhuang@linux.org.tw>
Subject: [PATCH] platform/x86: acerhdf: replace space by * in modalias
Date: Thu,  7 May 2020 11:12:01 +0800
Message-ID: <20200507031201.20460-1-cwhuang@linux.org.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Borislav Petkov <bp@suse.de>, Chih-Wei Huang <cwhuang@linux.org.tw>, =?UTF-8?q?Peter=20K=C3=A4stle?= <peter@piie.net>
List-Id: platform-driver-x86.vger.kernel.org

Using space in module alias makes it harder to parse modules.alias.
Replace it by a star(*).

Reviewed-by: Peter Kästle <peter@piie.net>
Signed-off-by: Chih-Wei Huang <cwhuang@linux.org.tw>
---
 drivers/platform/x86/acerhdf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 505224225378..306ea92d5b10 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -837,7 +837,7 @@ MODULE_ALIAS("dmi:*:*Packard*Bell*:pnDOTMU*:");
 MODULE_ALIAS("dmi:*:*Packard*Bell*:pnENBFT*:");
 MODULE_ALIAS("dmi:*:*Packard*Bell*:pnDOTMA*:");
 MODULE_ALIAS("dmi:*:*Packard*Bell*:pnDOTVR46*:");
-MODULE_ALIAS("dmi:*:*Acer*:pnExtensa 5420*:");
+MODULE_ALIAS("dmi:*:*Acer*:pnExtensa*5420*:");
 
 module_init(acerhdf_init);
 module_exit(acerhdf_exit);
-- 
2.21.1
