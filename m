From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Subject: [PATCH] platform/x86: intel_pmc_core: update TGL's LPM0 reg bit map name
Date: Wed, 24 Jun 2020 23:16:16 -0700
Message-ID: <20200625061616.85278-1-sathyanarayana.nujella@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, andriy.shevchenko@intel.com
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, andy@infradead.org, gayatri.kammela@intel.com, Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>, Arava Jairaj <jairaj.arava@intel.com>, "David E . Box" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

PMC debug tools use lpm0's 23rd bit to reflect Main PLL, not just
Audio PLL. So, update tgl_lpm0 debug reg bit map name.

Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Arava Jairaj <jairaj.arava@intel.com>
Acked-by: David E. Box <david.e.box@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index d2a5d4c36715..60bf93638f55 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -415,7 +415,7 @@ static const struct pmc_bit_map tgl_lpm0_map[] = {
 	{"PCIe_Gen3PLL_OFF_STS",		BIT(20)},
 	{"OPIOPLL_OFF_STS",			BIT(21)},
 	{"OCPLL_OFF_STS",			BIT(22)},
-	{"AudioPLL_OFF_STS",			BIT(23)},
+	{"MainPLL_OFF_STS",			BIT(23)},
 	{"MIPIPLL_OFF_STS",			BIT(24)},
 	{"Fast_XTAL_Osc_OFF_STS",		BIT(25)},
 	{"AC_Ring_Osc_OFF_STS",			BIT(26)},
-- 
2.27.0
