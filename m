From: Rajat Jain <rajatja@google.com>
Subject: [PATCH v3 1/3] platform/x86: intel_pmc_core: Convert to a platform_driver
Date: Fri,  5 Apr 2019 13:35:56 -0700
Message-ID: <20190405203558.19160-1-rajatja@google.com>
References: <20190313222124.229371-1-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190313222124.229371-1-rajatja@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Wysocki@google.com, Rafael J <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Rajat Jain <rajatja@google.com>, furquan@google.com, evgreen@google.com, rajatxjain@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Convert the intel_pmc_core driver to a platform driver, and attach using
the ACPI enumeration method (via the ACPI device "INT33A1").

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v3: Don't instantiate the platform_device. Use ACPI enumeration.
v2: Rephrase the commit log. No code changes.

 drivers/platform/x86/intel_pmc_core.c | 92 ++++++++++++++++++---------
 1 file changed, 63 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index f2c621b55f49..331889a57f73 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/uaccess.h>
 
 #include <asm/cpu_device_id.h>
@@ -806,18 +807,6 @@ static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 }
 #endif /* CONFIG_DEBUG_FS */
 
-static const struct x86_cpu_id intel_pmc_core_ids[] = {
-	INTEL_CPU_FAM6(SKYLAKE_MOBILE, spt_reg_map),
-	INTEL_CPU_FAM6(SKYLAKE_DESKTOP, spt_reg_map),
-	INTEL_CPU_FAM6(KABYLAKE_MOBILE, spt_reg_map),
-	INTEL_CPU_FAM6(KABYLAKE_DESKTOP, spt_reg_map),
-	INTEL_CPU_FAM6(CANNONLAKE_MOBILE, cnp_reg_map),
-	INTEL_CPU_FAM6(ICELAKE_MOBILE, icl_reg_map),
-	{}
-};
-
-MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_ids);
-
 static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, SPT_PMC_PCI_DEVICE_ID), 0},
 	{ 0, },
@@ -854,26 +843,50 @@ static const struct dmi_system_id pmc_core_dmi_table[]  = {
 	{}
 };
 
-static int __init pmc_core_probe(void)
+static int pmc_core_probe(struct platform_device *pdev)
 {
+	static bool device_initialized;
 	struct pmc_dev *pmcdev = &pmc;
-	const struct x86_cpu_id *cpu_id;
 	u64 slp_s0_addr;
 	int err;
 
-	cpu_id = x86_match_cpu(intel_pmc_core_ids);
-	if (!cpu_id)
+	if (device_initialized)
 		return -ENODEV;
 
-	pmcdev->map = (struct pmc_reg_map *)cpu_id->driver_data;
+	switch (boot_cpu_data.x86_model) {
+	case INTEL_FAM6_SKYLAKE_MOBILE:
+	case INTEL_FAM6_SKYLAKE_DESKTOP:
+	case INTEL_FAM6_KABYLAKE_MOBILE:
+	case INTEL_FAM6_KABYLAKE_DESKTOP:
 
-	/*
-	 * Coffeelake has CPU ID of Kabylake and Cannonlake PCH. So here
-	 * Sunrisepoint PCH regmap can't be used. Use Cannonlake PCH regmap
-	 * in this case.
-	 */
-	if (pmcdev->map == &spt_reg_map && !pci_dev_present(pmc_pci_ids))
+		pmcdev->map = &spt_reg_map;
+
+		/*
+		 * Special case: Coffeelake has CPU ID of Kabylake, but has
+		 * Cannonlake PCH. So need to use cnp_reg_map instead of
+		 * spt_reg_map for this special case. The PMC core PCI device
+		 * on Coffeelake is hidden, so use that as the deciding factor.
+		 */
+		if (!pci_dev_present(pmc_pci_ids))
+			pmcdev->map = &cnp_reg_map;
+
+		break;
+
+	case INTEL_FAM6_CANNONLAKE_MOBILE:
 		pmcdev->map = &cnp_reg_map;
+		break;
+
+	case INTEL_FAM6_ICELAKE_MOBILE:
+		pmcdev->map = &icl_reg_map;
+		break;
+	default:
+		/*
+		 * Which map should we use by default? If not specified
+		 * explicitly, assume Icelake by default for now.
+		 */
+		pmcdev->map = &icl_reg_map;
+		break;
+	}
 
 	if (lpit_read_residency_count_address(&slp_s0_addr))
 		pmcdev->base_addr = PMC_BASE_ADDR_DEFAULT;
@@ -890,26 +903,47 @@ static int __init pmc_core_probe(void)
 
 	err = pmc_core_dbgfs_register(pmcdev);
 	if (err < 0) {
-		pr_warn(" debugfs register failed.\n");
+		dev_warn(&pdev->dev, "debugfs register failed.\n");
 		iounmap(pmcdev->regbase);
 		return err;
 	}
 
 	dmi_check_system(pmc_core_dmi_table);
-	pr_info(" initialized\n");
+	platform_set_drvdata(pdev, pmcdev);
+
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
