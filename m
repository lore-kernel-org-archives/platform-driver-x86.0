From: Rajat Jain <rajatja@google.com>
Subject: [PATCH 1/2] platform/x86: intel_pmc_core: Convert to a platform_driver
Date: Wed, 13 Mar 2019 15:21:23 -0700
Message-ID: <20190313222124.229371-1-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rajat Jain <rajatja@google.com>, furquan@google.com, evgreen@google.com, rajatxjain@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Convert the intel_pmc_core driver to a platform driver. There is no
functional change. Some code that tries to determine what kind of
CPU this is, has been moved code is moved from pmc_core_probe() to
pmc_core_init().

Signed-off-by: Rajat Jain <rajatja@google.com>
---
This is rebased off
git://git.infradead.org/linux-platform-drivers-x86.git/for-next

 drivers/platform/x86/intel_pmc_core.c | 93 ++++++++++++++++++++-------
 1 file changed, 68 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index f2c621b55f49..55578d07610c 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/uaccess.h>
 
 #include <asm/cpu_device_id.h>
@@ -854,12 +855,59 @@ static const struct dmi_system_id pmc_core_dmi_table[]  = {
 	{}
 };
 
-static int __init pmc_core_probe(void)
+static int pmc_core_probe(struct platform_device *pdev)
 {
-	struct pmc_dev *pmcdev = &pmc;
+	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
+	int err;
+
+	pmcdev->regbase = ioremap(pmcdev->base_addr,
+				  pmcdev->map->regmap_length);
+	if (!pmcdev->regbase)
+		return -ENOMEM;
+
+	mutex_init(&pmcdev->lock);
+	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
+
+	err = pmc_core_dbgfs_register(pmcdev);
+	if (err < 0) {
+		dev_warn(&pdev->dev, "debugfs register failed.\n");
+		iounmap(pmcdev->regbase);
+		return err;
+	}
+
+	dmi_check_system(pmc_core_dmi_table);
+	dev_info(&pdev->dev, " initialized\n");
+	return 0;
+}
+
+static int pmc_core_remove(struct platform_device *pdev)
+{
+	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
+
+	pmc_core_dbgfs_unregister(pmcdev);
+	mutex_destroy(&pmcdev->lock);
+	iounmap(pmcdev->regbase);
+	return 0;
+}
+
+static struct platform_driver pmc_core_driver = {
+	.driver = {
+		.name = "pmc_core",
+	},
+	.probe = pmc_core_probe,
+	.remove = pmc_core_remove,
+};
+
+static struct platform_device pmc_core_device = {
+	.name           = "pmc_core",
+};
+
+static int __init pmc_core_init(void)
+{
+	int ret;
 	const struct x86_cpu_id *cpu_id;
+	struct pmc_dev *pmcdev = &pmc;
 	u64 slp_s0_addr;
-	int err;
 
 	cpu_id = x86_match_cpu(intel_pmc_core_ids);
 	if (!cpu_id)
@@ -880,36 +928,31 @@ static int __init pmc_core_probe(void)
 	else
 		pmcdev->base_addr = slp_s0_addr - pmcdev->map->slp_s0_offset;
 
-	pmcdev->regbase = ioremap(pmcdev->base_addr,
-				  pmcdev->map->regmap_length);
-	if (!pmcdev->regbase)
-		return -ENOMEM;
+	platform_set_drvdata(&pmc_core_device, pmcdev);
 
-	mutex_init(&pmcdev->lock);
-	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
+	ret = platform_device_register(&pmc_core_device);
+	if (ret)
+		return ret;
 
-	err = pmc_core_dbgfs_register(pmcdev);
-	if (err < 0) {
-		pr_warn(" debugfs register failed.\n");
-		iounmap(pmcdev->regbase);
-		return err;
-	}
+	ret = platform_driver_register(&pmc_core_driver);
+	if (ret)
+		goto out_remove_dev;
 
-	dmi_check_system(pmc_core_dmi_table);
-	pr_info(" initialized\n");
 	return 0;
+
+out_remove_dev:
+	platform_device_unregister(&pmc_core_device);
+	return ret;
 }
-module_init(pmc_core_probe)
 
-static void __exit pmc_core_remove(void)
+static void __init pmc_core_exit(void)
 {
-	struct pmc_dev *pmcdev = &pmc;
-
-	pmc_core_dbgfs_unregister(pmcdev);
-	mutex_destroy(&pmcdev->lock);
-	iounmap(pmcdev->regbase);
+	platform_driver_unregister(&pmc_core_driver);
+	platform_device_unregister(&pmc_core_device);
 }
-module_exit(pmc_core_remove)
+
+module_init(pmc_core_init);
+module_exit(pmc_core_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel PMC Core Driver");
-- 
2.21.0.360.g471c308f928-goog
