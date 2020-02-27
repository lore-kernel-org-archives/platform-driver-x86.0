From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v1 2/4] platform/x86: intel_pmc_core: fix: Relocate pmc_core_slps0_display() and pmc_core_lpm_display() to outside of CONFIG_DEBUG_FS
Date: Wed, 26 Feb 2020 18:43:28 -0800
Message-ID: <329f6dbbe6c7b690cd87db9e8ca05dc86a7b0393.1582770011.git.gayatri.kammela@intel.com>
References: <cover.1582770011.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1582770011.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1582770011.git.gayatri.kammela@intel.com>
References: <cover.1582770011.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Chen Zhou <chenzhou10@huawei.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David E . Box" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Since pmc_core_slps0_display() and pmc_core_lpm_display() is responsible
for dumping as well as displaying debug registers, there is no need for
these two functions to be defined under CONFIG_DEBUG_FS.

Hence, relocate these functions from under CONFIG_DEBUG_FS to above the
block.

Cc: Chen Zhou <chenzhou10@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David E. Box <david.e.box@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 130 +++++++++++++-------------
 1 file changed, 65 insertions(+), 65 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 333c6963d270..37db13ad7d39 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -612,6 +612,71 @@ static int pmc_core_check_read_lock_bit(void)
 	return value & BIT(pmcdev->map->pm_read_disable_bit);
 }
 
+static void pmc_core_slps0_display(struct pmc_dev *pmcdev, struct device *dev,
+				   struct seq_file *s)
+{
+	const struct pmc_bit_map **maps = pmcdev->map->slps0_dbg_maps;
+	const struct pmc_bit_map *map;
+	int offset = pmcdev->map->slps0_dbg_offset;
+	u32 data;
+
+	while (*maps) {
+		map = *maps;
+		data = pmc_core_reg_read(pmcdev, offset);
+		offset += 4;
+		while (map->name) {
+			if (dev)
+				dev_dbg(dev, "SLP_S0_DBG: %-32s\tState: %s\n",
+					map->name,
+					data & map->bit_mask ? "Yes" : "No");
+			if (s)
+				seq_printf(s, "SLP_S0_DBG: %-32s\tState: %s\n",
+					   map->name,
+					   data & map->bit_mask ? "Yes" : "No");
+			++map;
+		}
+		++maps;
+	}
+}
+
+static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
+				 struct seq_file *s, u32 offset,
+				 const char *str,
+				 const struct pmc_bit_map **maps)
+{
+	int index, idx, len = 32, bit_mask, arr_size = 0;
+
+	for (index = 0; maps[index]; index++)
+		arr_size++;
+
+	u32 lpm_regs[arr_size];
+
+	for (index = 0; maps[index]; index++) {
+		lpm_regs[index] = pmc_core_reg_read(pmcdev, offset);
+		offset += 4;
+	}
+
+	for (idx = 0; maps[idx]; idx++) {
+		if (dev)
+			dev_dbg(dev, "\nLPM_%s_%d:\t0x%x\n", str, idx,
+				lpm_regs[idx]);
+		if (s)
+			seq_printf(s, "\nLPM_%s_%d:\t0x%x\n", str, idx,
+				   lpm_regs[idx]);
+		for (index = 0; maps[idx][index].name && index < len; index++) {
+			bit_mask = maps[idx][index].bit_mask;
+			if (dev)
+				dev_dbg(dev, "%-30s %-30d\n",
+					maps[idx][index].name,
+					lpm_regs[idx] & bit_mask ? 1 : 0);
+			if (s)
+				seq_printf(s, "%-30s %-30d\n",
+					   maps[idx][index].name,
+					   lpm_regs[idx] & bit_mask ? 1 : 0);
+		}
+	}
+}
+
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 static bool slps0_dbg_latch;
 
@@ -844,33 +909,6 @@ static void pmc_core_slps0_dbg_latch(struct pmc_dev *pmcdev, bool reset)
 	mutex_unlock(&pmcdev->lock);
 }
 
-static void pmc_core_slps0_display(struct pmc_dev *pmcdev, struct device *dev,
-				   struct seq_file *s)
-{
-	const struct pmc_bit_map **maps = pmcdev->map->slps0_dbg_maps;
-	const struct pmc_bit_map *map;
-	int offset = pmcdev->map->slps0_dbg_offset;
-	u32 data;
-
-	while (*maps) {
-		map = *maps;
-		data = pmc_core_reg_read(pmcdev, offset);
-		offset += 4;
-		while (map->name) {
-			if (dev)
-				dev_dbg(dev, "SLP_S0_DBG: %-32s\tState: %s\n",
-					map->name,
-					data & map->bit_mask ? "Yes" : "No");
-			if (s)
-				seq_printf(s, "SLP_S0_DBG: %-32s\tState: %s\n",
-					   map->name,
-					   data & map->bit_mask ? "Yes" : "No");
-			++map;
-		}
-		++maps;
-	}
-}
-
 static int pmc_core_slps0_dbg_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
@@ -974,44 +1012,6 @@ static int pmc_core_substate_res_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_res);
 
-static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
-				 struct seq_file *s, u32 offset,
-				 const char *str,
-				 const struct pmc_bit_map **maps)
-{
-	int index, idx, len = 32, bit_mask, arr_size = 0;
-
-	for (index = 0; maps[index]; index++)
-		arr_size++;
-
-	u32 lpm_regs[arr_size];
-
-	for (index = 0; maps[index]; index++) {
-		lpm_regs[index] = pmc_core_reg_read(pmcdev, offset);
-		offset += 4;
-	}
-
-	for (idx = 0; maps[idx]; idx++) {
-		if (dev)
-			dev_dbg(dev, "\nLPM_%s_%d:\t0x%x\n", str, idx,
-				lpm_regs[idx]);
-		if (s)
-			seq_printf(s, "\nLPM_%s_%d:\t0x%x\n", str, idx,
-				   lpm_regs[idx]);
-		for (index = 0; maps[idx][index].name && index < len; index++) {
-			bit_mask = maps[idx][index].bit_mask;
-			if (dev)
-				dev_dbg(dev, "%-30s %-30d\n",
-					maps[idx][index].name,
-					lpm_regs[idx] & bit_mask ? 1 : 0);
-			if (s)
-				seq_printf(s, "%-30s %-30d\n",
-					   maps[idx][index].name,
-					   lpm_regs[idx] & bit_mask ? 1 : 0);
-		}
-	}
-}
-
 static int pmc_core_substate_sts_regs_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
-- 
2.17.1
