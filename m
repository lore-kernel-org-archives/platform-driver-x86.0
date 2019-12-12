From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v4 5/5] platform/x86: intel_pmc_core: Add Atom based Elkhart Lake (EHL) platform support to intel_pmc_core driver
Date: Thu, 12 Dec 2019 10:38:47 -0800
Message-ID: <672ca6d153dd714687ab990f9fe5327296e9a242.1576105486.git.gayatri.kammela@intel.com>
References: <cover.1576105486.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1576105486.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1576105486.git.gayatri.kammela@intel.com>
References: <cover.1576105486.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: vishwanath.somayaji@intel.com, dvhart@infradead.org, linux-kernel@vger.kernel.org, mika.westerberg@intel.com, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kan Liang <kan.liang@intel.com>, "David E . Box" <david.e.box@intel.com>, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Tony Luck <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Add Elkhart Lake to the list of the platforms that intel_pmc_core
driver supports for pmc_core device.

Just like Ice Lake and Tiger Lake, Elkhart Lake can also reuse all the
Cannon Lake PCH IPs. Also, it uses the same PCH IPs of Tiger Lake, no
additional effort is needed to enable but to simply reuse them.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kan Liang <kan.liang@intel.com>
Cc: David E. Box <david.e.box@intel.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index b18782e48a5d..017776551cc5 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -192,8 +192,8 @@ static const struct pmc_bit_map cnp_pfear_map[] = {
 	{"SPE",                 BIT(5)},
 	{"Fuse",                BIT(6)},
 	/*
-	 * Reserved for Cannon Lake but valid for Ice Lake, Comet Lake
-	 * and Tiger Lake.
+	 * Reserved for Cannon Lake but valid for Ice Lake, Comet Lake,
+	 * Tiger Lake and Elkhart Lake.
 	 */
 	{"SBR8",		BIT(7)},
 
@@ -239,8 +239,8 @@ static const struct pmc_bit_map cnp_pfear_map[] = {
 	{"HDA_PGD5",            BIT(3)},
 	{"HDA_PGD6",            BIT(4)},
 	/*
-	 * Reserved for Cannon Lake but valid for Ice Lake, Comet Lake
-	 * and Tiger Lake.
+	 * Reserved for Cannon Lake but valid for Ice Lake, Comet Lake,
+	 * Tiger Lake and ELkhart Lake.
 	 */
 	{"PSF6",		BIT(5)},
 	{"PSF7",		BIT(6)},
@@ -273,7 +273,7 @@ static const struct pmc_bit_map *ext_icl_pfear_map[] = {
 };
 
 static const struct pmc_bit_map tgl_pfear_map[] = {
-	/* Tiger Lake generation onwards only */
+	/* Tiger Lake and Elkhart Lake generation onwards only */
 	{"PSF9",		BIT(0)},
 	{"RES_66",		BIT(1)},
 	{"RES_67",		BIT(2)},
@@ -881,6 +881,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
 	INTEL_CPU_FAM6(COMETLAKE_L, cnp_reg_map),
 	INTEL_CPU_FAM6(TIGERLAKE_L, tgl_reg_map),
 	INTEL_CPU_FAM6(TIGERLAKE, tgl_reg_map),
+	INTEL_CPU_FAM6(ATOM_TREMONT, tgl_reg_map),
 	{}
 };
 
-- 
2.17.1
