From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 5/6] platform/x86: intel_pmc_core: Fix file permission warnings
Date: Thu, 11 Jan 2018 16:40:35 +0530
Message-ID: <1515669036-3465-6-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Symbolic permissions 'S_IRUGO' are not preferred. This patch changes the
debugfs files to use octal permissions '0644' or '0444' as needed by the
attribute.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 44353034718a..cf8b3b34a979 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -414,31 +414,27 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 		return -ENOMEM;
 
 	pmcdev->dbgfs_dir = dir;
-	file = debugfs_create_file("slp_s0_residency_usec", S_IFREG | S_IRUGO,
+	file = debugfs_create_file("slp_s0_residency_usec", 0444,
 				   dir, pmcdev, &pmc_core_dev_state);
 	if (!file)
 		goto err;
 
-	file = debugfs_create_file("pch_ip_power_gating_status",
-				   S_IFREG | S_IRUGO, dir, pmcdev,
-				   &pmc_core_ppfear_ops);
+	file = debugfs_create_file("pch_ip_power_gating_status", 0444,
+				   dir, pmcdev, &pmc_core_ppfear_ops);
 	if (!file)
 		goto err;
 
-	file = debugfs_create_file("mphy_core_lanes_power_gating_status",
-				   S_IFREG | S_IRUGO, dir, pmcdev,
-				   &pmc_core_mphy_pg_ops);
+	file = debugfs_create_file("mphy_core_lanes_power_gating_status", 0444,
+				   dir, pmcdev, &pmc_core_mphy_pg_ops);
 	if (!file)
 		goto err;
 
-	file = debugfs_create_file("pll_status",
-				   S_IFREG | S_IRUGO, dir, pmcdev,
+	file = debugfs_create_file("pll_status", 0444, dir, pmcdev,
 				   &pmc_core_pll_ops);
 	if (!file)
 		goto err;
 
-	file = debugfs_create_file("ltr_ignore",
-				   S_IFREG | S_IRUGO, dir, pmcdev,
+	file = debugfs_create_file("ltr_ignore", 0644, dir, pmcdev,
 				   &pmc_core_ltr_ignore_ops);
 
 	if (!file)
-- 
2.7.4
