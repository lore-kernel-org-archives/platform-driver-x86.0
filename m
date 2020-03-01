From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v3 5/5] platform/x86: intel_pmc_core: fix: Make pmc_core_lpm_display() generic for platforms that support sub-states
Date: Sun,  1 Mar 2020 12:44:26 -0800
Message-ID: <5e28f488a6cc8b7c1e08b536868844b586a1eaf1.1583093898.git.gayatri.kammela@intel.com>
References: <cover.1583093898.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1583093898.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1583093898.git.gayatri.kammela@intel.com>
References: <cover.1583093898.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Chen Zhou <chenzhou10@huawei.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David E . Box" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Currently pmc_core_lpm_display() uses array of struct pointers i.e.,
tgl_lpm_maps for Tiger Lake directly to iterate through and to get the
number of status/live status registers which is hardcoded and cannot
be re-used for future platforms that support sub-states. To maintain
readability, make pmc_core_lpm_display() generic, so that it can re-used
for future platforms.

Cc: Chen Zhou <chenzhou10@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David E. Box <david.e.box@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 04ac058b9871..cf3aaace21d5 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 #include <linux/suspend.h>
 #include <linux/uaccess.h>
 
@@ -640,15 +641,30 @@ static void pmc_core_slps0_display(struct pmc_dev *pmcdev, struct device *dev,
 	}
 }
 
+static int pmc_core_lpm_get_arr_size(const struct pmc_bit_map **maps)
+{
+	int idx, arr_size = 0;
+
+	for (idx = 0; maps[idx]; idx++)
+		arr_size++;
+
+	return arr_size;
+}
+
 static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
 				 struct seq_file *s, u32 offset,
 				 const char *str,
 				 const struct pmc_bit_map **maps)
 {
-	u32 lpm_regs[ARRAY_SIZE(tgl_lpm_maps)-1];
-	int index, idx, len = 32, bit_mask;
+	int arr_size = pmc_core_lpm_get_arr_size(maps);
+	int index, idx, bit_mask, len = 32;
+	u32 *lpm_regs;
+
+	lpm_regs = kmalloc_array(arr_size, sizeof(*lpm_regs), GFP_KERNEL);
+	if(!lpm_regs)
+		goto err;
 
-	for (index = 0; tgl_lpm_maps[index]; index++) {
+	for (index = 0; maps[index]; index++) {
 		lpm_regs[index] = pmc_core_reg_read(pmcdev, offset);
 		offset += 4;
 	}
@@ -672,6 +688,9 @@ static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
 					   lpm_regs[idx] & bit_mask ? 1 : 0);
 		}
 	}
+
+err:
+	kfree(lpm_regs);
 }
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
-- 
2.17.1
