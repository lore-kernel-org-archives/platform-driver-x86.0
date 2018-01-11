From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 1/6] platform/x86: intel_pmc_core: Remove unused EXPORTED API
Date: Thu, 11 Jan 2018 16:40:31 +0530
Message-ID: <1515669036-3465-2-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Derek Basehore <dbasehore@chromium.org>, Rajat Jain <rajatja@google.com>
List-Id: platform-driver-x86.vger.kernel.org

Though ChromeOs uses the exported API as part of their S0ix failsafe
mechanism, there is no active consumer of this API in upstream kernel.

We can revisit this when ChromeOs kernel team is able to get their S0ix
failsafe framework in mainline.

Cc: Derek Basehore <dbasehore@chromium.org>
Cc: Rajat Jain <rajatja@google.com>
Link: https://patchwork.kernel.org/patch/9831229/

Suggested-by: Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 32 --------------------------------
 drivers/platform/x86/intel_pmc_core.h |  1 -
 2 files changed, 33 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 17e08b42b0a9..00748472a55e 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -146,37 +146,6 @@ static inline u32 pmc_core_adjust_slp_s0_step(u32 value)
 	return value * SPT_PMC_SLP_S0_RES_COUNTER_STEP;
 }
 
-/**
- * intel_pmc_slp_s0_counter_read() - Read SLP_S0 residency.
- * @data: Out param that contains current SLP_S0 count.
- *
- * This API currently supports Intel Skylake SoC and Sunrise
- * Point Platform Controller Hub. Future platform support
- * should be added for platforms that support low power modes
- * beyond Package C10 state.
- *
- * SLP_S0_RESIDENCY counter counts in 100 us granularity per
- * step hence function populates the multiplied value in out
- * parameter @data.
- *
- * Return: an error code or 0 on success.
- */
-int intel_pmc_slp_s0_counter_read(u32 *data)
-{
-	struct pmc_dev *pmcdev = &pmc;
-	const struct pmc_reg_map *map = pmcdev->map;
-	u32 value;
-
-	if (!pmcdev->has_slp_s0_res)
-		return -EACCES;
-
-	value = pmc_core_reg_read(pmcdev, map->slp_s0_offset);
-	*data = pmc_core_adjust_slp_s0_step(value);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(intel_pmc_slp_s0_counter_read);
-
 static int pmc_core_dev_state_get(void *data, u64 *val)
 {
 	struct pmc_dev *pmcdev = data;
@@ -548,7 +517,6 @@ static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (err < 0)
 		dev_warn(&dev->dev, "PMC Core: debugfs register failed.\n");
 
-	pmc.has_slp_s0_res = true;
 	return 0;
 }
 
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index 3d225a9cc09f..ecff50356c71 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -178,7 +178,6 @@ struct pmc_dev {
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 	struct dentry *dbgfs_dir;
 #endif /* CONFIG_DEBUG_FS */
-	bool has_slp_s0_res;
 	int pmc_xram_read_bit;
 	struct mutex lock; /* generic mutex lock for PMC Core */
 };
-- 
2.7.4
