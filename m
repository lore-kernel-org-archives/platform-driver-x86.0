From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v1 5/7] platform/x86: intel_pmc_core: Add an additional parameter to pmc_core_lpm_display()
Date: Fri, 24 Jan 2020 10:50:26 -0800
Message-ID: <73c834f8bd84ab36dfb8ef69cf6756f2fd27771c.1579890793.git.gayatri.kammela@intel.com>
References: <cover.1579890793.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1579890793.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1579890793.git.gayatri.kammela@intel.com>
References: <cover.1579890793.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Box <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Add a device pointer of type struct device as an additional parameter to
pmc_core_lpm_display(), so that the driver can re-use it to dump the
debug registers in resume for an S0ix failure.

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 338607b0a4e6..0018fdd0194b 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -972,8 +972,9 @@ static int pmc_core_substate_res_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_res);
 
-static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct seq_file *s,
-				 u32 offset, const char *str,
+static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
+				 struct seq_file *s, u32 offset,
+				 const char *str,
 				 const struct pmc_bit_map **maps)
 {
 	u32 lpm_regs[ARRAY_SIZE(tgl_lpm_maps)-1];
@@ -985,11 +986,22 @@ static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct seq_file *s,
 	}
 
 	for (idx = 0; maps[idx]; idx++) {
-		seq_printf(s, "\nLPM_%s_%d:\t0x%x\n", str, idx, lpm_regs[idx]);
+		if (dev)
+			dev_dbg(dev, "\nLPM_%s_%d:\t0x%x\n", str, idx,
+				lpm_regs[idx]);
+		if (s)
+			seq_printf(s, "\nLPM_%s_%d:\t0x%x\n", str, idx,
+				   lpm_regs[idx]);
 		for (index = 0; maps[idx][index].name && index < len; index++) {
 			bit_mask = maps[idx][index].bit_mask;
-			seq_printf(s, "%-30s %-30d\n", maps[idx][index].name,
-				   lpm_regs[idx] & bit_mask ? 1 : 0);
+			if (dev)
+				dev_dbg(dev, "%-30s %-30d\n",
+					maps[idx][index].name,
+					lpm_regs[idx] & bit_mask ? 1 : 0);
+			if (s)
+				seq_printf(s, "%-30s %-30d\n",
+					   maps[idx][index].name,
+					   lpm_regs[idx] & bit_mask ? 1 : 0);
 		}
 	}
 }
@@ -1000,7 +1012,7 @@ static int pmc_core_substate_sts_regs_show(struct seq_file *s, void *unused)
 	const struct pmc_bit_map **maps = pmcdev->map->lpm_sts;
 	u32 offset = pmcdev->map->lpm_status_offset;
 
-	pmc_core_lpm_display(pmcdev, s, offset, "STATUS", maps);
+	pmc_core_lpm_display(pmcdev, NULL, s, offset, "STATUS", maps);
 
 	return 0;
 }
-- 
2.17.1
