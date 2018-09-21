From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 4/6] platform/x86: acerhdf: Add BIOS entry for Gateway LT31 v1.3307
Date: Thu, 20 Sep 2018 21:44:19 -0400
Message-ID: <20180921014421.30804-5-paul.gortmaker@windriver.com>
References: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Feuerer <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

To fix:

  acerhdf: unknown (unsupported) BIOS version Gateway  /LT31   /v1.3307 , please report, aborting!

As can be seen in the context, the BIOS registers haven't changed in
the previous versions, so the assumption is they won't have changed
in this last update for this somewhat older platform either.

Cc: Peter Feuerer <peter@piie.net>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/platform/x86/acerhdf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index fef3b727bc24..eddcd8e94a88 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -236,6 +236,7 @@ static const struct bios_settings bios_tbl[] = {
 	{"Gateway", "LT31",   "v1.3201",  0x55, 0x58, {0x9e, 0x00}, 0},
 	{"Gateway", "LT31",   "v1.3302",  0x55, 0x58, {0x9e, 0x00}, 0},
 	{"Gateway", "LT31",   "v1.3303t", 0x55, 0x58, {0x9e, 0x00}, 0},
+	{"Gateway", "LT31",   "v1.3307",  0x55, 0x58, {0x9e, 0x00}, 0},
 	/* Packard Bell */
 	{"Packard Bell", "DOA150",  "v0.3104",  0x55, 0x58, {0x21, 0x00}, 0},
 	{"Packard Bell", "DOA150",  "v0.3105",  0x55, 0x58, {0x20, 0x00}, 0},
-- 
2.15.0
