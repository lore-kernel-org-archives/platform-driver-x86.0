From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v1 1/4] platform/x86: intel_pmc_core: fix: Make pmc_core_lpm_display() generic for platforms that support sub-states
Date: Wed, 26 Feb 2020 18:43:27 -0800
Message-ID: <4ed31a98bbb65717f5182f6d512dd4df80c78272.1582770011.git.gayatri.kammela@intel.com>
References: <cover.1582770011.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1582770011.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1582770011.git.gayatri.kammela@intel.com>
References: <cover.1582770011.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Chen Zhou <chenzhou10@huawei.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David E . Box" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Currently pmc_core_lpm_display() uses array of struct pointers i.e.,
tgl_lpm_maps for Tiger Lake directly to iterate through and to get the
number of status/live status registers which is hardcoded and will not
work for future platforms that support sub-states. To maintain
readability, make pmc_core_lpm_display() generic, so that it can re-used
for future platforms.

Cc: Chen Zhou <chenzhou10@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David E. Box <david.e.box@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index f4a36fbabf4c..333c6963d270 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -979,10 +979,14 @@ static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
 				 const char *str,
 				 const struct pmc_bit_map **maps)
 {
-	u32 lpm_regs[ARRAY_SIZE(tgl_lpm_maps)-1];
-	int index, idx, len = 32, bit_mask;
+	int index, idx, len = 32, bit_mask, arr_size = 0;
 
-	for (index = 0; tgl_lpm_maps[index]; index++) {
+	for (index = 0; maps[index]; index++)
+		arr_size++;
+
+	u32 lpm_regs[arr_size];
+
+	for (index = 0; maps[index]; index++) {
 		lpm_regs[index] = pmc_core_reg_read(pmcdev, offset);
 		offset += 4;
 	}
-- 
2.17.1
