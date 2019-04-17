From: Rajat Jain <rajatja@google.com>
Subject: [PATCH v6 1/3] platform/x86: intel_pmc_core: Convert to a platform_driver
Date: Wed, 17 Apr 2019 16:01:53 -0700
Message-ID: <20190417230155.5282-1-rajatja@google.com>
References: <20190313222124.229371-1-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190313222124.229371-1-rajatja@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Rafael J Wysocki <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Rajat Jain <rajatja@google.com>, furquan@google.com, evgreen@google.com, rajatxjain@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Convert the intel_pmc_core driver to a platform driver. There is no
functional change to the driver, or to the way the devices are
instantiated.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v6: Let the way devices are instantiated exactly the same as before this
    patch (so no functional change other than converting to a platform
    device). Use "intel_pmc_core" platform device (no ACPI
    instantiation)
v5: Remove the gerrit ID from commit log
v4: put back the x86_match_cpu() method.
v3: Don't instantiate the platform_device. Use ACPI enumeration.
v2: Rephrase the commit log. No code changes.

 drivers/platform/x86/intel_pmc_core.c | 65 +++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 9908d233305e..153e79cc4d5b 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/uaccess.h>
 
 #include <asm/cpu_device_id.h>
@@ -854,13 +855,17 @@ static const struct dmi_system_id pmc_core_dmi_table[]  = {
 	{}
 };
 
-static int __init pmc_core_probe(void)
+static int pmc_core_probe(struct platform_device *pdev)
 {
+	static bool device_initialized;
 	struct pmc_dev *pmcdev = &pmc;
 	const struct x86_cpu_id *cpu_id;
 	u64 slp_s0_addr;
 	int err;
 
+	if (device_initialized)
+		return -ENODEV;
+
 	cpu_id = x86_match_cpu(intel_pmc_core_ids);
 	if (!cpu_id)
 		return -ENODEV;
@@ -886,30 +891,74 @@ static int __init pmc_core_probe(void)
 		return -ENOMEM;
 
 	mutex_init(&pmcdev->lock);
+	platform_set_drvdata(pdev, pmcdev);
 	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
+	dmi_check_system(pmc_core_dmi_table);
 
 	err = pmc_core_dbgfs_register(pmcdev);
 	if (err < 0) {
-		pr_warn(" debugfs register failed.\n");
+		dev_warn(&pdev->dev, "debugfs register failed.\n");
 		iounmap(pmcdev->regbase);
 		return err;
 	}
 
-	dmi_check_system(pmc_core_dmi_table);
-	pr_info(" initialized\n");
+	device_initialized = true;
+	dev_info(&pdev->dev, " initialized\n");
+
 	return 0;
 }
-module_init(pmc_core_probe)
 
-static void __exit pmc_core_remove(void)
+static int pmc_core_remove(struct platform_device *pdev)
 {
-	struct pmc_dev *pmcdev = &pmc;
+	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
 
 	pmc_core_dbgfs_unregister(pmcdev);
+	platform_set_drvdata(pdev, NULL);
 	mutex_destroy(&pmcdev->lock);
 	iounmap(pmcdev->regbase);
+	return 0;
+}
+
+static struct platform_driver pmc_core_driver = {
+	.driver = {
+		.name = "intel_pmc_core",
+	},
+	.probe = pmc_core_probe,
+	.remove = pmc_core_remove,
+};
+
+static struct platform_device pmc_core_device = {
+	.name = "intel_pmc_core",
+};
+
+static int __init pmc_core_init(void)
+{
+	int ret;
+
+	if (!x86_match_cpu(intel_pmc_core_ids))
+		return -ENODEV;
+
+	ret = platform_driver_register(&pmc_core_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_device_register(&pmc_core_device);
+	if (ret) {
+		platform_driver_unregister(&pmc_core_driver);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit pmc_core_exit(void)
+{
+	platform_device_unregister(&pmc_core_device);
+	platform_driver_unregister(&pmc_core_driver);
 }
-module_exit(pmc_core_remove)
+
+module_init(pmc_core_init)
+module_exit(pmc_core_exit)
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel PMC Core Driver");
-- 
2.21.0.392.gf8f6787159e-goog
