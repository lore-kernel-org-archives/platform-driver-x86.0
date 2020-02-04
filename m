From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v2 3/7] platform/x86: intel_pmc_core: Refactor the driver by removing redundant code
Date: Tue,  4 Feb 2020 15:01:56 -0800
Message-ID: <b73e135f66da250b98d2fd8b6e9ff5212372f247.1580848931.git.gayatri.kammela@intel.com>
References: <cover.1580848931.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1580848931.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1580848931.git.gayatri.kammela@intel.com>
References: <cover.1580848931.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Box <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

pmc_core_slps0_dbg_show() is responsible for displaying debug registers
through slp_s0_debug_status entry. The driver uses the same but
redundant code to dump these debug registers for an S0ix failure.

Hence, refactor the driver by removing redundant code and reuse the
same function that both dumps registers through slp_s0_debug_status
entry and in resume for an S0ix failure.

The changes in this patch are preparatory, so platforms that support low
power sub-states can dump the debug registers when the attempt to enter
low power states are unsuccessful.

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 48 +++++++++++++--------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index fc4da7c33dbf..9c66f253cf2b 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -845,30 +845,41 @@ static void pmc_core_slps0_dbg_latch(struct pmc_dev *pmcdev, bool reset)
 	mutex_unlock(&pmcdev->lock);
 }
 
-static int pmc_core_slps0_dbg_show(struct seq_file *s, void *unused)
+static void pmc_core_slps0_display(struct pmc_dev *pmcdev, struct device *dev,
+				   struct seq_file *s)
 {
-	struct pmc_dev *pmcdev = s->private;
 	const struct pmc_bit_map **maps = pmcdev->map->slps0_dbg_maps;
 	const struct pmc_bit_map *map;
-	int offset;
+	int offset = pmcdev->map->slps0_dbg_offset;
 	u32 data;
 
-	pmc_core_slps0_dbg_latch(pmcdev, false);
-	offset = pmcdev->map->slps0_dbg_offset;
 	while (*maps) {
 		map = *maps;
 		data = pmc_core_reg_read(pmcdev, offset);
 		offset += 4;
 		while (map->name) {
-			seq_printf(s, "SLP_S0_DBG: %-32s\tState: %s\n",
-				   map->name,
-				   data & map->bit_mask ?
-				   "Yes" : "No");
+			if (dev)
+				dev_dbg(dev, "SLP_S0_DBG: %-32s\tState: %s\n",
+					map->name,
+					data & map->bit_mask ? "Yes" : "No");
+			if (s)
+				seq_printf(s, "SLP_S0_DBG: %-32s\tState: %s\n",
+					   map->name,
+					   data & map->bit_mask ? "Yes" : "No");
 			++map;
 		}
 		++maps;
 	}
+}
+
+static int pmc_core_slps0_dbg_show(struct seq_file *s, void *unused)
+{
+	struct pmc_dev *pmcdev = s->private;
+
+	pmc_core_slps0_dbg_latch(pmcdev, false);
+	pmc_core_slps0_display(pmcdev, NULL, s);
 	pmc_core_slps0_dbg_latch(pmcdev, true);
+
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_slps0_dbg);
@@ -1263,10 +1274,6 @@ static inline bool pmc_core_is_s0ix_failed(struct pmc_dev *pmcdev)
 static int pmc_core_resume(struct device *dev)
 {
 	struct pmc_dev *pmcdev = dev_get_drvdata(dev);
-	const struct pmc_bit_map **maps = pmcdev->map->slps0_dbg_maps;
-	int offset = pmcdev->map->slps0_dbg_offset;
-	const struct pmc_bit_map *map;
-	u32 data;
 
 	if (!pmcdev->check_counters)
 		return 0;
@@ -1284,18 +1291,9 @@ static int pmc_core_resume(struct device *dev)
 	/* The real interesting case - S0ix failed - lets ask PMC why. */
 	dev_warn(dev, "CPU did not enter SLP_S0!!! (S0ix cnt=%llu)\n",
 		 pmcdev->s0ix_counter);
-	while (*maps) {
-		map = *maps;
-		data = pmc_core_reg_read(pmcdev, offset);
-		offset += 4;
-		while (map->name) {
-			dev_dbg(dev, "SLP_S0_DBG: %-32s\tState: %s\n",
-				map->name,
-				data & map->bit_mask ? "Yes" : "No");
-			map++;
-		}
-		maps++;
-	}
+	if (pmcdev->map->slps0_dbg_maps)
+		pmc_core_slps0_display(pmcdev, dev, NULL);
+
 	return 0;
 }
 
-- 
2.17.1
