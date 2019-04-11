From: Rajat Jain <rajatja@google.com>
Subject: [PATCH v5 1/3] platform/x86: intel_pmc_core: Convert to a platform_driver
Date: Wed, 10 Apr 2019 17:37:36 -0700
Message-ID: <20190411003738.55073-1-rajatja@google.com>
References: <20190313222124.229371-1-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190313222124.229371-1-rajatja@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Rafael J Wysocki <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Rajat Jain <rajatja@google.com>, furquan@google.com, evgreen@google.com, rajatxjain@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Convert the intel_pmc_core driver to a platform driver, and attach using
the ACPI enumeration method (via the ACPI device "INT33A1").

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v5: Remove the gerrit ID from commit log
v4: put back the x86_match_cpu() method.
v3: Don't instantiate the platform_device. Use ACPI enumeration.
v2: Rephrase the commit log. No code changes.

 drivers/platform/x86/intel_pmc_core.c | 42 ++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 9908d233305e..8da886e17681 100644
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
@@ -888,28 +893,49 @@ static int __init pmc_core_probe(void)
 	mutex_init(&pmcdev->lock);
 	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
 
+	dmi_check_system(pmc_core_dmi_table);
+	platform_set_drvdata(pdev, pmcdev);
+
 	err = pmc_core_dbgfs_register(pmcdev);
 	if (err < 0) {
-		pr_warn(" debugfs register failed.\n");
+		dev_warn(&pdev->dev, "debugfs register failed.\n");
 		iounmap(pmcdev->regbase);
 		return err;
 	}
 
-	dmi_check_system(pmc_core_dmi_table);
-	pr_info(" initialized\n");
+	dev_info(&pdev->dev, " initialized\n");
+	device_initialized = true;
+
 	return 0;
 }
-module_init(pmc_core_probe)
 
-static void __exit pmc_core_remove(void)
+static int pmc_core_remove(struct platform_device *pdev)
 {
-	struct pmc_dev *pmcdev = &pmc;
+	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
 
+	platform_set_drvdata(pdev, NULL);
 	pmc_core_dbgfs_unregister(pmcdev);
 	mutex_destroy(&pmcdev->lock);
 	iounmap(pmcdev->regbase);
+	return 0;
 }
-module_exit(pmc_core_remove)
+
+static const struct acpi_device_id pmc_core_acpi_ids[] = {
+	{"INT33A1", 0}, /* _HID for Intel Power Engine, _CID PNP0D80*/
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, pmc_core_acpi_ids);
+
+static struct platform_driver pmc_core_driver = {
+	.driver = {
+		.name = "pmc_core",
+		.acpi_match_table = ACPI_PTR(pmc_core_acpi_ids),
+	},
+	.probe = pmc_core_probe,
+	.remove = pmc_core_remove,
+};
+
+module_platform_driver(pmc_core_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel PMC Core Driver");
-- 
2.21.0.392.gf8f6787159e-goog
