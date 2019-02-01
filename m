From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [PATCH 04/10] platform/x86: intel_pmc_core: Fix file permissions for ltr_show
Date: Fri,  1 Feb 2019 13:02:28 +0530
Message-ID: <20190201073234.13280-5-rajneesh.bhardwaj@linux.intel.com>
References: <20190201073234.13280-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201073234.13280-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E. Box" <david.e.box@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

File permissions for ltr_show attribute should be similar to other
debugfs attributes created by this driver. '0644' should be used only
when there is a write operation desired such as for ltr_ignore.

Cc: "David E. Box" <david.e.box@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Fixes: 63cde0c16c67 ("platform/x86: intel_pmc_core: Show Latency Tolerance info")
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 80936e6bdc61..125461ca2927 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -702,7 +702,7 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 	debugfs_create_file("ltr_ignore", 0644, dir, pmcdev,
 			    &pmc_core_ltr_ignore_ops);
 
-	debugfs_create_file("ltr_show", 0644, dir, pmcdev, &pmc_core_ltr_fops);
+	debugfs_create_file("ltr_show", 0444, dir, pmcdev, &pmc_core_ltr_fops);
 
 	if (pmcdev->map->pll_sts)
 		debugfs_create_file("pll_status", 0444, dir, pmcdev,
-- 
2.17.1
