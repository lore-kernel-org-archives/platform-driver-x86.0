From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.9 13/17] platform/x86: acerhdf: Add BIOS entry for Gateway LT31 v1.3307
Date: Tue, 13 Nov 2018 00:52:19 -0500
Message-ID: <20181113055223.79060-13-sashal@kernel.org>
References: <20181113055223.79060-1-sashal@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113055223.79060-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Feuerer <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Paul Gortmaker <paul.gortmaker@windriver.com>

[ Upstream commit 684238d79ad85c5e19a71bb5818e77e329912fbc ]

To fix:

  acerhdf: unknown (unsupported) BIOS version Gateway  /LT31   /v1.3307 , please report, aborting!

As can be seen in the context, the BIOS registers haven't changed in
the previous versions, so the assumption is they won't have changed
in this last update for this somewhat older platform either.

Cc: Peter Feuerer <peter@piie.net>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Peter Feuerer <peter@piie.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/acerhdf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 2acdb0d6ea89..a0533e4e52d7 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -233,6 +233,7 @@ static const struct bios_settings bios_tbl[] = {
 	{"Gateway", "LT31",   "v1.3201",  0x55, 0x58, {0x9e, 0x00}, 0},
 	{"Gateway", "LT31",   "v1.3302",  0x55, 0x58, {0x9e, 0x00}, 0},
 	{"Gateway", "LT31",   "v1.3303t", 0x55, 0x58, {0x9e, 0x00}, 0},
+	{"Gateway", "LT31",   "v1.3307",  0x55, 0x58, {0x9e, 0x00}, 0},
 	/* Packard Bell */
 	{"Packard Bell", "DOA150",  "v0.3104",  0x55, 0x58, {0x21, 0x00}, 0},
 	{"Packard Bell", "DOA150",  "v0.3105",  0x55, 0x58, {0x20, 0x00}, 0},
-- 
2.17.1
