From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v1 1/2] platform/x86: intel_pmc_core: Fix the SoC naming inconsistency
Date: Mon, 18 Nov 2019 11:05:40 -0800
Message-ID: <5223c0997563b885b51bfd249835875de3d31647.1574102528.git.gayatri.kammela@intel.com>
References: <cover.1574102528.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1574102528.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1574102528.git.gayatri.kammela@intel.com>
References: <cover.1574102528.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: vishwanath.somayaji@intel.com, dvhart@infradead.org, linux-kernel@vger.kernel.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Mario Limonciello <mario.limonciello@dell.com>, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kan Liang <kan.liang@intel.com>, "David E . Box" <david.e.box@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Tony Luck <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Intel's SoCs follow a naming convention which spells out the SoC name as
two words instead of one word (E.g: Cannon Lake vs Cannonlake). Thus fix
the naming inconsistency across the intel_pmc_core driver, so future
SoCs can follow the naming consistency as below.

Cometlake -> Comet Lake
Tigerlake -> Tiger Lake
Elkhartlake -> Elkhart Lake

Cc: Mario Limonciello <mario.limonciello@dell.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kan Liang <kan.liang@intel.com>
Cc: David E. Box <david.e.box@intel.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Tony Luck <tony.luck@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 94a008efb09b..6b6edc30f835 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -158,7 +158,7 @@ static const struct pmc_reg_map spt_reg_map = {
 	.pm_vric1_offset = SPT_PMC_VRIC1_OFFSET,
 };
 
-/* Cannonlake: PGD PFET Enable Ack Status Register(s) bitmap */
+/* Cannon Lake: PGD PFET Enable Ack Status Register(s) bitmap */
 static const struct pmc_bit_map cnp_pfear_map[] = {
 	{"PMC",                 BIT(0)},
 	{"OPI-DMI",             BIT(1)},
@@ -185,7 +185,7 @@ static const struct pmc_bit_map cnp_pfear_map[] = {
 	{"SDX",                 BIT(4)},
 	{"SPE",                 BIT(5)},
 	{"Fuse",                BIT(6)},
-	/* Reserved for Cannonlake but valid for Icelake */
+	/* Reserved for Cannon Lake but valid for Ice Lake */
 	{"SBR8",		BIT(7)},
 
 	{"CSME_FSC",            BIT(0)},
@@ -229,12 +229,12 @@ static const struct pmc_bit_map cnp_pfear_map[] = {
 	{"HDA_PGD4",            BIT(2)},
 	{"HDA_PGD5",            BIT(3)},
 	{"HDA_PGD6",            BIT(4)},
-	/* Reserved for Cannonlake but valid for Icelake */
+	/* Reserved for Cannon Lake but valid for Ice Lake */
 	{"PSF6",		BIT(5)},
 	{"PSF7",		BIT(6)},
 	{"PSF8",		BIT(7)},
 
-	/* Icelake generation onwards only */
+	/* Ice Lake generation onwards only */
 	{"RES_65",		BIT(0)},
 	{"RES_66",		BIT(1)},
 	{"RES_67",		BIT(2)},
@@ -324,7 +324,7 @@ static const struct pmc_bit_map cnp_ltr_show_map[] = {
 	{"ISH",			CNP_PMC_LTR_ISH},
 	{"UFSX2",		CNP_PMC_LTR_UFSX2},
 	{"EMMC",		CNP_PMC_LTR_EMMC},
-	/* Reserved for Cannonlake but valid for Icelake */
+	/* Reserved for Cannon Lake but valid for Ice Lake */
 	{"WIGIG",		ICL_PMC_LTR_WIGIG},
 	/* Below two cannot be used for LTR_IGNORE */
 	{"CURRENT_PLATFORM",	CNP_PMC_LTR_CUR_PLT},
@@ -871,8 +871,8 @@ static int pmc_core_probe(struct platform_device *pdev)
 	pmcdev->map = (struct pmc_reg_map *)cpu_id->driver_data;
 
 	/*
-	 * Coffeelake has CPU ID of Kabylake and Cannonlake PCH. So here
-	 * Sunrisepoint PCH regmap can't be used. Use Cannonlake PCH regmap
+	 * Coffee Lake has CPU ID of Kaby Lake and Cannon Lake PCH. So here
+	 * Sunrisepoint PCH regmap can't be used. Use Cannon Lake PCH regmap
 	 * in this case.
 	 */
 	if (pmcdev->map == &spt_reg_map && !pci_dev_present(pmc_pci_ids))
-- 
2.17.1
