From: Peter Kaestle <peter@piie.net>
Subject: [PATCH 1/2] platform/x86: Adding support for Acer Aspire 7551
Date: Sat, 19 Oct 2019 00:59:35 +0200
Message-ID: <20191018225936.131763-1-peter@piie.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Peter Feuerer <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Peter Feuerer <peter@piie.net>

platform/x86: Adding support for Acer Aspire 7551

Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Signed-off-by: Peter Feuerer <peter@piie.net>

---
 drivers/platform/x86/acerhdf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 5ea8da5f0f70..d40f365d8d7a 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -224,6 +224,8 @@ static const struct bios_settings bios_tbl[] __initconst = {
 	{"Acer", "Aspire 5739G", "V1.3311", 0x55, 0x58, {0x20, 0x00}, 0},
 	/* Acer TravelMate 7730 */
 	{"Acer", "TravelMate 7730G", "v0.3509", 0x55, 0x58, {0xaf, 0x00}, 0},
+	/* Acer Aspire 7551 */
+	{"Acer", "Aspire 7551", "V1.18", 0x93, 0xa8, {0x14, 0x04}, 1},
 	/* Acer TravelMate TM8573T */
 	{"Acer", "TM8573T", "V1.13", 0x93, 0xa8, {0x14, 0x04}, 1},
 	/* Gateway */
@@ -815,6 +817,7 @@ MODULE_ALIAS("dmi:*:*Acer*:pnAspire*5739G:");
 MODULE_ALIAS("dmi:*:*Acer*:pnAspire*One*753:");
 MODULE_ALIAS("dmi:*:*Acer*:pnAspire*5315:");
 MODULE_ALIAS("dmi:*:*Acer*:TravelMate*7730G:");
+MODULE_ALIAS("dmi:*:*Acer*:pnAspire*7551:");
 MODULE_ALIAS("dmi:*:*Acer*:TM8573T:");
 MODULE_ALIAS("dmi:*:*Gateway*:pnAOA*:");
 MODULE_ALIAS("dmi:*:*Gateway*:pnLT31*:");
-- 
2.23.0
