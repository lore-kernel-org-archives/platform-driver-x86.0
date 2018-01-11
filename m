From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 3/6] platform/x86: intel_pmc_core: Fix kernel doc for pmc_dev
Date: Thu, 11 Jan 2018 16:40:33 +0530
Message-ID: <1515669036-3465-4-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Fix invalid field information and add missing fields in kernel doc comments.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index c6169fe0edf2..e3be1d2b08cd 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -160,12 +160,14 @@ struct pmc_reg_map {
 
 /**
  * struct pmc_dev - pmc device structure
- * @base_addr:		comtains pmc base address
+ * @base_addr:		contains pmc base address
  * @regbase:		pointer to io-remapped memory location
- * @dbgfs_dir:		path to debug fs interface
- * @feature_available:	flag to indicate whether
- *			the feature is available
- *			on a particular platform or not.
+ * @map:		pointer to pmc_reg_map struct that contains platform
+ *			specific attributes
+ * @dbgfs_dir:		path to debugfs interface
+ * @pmc_xram_read_bit:	flag to indicate whether PMC XRAM shadow registers
+ *			used to read MPHY PG and PLL status are available
+ * @mutex_lock:		mutex to complete one transcation
  *
  * pmc_dev contains info about power management controller device.
  */
-- 
2.7.4
