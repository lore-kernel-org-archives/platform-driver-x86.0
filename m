From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v3 7/7] platform/x86: Add Comet Lake (CML) platform support to intel_pmc_core driver
Date: Thu, 14 Nov 2019 09:01:20 -0800
Message-ID: <d43af9c7b3c536c489cdb925adb2204256099952.1573750525.git.gayatri.kammela@intel.com>
References: <cover.1573750525.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1573750525.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1573750525.git.gayatri.kammela@intel.com>
References: <cover.1573750525.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: vishwanath.somayaji@intel.com, dvhart@infradead.org, linux-kernel@vger.kernel.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kan Liang <kan.liang@intel.com>, "David E . Box" <david.e.box@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Tony Luck <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Add Comet Lake to the list of the platforms that intel_pmc_core driver
supports for pmc_core device.

Just like Ice Lake, Tiger Lake and Elkhart Lake, Comet Lake can also
reuse all the Cannon Lake PCH IPs. No additional effort is needed to
enable but to simply reuse them.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kan Liang <kan.liang@intel.com>
Cc: David E. Box <david.e.box@intel.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Tony Luck <tony.luck@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 94081710e0de..a9b33ac4e52d 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -165,6 +165,7 @@ static const struct pmc_reg_map spt_reg_map = {
 
 /* Cannon Lake: PGD PFET Enable Ack Status Register(s) bitmap */
 static const struct pmc_bit_map cnp_pfear_map[] = {
+	/* Reserved for Cannon Lake but valid for Comet Lake */
 	{"PMC",                 BIT(0)},
 	{"OPI-DMI",             BIT(1)},
 	{"SPI/eSPI",            BIT(2)},
@@ -879,6 +880,8 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
 	INTEL_CPU_FAM6(TIGERLAKE_L, tgl_reg_map),
 	INTEL_CPU_FAM6(TIGERLAKE, tgl_reg_map),
 	INTEL_CPU_FAM6(ATOM_TREMONT, tgl_reg_map),
+	INTEL_CPU_FAM6(COMETLAKE, cnp_reg_map),
+	INTEL_CPU_FAM6(COMETLAKE_L, cnp_reg_map),
 	{}
 };
 
-- 
2.17.1
