From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v4 1/5] platform/x86: intel_pmc_core: Clean up: Remove comma after the termination line
Date: Thu, 12 Dec 2019 10:38:43 -0800
Message-ID: <df7f9854e7205ec77caa33d89aaab14acc70f740.1576105486.git.gayatri.kammela@intel.com>
References: <cover.1576105486.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1576105486.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1576105486.git.gayatri.kammela@intel.com>
References: <cover.1576105486.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: vishwanath.somayaji@intel.com, dvhart@infradead.org, linux-kernel@vger.kernel.org, mika.westerberg@intel.com, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kan Liang <kan.liang@intel.com>, "David E . Box" <david.e.box@intel.com>, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Tony Luck <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

It is common practice to place a comma after the last entry in an
initialized array to avoid the need to add one in future patches that
extend the array. But when the last element is a termination marker, the
comma could be harmful. Any new entries must be added before the
terminator (and the comma would prevent the compiler from issuing a
warning about an entry after the terminator).

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kan Liang <kan.liang@intel.com>
Cc: David E. Box <david.e.box@intel.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 571b4754477c..f7256168bb8f 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -49,7 +49,7 @@ static const struct pmc_bit_map spt_pll_map[] = {
 	{"GEN2 USB2PCIE2 PLL",		SPT_PMC_BIT_MPHY_CMN_LANE1},
 	{"DMIPCIE3 PLL",		SPT_PMC_BIT_MPHY_CMN_LANE2},
 	{"SATA PLL",			SPT_PMC_BIT_MPHY_CMN_LANE3},
-	{},
+	{}
 };
 
 static const struct pmc_bit_map spt_mphy_map[] = {
@@ -69,7 +69,7 @@ static const struct pmc_bit_map spt_mphy_map[] = {
 	{"MPHY CORE LANE 13",          SPT_PMC_BIT_MPHY_LANE13},
 	{"MPHY CORE LANE 14",          SPT_PMC_BIT_MPHY_LANE14},
 	{"MPHY CORE LANE 15",          SPT_PMC_BIT_MPHY_LANE15},
-	{},
+	{}
 };
 
 static const struct pmc_bit_map spt_pfear_map[] = {
@@ -113,7 +113,7 @@ static const struct pmc_bit_map spt_pfear_map[] = {
 	{"CSME_SMS1",			SPT_PMC_BIT_CSME_SMS1},
 	{"CSME_RTC",			SPT_PMC_BIT_CSME_RTC},
 	{"CSME_PSF",			SPT_PMC_BIT_CSME_PSF},
-	{},
+	{}
 };
 
 static const struct pmc_bit_map spt_ltr_show_map[] = {
@@ -300,7 +300,7 @@ static const struct pmc_bit_map *cnp_slps0_dbg_maps[] = {
 	cnp_slps0_dbg0_map,
 	cnp_slps0_dbg1_map,
 	cnp_slps0_dbg2_map,
-	NULL,
+	NULL
 };
 
 static const struct pmc_bit_map cnp_ltr_show_map[] = {
@@ -823,7 +823,7 @@ MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_ids);
 
 static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, SPT_PMC_PCI_DEVICE_ID), 0},
-	{ 0, },
+	{ 0, }
 };
 
 /*
-- 
2.17.1
