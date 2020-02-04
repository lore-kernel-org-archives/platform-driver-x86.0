From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v2 6/7] platform/x86: intel_pmc_core: Dump low power status registers on an S0ix.y failure
Date: Tue,  4 Feb 2020 15:01:59 -0800
Message-ID: <d629338e3b21724733a5c6ce0fdea2f1a814ca83.1580848931.git.gayatri.kammela@intel.com>
References: <cover.1580848931.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1580848931.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1580848931.git.gayatri.kammela@intel.com>
References: <cover.1580848931.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Box <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Platforms prior to Tiger Lake has no sub-states of S0ix and accessing
device PM states that are latched whenever there is a PC10 entry is
possible with the help of slp_s0_debug_status and slp_s0_dbg_latch
debugfs entries.

If a platform has sub-states of S0ix, no such entries are created.
Hence, dump low power status registers on resume When any attempt to
enter any low power state was unsuccessful.

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
Suggested-by: David Box <david.e.box@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 41426d4af887..62cce906755e 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -1284,6 +1284,8 @@ static inline bool pmc_core_is_s0ix_failed(struct pmc_dev *pmcdev)
 static int pmc_core_resume(struct device *dev)
 {
 	struct pmc_dev *pmcdev = dev_get_drvdata(dev);
+	const struct pmc_bit_map **maps = pmcdev->map->lpm_sts;
+	int offset = pmcdev->map->lpm_status_offset;
 
 	if (!pmcdev->check_counters)
 		return 0;
@@ -1303,6 +1305,8 @@ static int pmc_core_resume(struct device *dev)
 		 pmcdev->s0ix_counter);
 	if (pmcdev->map->slps0_dbg_maps)
 		pmc_core_slps0_display(pmcdev, dev, NULL);
+	if (pmcdev->map->lpm_sts)
+		pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset, maps);
 
 	return 0;
 }
-- 
2.17.1
