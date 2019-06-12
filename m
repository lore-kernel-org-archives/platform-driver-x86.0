From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 6/8] platform: x86: pmc_atom: no need to check return value of debugfs_create functions
Date: Wed, 12 Jun 2019 14:12:56 +0200
Message-ID: <20190612121258.19535-6-gregkh@linuxfoundation.org>
References: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/platform/x86/pmc_atom.c | 43 ++++++++-------------------------
 1 file changed, 10 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index b1d804376237..2104e1ad38d9 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -350,45 +350,24 @@ static int pmc_sleep_tmr_show(struct seq_file *s, void *unused)
 
 DEFINE_SHOW_ATTRIBUTE(pmc_sleep_tmr);
 
-static void pmc_dbgfs_unregister(struct pmc_dev *pmc)
+static void pmc_dbgfs_register(struct pmc_dev *pmc)
 {
-	debugfs_remove_recursive(pmc->dbgfs_dir);
-}
-
-static int pmc_dbgfs_register(struct pmc_dev *pmc)
-{
-	struct dentry *dir, *f;
+	struct dentry *dir;
 
 	dir = debugfs_create_dir("pmc_atom", NULL);
-	if (!dir)
-		return -ENOMEM;
 
 	pmc->dbgfs_dir = dir;
 
-	f = debugfs_create_file("dev_state", S_IFREG | S_IRUGO,
-				dir, pmc, &pmc_dev_state_fops);
-	if (!f)
-		goto err;
-
-	f = debugfs_create_file("pss_state", S_IFREG | S_IRUGO,
-				dir, pmc, &pmc_pss_state_fops);
-	if (!f)
-		goto err;
-
-	f = debugfs_create_file("sleep_state", S_IFREG | S_IRUGO,
-				dir, pmc, &pmc_sleep_tmr_fops);
-	if (!f)
-		goto err;
-
-	return 0;
-err:
-	pmc_dbgfs_unregister(pmc);
-	return -ENODEV;
+	debugfs_create_file("dev_state", S_IFREG | S_IRUGO, dir, pmc,
+			    &pmc_dev_state_fops);
+	debugfs_create_file("pss_state", S_IFREG | S_IRUGO, dir, pmc,
+			    &pmc_pss_state_fops);
+	debugfs_create_file("sleep_state", S_IFREG | S_IRUGO, dir, pmc,
+			    &pmc_sleep_tmr_fops);
 }
 #else
-static int pmc_dbgfs_register(struct pmc_dev *pmc)
+static void pmc_dbgfs_register(struct pmc_dev *pmc)
 {
-	return 0;
 }
 #endif /* CONFIG_DEBUG_FS */
 
@@ -500,9 +479,7 @@ static int pmc_setup_dev(struct pci_dev *pdev, const struct pci_device_id *ent)
 	/* PMC hardware registers setup */
 	pmc_hw_reg_setup(pmc);
 
-	ret = pmc_dbgfs_register(pmc);
-	if (ret)
-		dev_warn(&pdev->dev, "debugfs register failed\n");
+	pmc_dbgfs_register(pmc);
 
 	/* Register platform clocks - PMC_PLT_CLK [0..5] */
 	ret = pmc_setup_clks(pdev, pmc->regmap, data);
-- 
2.22.0
