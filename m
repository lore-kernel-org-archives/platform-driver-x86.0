From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v3 4/7] x86/intel_pmc_core: Make debugfs entry for pch_ip_power_gating_status conditional
Date: Thu, 14 Nov 2019 09:01:17 -0800
Message-ID: <6d7ff4ccb09cfef1a16c08222368442bca9eaece.1573750525.git.gayatri.kammela@intel.com>
References: <cover.1573750525.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1573750525.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1573750525.git.gayatri.kammela@intel.com>
References: <cover.1573750525.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: vishwanath.somayaji@intel.com, dvhart@infradead.org, linux-kernel@vger.kernel.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kan Liang <kan.liang@intel.com>, "David E . Box" <david.e.box@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Tony Luck <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Check if the platform supports and only then add a debugfs entry for PCH
IP power gating status.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kan Liang <kan.liang@intel.com>
Cc: David E. Box <david.e.box@intel.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Tony Luck <tony.luck@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index a945a0081ebe..fa91f3127460 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -788,8 +788,9 @@ static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 	debugfs_create_file("slp_s0_residency_usec", 0444, dir, pmcdev,
 			    &pmc_core_dev_state);
 
-	debugfs_create_file("pch_ip_power_gating_status", 0444, dir, pmcdev,
-			    &pmc_core_ppfear_fops);
+	if (pmcdev->map->pfear_sts)
+		debugfs_create_file("pch_ip_power_gating_status", 0444, dir,
+				    pmcdev, &pmc_core_ppfear_fops);
 
 	debugfs_create_file("ltr_ignore", 0644, dir, pmcdev,
 			    &pmc_core_ltr_ignore_ops);
-- 
2.17.1
