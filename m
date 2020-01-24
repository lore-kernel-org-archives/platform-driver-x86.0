From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v1] platform/x86: Add Atom based Jasper Lake (JSL) platform support to intel_pmc_core driver
Date: Fri, 24 Jan 2020 10:59:28 -0800
Message-ID: <325960f10edc2418d8c92b5176743472dfbcd486.1579892112.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Box <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Add Jasper Lake to the list of the platforms that intel_pmc_core
driver supports for pmc_core device.

Just like Ice Lake, Tiger Lake and Elkhart Lake, Jasper Lake can also
reuse all the Cannon Lake PCH IPs. Also, it uses the same PCH IPs of
Tiger Lake, no additional effort is needed to enable but to simply reuse
them.

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index d583cd5adb31..73ee27c4b027 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -193,7 +193,7 @@ static const struct pmc_bit_map cnp_pfear_map[] = {
 	{"Fuse",                BIT(6)},
 	/*
 	 * Reserved for Cannon Lake but valid for Ice Lake, Comet Lake,
-	 * Tiger Lake and Elkhart Lake.
+	 * Tiger Lake, Elkhart Lake and Jasper Lake.
 	 */
 	{"SBR8",		BIT(7)},
 
@@ -240,7 +240,7 @@ static const struct pmc_bit_map cnp_pfear_map[] = {
 	{"HDA_PGD6",            BIT(4)},
 	/*
 	 * Reserved for Cannon Lake but valid for Ice Lake, Comet Lake,
-	 * Tiger Lake and ELkhart Lake.
+	 * Tiger Lake, ELkhart Lake and Jasper Lake.
 	 */
 	{"PSF6",		BIT(5)},
 	{"PSF7",		BIT(6)},
@@ -273,7 +273,7 @@ static const struct pmc_bit_map *ext_icl_pfear_map[] = {
 };
 
 static const struct pmc_bit_map tgl_pfear_map[] = {
-	/* Tiger Lake and Elkhart Lake generation onwards only */
+	/* Tiger Lake, Elkhart Lake and Jasper Lake generation onwards only */
 	{"PSF9",		BIT(0)},
 	{"RES_66",		BIT(1)},
 	{"RES_67",		BIT(2)},
@@ -1138,6 +1138,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
 	INTEL_CPU_FAM6(TIGERLAKE_L, tgl_reg_map),
 	INTEL_CPU_FAM6(TIGERLAKE, tgl_reg_map),
 	INTEL_CPU_FAM6(ATOM_TREMONT, tgl_reg_map),
+	INTEL_CPU_FAM6(ATOM_TREMONT_L, tgl_reg_map),
 	{}
 };
 
-- 
2.17.1
