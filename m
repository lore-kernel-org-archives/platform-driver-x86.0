From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [Patch v1 1/8] platform/x86: intel_pmc_core: Refactor debugfs entries
Date: Fri, 19 Jan 2018 14:28:20 +0530
Message-ID: <1516352307-20123-2-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1516352307-20123-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:52689 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755464AbeASJDw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jan 2018 04:03:52 -0500
In-Reply-To: <1516352307-20123-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

When on a platform if we can't show MPHY and PLL status, don't even bother
to create a debugfs entry as it will fail anyway. In fact unless OEM builds
a special BIOS for test, it will fail on every production system.

This will help to add future platform support where we can't support these
entries.

Suggested-by: Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 44 +++++++++++++----------------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index cf8b3b34a979..43cee8877ee3 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -407,43 +407,31 @@ static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 
 static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 {
-	struct dentry *dir, *file;
 
-	dir = debugfs_create_dir("pmc_core", NULL);
-	if (!dir)
-		return -ENOMEM;
+	pmcdev->dbgfs_dir = debugfs_create_dir("pmc_core", NULL);
 
-	pmcdev->dbgfs_dir = dir;
-	file = debugfs_create_file("slp_s0_residency_usec", 0444,
-				   dir, pmcdev, &pmc_core_dev_state);
-	if (!file)
-		goto err;
+	if (!pmcdev->dbgfs_dir)
+		return -ENOMEM;
 
-	file = debugfs_create_file("pch_ip_power_gating_status", 0444,
-				   dir, pmcdev, &pmc_core_ppfear_ops);
-	if (!file)
-		goto err;
+	debugfs_create_file("slp_s0_residency_usec", 0444, pmcdev->dbgfs_dir,
+			    pmcdev, &pmc_core_dev_state);
 
-	file = debugfs_create_file("mphy_core_lanes_power_gating_status", 0444,
-				   dir, pmcdev, &pmc_core_mphy_pg_ops);
-	if (!file)
-		goto err;
+	debugfs_create_file("pch_ip_power_gating_status", 0444,
+			    pmcdev->dbgfs_dir, pmcdev, &pmc_core_ppfear_ops);
 
-	file = debugfs_create_file("pll_status", 0444, dir, pmcdev,
-				   &pmc_core_pll_ops);
-	if (!file)
-		goto err;
+	debugfs_create_file("ltr_ignore", 0644, pmcdev->dbgfs_dir, pmcdev,
+			    &pmc_core_ltr_ignore_ops);
 
-	file = debugfs_create_file("ltr_ignore", 0644, dir, pmcdev,
-				   &pmc_core_ltr_ignore_ops);
+	if (pmcdev->map->pll_sts)
+		debugfs_create_file("pll_status", 0444, pmcdev->dbgfs_dir,
+				    pmcdev, &pmc_core_pll_ops);
 
-	if (!file)
-		goto err;
+	if (pmcdev->map->mphy_sts)
+		debugfs_create_file("mphy_core_lanes_power_gating_status",
+				    0444, pmcdev->dbgfs_dir, pmcdev,
+				    &pmc_core_mphy_pg_ops);
 
 	return 0;
-err:
-	pmc_core_dbgfs_unregister(pmcdev);
-	return -ENODEV;
 }
 #else
 static inline int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
-- 
2.7.4
