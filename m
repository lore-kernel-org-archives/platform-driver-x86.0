From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 7/8] platform: x86: intel_pmc: no need to check return value of debugfs_create functions
Date: Wed, 12 Jun 2019 14:12:57 +0200
Message-ID: <20190612121258.19535-7-gregkh@linuxfoundation.org>
References: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Vishwanath Somayaji <vishwanath.somayaji@intel.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/platform/x86/intel_pmc_core.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 1d902230ba61..27d6470e43ec 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -753,14 +753,11 @@ static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 	debugfs_remove_recursive(pmcdev->dbgfs_dir);
 }
 
-static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
+static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 {
 	struct dentry *dir;
 
 	dir = debugfs_create_dir("pmc_core", NULL);
-	if (!dir)
-		return -ENOMEM;
-
 	pmcdev->dbgfs_dir = dir;
 
 	debugfs_create_file("slp_s0_residency_usec", 0444, dir, pmcdev,
@@ -794,13 +791,10 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 		debugfs_create_bool("slp_s0_dbg_latch", 0644,
 				    dir, &slps0_dbg_latch);
 	}
-
-	return 0;
 }
 #else
-static inline int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
+static inline void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 {
-	return 0;
 }
 
 static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
@@ -862,7 +856,6 @@ static int pmc_core_probe(struct platform_device *pdev)
 	struct pmc_dev *pmcdev = &pmc;
 	const struct x86_cpu_id *cpu_id;
 	u64 slp_s0_addr;
-	int err;
 
 	if (device_initialized)
 		return -ENODEV;
@@ -896,12 +889,7 @@ static int pmc_core_probe(struct platform_device *pdev)
 	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
 	dmi_check_system(pmc_core_dmi_table);
 
-	err = pmc_core_dbgfs_register(pmcdev);
-	if (err < 0) {
-		dev_warn(&pdev->dev, "debugfs register failed.\n");
-		iounmap(pmcdev->regbase);
-		return err;
-	}
+	pmc_core_dbgfs_register(pmcdev);
 
 	device_initialized = true;
 	dev_info(&pdev->dev, " initialized\n");
-- 
2.22.0
