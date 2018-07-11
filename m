From: Colin King <colin.king@canonical.com>
Subject: [PATCH] platform/x86: intel_ips: remove redundant variables slope and offset
Date: Wed, 11 Jul 2018 09:09:10 +0100
Message-ID: <20180711080910.4769-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variables slope and offset are being assigned but are never used hence
they are redundant and can be removed.

Cleans up clang warnings:
warning: variable 'slope' set but not used [-Wunused-but-set-variable]
warning: variable 'offset' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/intel_ips.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 014fc1634a3d..c5ece7ef08c6 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -858,10 +858,7 @@ static u16 read_mgtv(struct ips_driver *ips)
 
 static u16 read_ptv(struct ips_driver *ips)
 {
-	u16 val, slope, offset;
-
-	slope = (ips->pta_val & PTA_SLOPE_MASK) >> PTA_SLOPE_SHIFT;
-	offset = ips->pta_val & PTA_OFFSET_MASK;
+	u16 val;
 
 	val = thm_readw(THM_PTV) & PTV_MASK;
 
-- 
2.17.1
