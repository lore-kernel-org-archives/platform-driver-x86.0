From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v2 3/4] platform/x86: intel_pmc_core: fix: Remove the duplicate if() to create debugfs entry for substate_live_status_registers
Date: Thu, 27 Feb 2020 15:29:15 -0800
Message-ID: <e0c594f0a09dc2458f038b90bb0c436ff29ab4bb.1582845395.git.gayatri.kammela@intel.com>
References: <cover.1582845395.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1582845395.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1582845395.git.gayatri.kammela@intel.com>
References: <cover.1582845395.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Chen Zhou <chenzhou10@huawei.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David E . Box" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

A debugfs entry for substate_live_status_registers is created only if
the platform has sub-states, which requires the same condition to create
substate_status_registers debugfs entry. Hence remove the redundant
condition and re-use the exisiting one.

Cc: Chen Zhou <chenzhou10@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David E. Box <david.e.box@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 3f000b6c8d8e..f6cc80987257 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -1121,9 +1121,6 @@ static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 		debugfs_create_file("substate_status_registers", 0444,
 				    pmcdev->dbgfs_dir, pmcdev,
 				    &pmc_core_substate_sts_regs_fops);
-	}
-
-	if (pmcdev->map->lpm_status_offset) {
 		debugfs_create_file("substate_live_status_registers", 0444,
 				    pmcdev->dbgfs_dir, pmcdev,
 				    &pmc_core_substate_l_sts_regs_fops);
-- 
2.17.1
