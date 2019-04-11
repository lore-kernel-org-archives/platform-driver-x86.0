From: Rajat Jain <rajatja@google.com>
Subject: [PATCH v4 2/3] platform/x86: intel_pmc_core: Allow to dump debug
 registers on S0ix failure
Date: Wed, 10 Apr 2019 17:31:06 -0700
Message-ID: <20190411003107.52044-2-rajatja@google.com>
References: <20190313222124.229371-1-rajatja@google.com> <20190411003107.52044-1-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411003107.52044-1-rajatja@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Rafael J <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Rajat Jain <rajatja@google.com>, furquan@google.com, evgreen@google.com, rajatxjain@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Add a module parameter which when enabled, will check on resume, if the
last S0ix attempt was successful. If not, the driver would warn and provide
helpful debug information (which gets latched during the failed suspend
attempt) to debug the S0ix failure.

This information is very useful to debug S0ix failures. Specially since
the latched debug information will be lost (over-written) if the system
attempts to go into runtime (or imminent) S0ix again after that failed
suspend attempt.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v4: Use 1 condition per if statement, rename some functions.
v3: No changes
v2: Use pm_suspend_via_firmware() to enable the check only for S0ix

 drivers/platform/x86/intel_pmc_core.c | 93 +++++++++++++++++++++++++++
 drivers/platform/x86/intel_pmc_core.h |  7 ++
 2 files changed, 100 insertions(+)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 8da886e17681..b1f099de5cb3 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/suspend.h>
 #include <linux/uaccess.h>
 
 #include <asm/cpu_device_id.h>
@@ -920,6 +921,97 @@ static int pmc_core_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+
+static bool warn_on_s0ix_failures;
+module_param(warn_on_s0ix_failures, bool, 0644);
+MODULE_PARM_DESC(warn_on_s0ix_failures, "Check and warn for S0ix failures");
+
+static int pmc_core_suspend(struct device *dev)
+{
+	struct pmc_dev *pmcdev = dev_get_drvdata(dev);
+
+	pmcdev->check_counters = false;
+
+	/* No warnings on S0ix failures */
+	if (!warn_on_s0ix_failures)
+		return 0;
+
+	/* Check if the syspend will actually use S0ix */
+	if (pm_suspend_via_firmware())
+		return 0;
+
+	/* Save PC10 and S0ix residency for checking later */
+	if (!rdmsrl_safe(MSR_PKG_C10_RESIDENCY, &pmcdev->pc10_counter) &&
+	    !pmc_core_dev_state_get(pmcdev, &pmcdev->s0ix_counter))
+		pmcdev->check_counters = true;
+
+	return 0;
+}
+
+static inline bool pmc_core_is_pc10_failed(struct pmc_dev *pmcdev)
+{
+	u64 pc10_counter;
+
+	if (!rdmsrl_safe(MSR_PKG_C10_RESIDENCY, &pc10_counter) &&
+	    pc10_counter == pmcdev->pc10_counter)
+		return true;
+
+	return false;
+}
+
+static inline bool pmc_core_is_s0ix_failed(struct pmc_dev *pmcdev)
+{
+	u64 s0ix_counter;
+
+	if (!pmc_core_dev_state_get(pmcdev, &s0ix_counter) &&
+	    s0ix_counter == pmcdev->s0ix_counter)
+		return true;
+
+	return false;
+}
+
+static int pmc_core_resume(struct device *dev)
+{
+	struct pmc_dev *pmcdev = dev_get_drvdata(dev);
+
+	if (!pmcdev->check_counters)
+		return 0;
+
+	if (pmc_core_is_pc10_failed(pmcdev)) {
+		dev_info(dev, "PC10 entry had failed (PC10 cnt=0x%llx)\n",
+			 pmcdev->pc10_counter);
+	} else if (pmc_core_is_s0ix_failed(pmcdev)) {
+
+		const struct pmc_bit_map **maps = pmcdev->map->slps0_dbg_maps;
+		const struct pmc_bit_map *map;
+		int offset = pmcdev->map->slps0_dbg_offset;
+		u32 data;
+
+		dev_warn(dev, "S0ix entry had failed (S0ix cnt=%llu)\n",
+			 pmcdev->s0ix_counter);
+		while (*maps) {
+			map = *maps;
+			data = pmc_core_reg_read(pmcdev, offset);
+			offset += 4;
+			while (map->name) {
+				dev_warn(dev, "SLP_S0_DBG: %-32s\tState: %s\n",
+					 map->name,
+					 data & map->bit_mask ? "Yes" : "No");
+				++map;
+			}
+			++maps;
+		}
+	}
+	return 0;
+}
+
+#endif
+
+static const struct dev_pm_ops pmc_core_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pmc_core_suspend, pmc_core_resume)
+};
+
 static const struct acpi_device_id pmc_core_acpi_ids[] = {
 	{"INT33A1", 0}, /* _HID for Intel Power Engine, _CID PNP0D80*/
 	{ }
@@ -930,6 +1022,7 @@ static struct platform_driver pmc_core_driver = {
 	.driver = {
 		.name = "pmc_core",
 		.acpi_match_table = ACPI_PTR(pmc_core_acpi_ids),
+		.pm = &pmc_core_pm_ops,
 	},
 	.probe = pmc_core_probe,
 	.remove = pmc_core_remove,
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index 88d9c0653a5f..fdee5772e532 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -241,6 +241,9 @@ struct pmc_reg_map {
  * @pmc_xram_read_bit:	flag to indicate whether PMC XRAM shadow registers
  *			used to read MPHY PG and PLL status are available
  * @mutex_lock:		mutex to complete one transcation
+ * @check_counters:	On resume, check if counters are getting incremented
+ * @pc10_counter:	PC10 residency counter
+ * @s0ix_counter:	S0ix residency (step adjusted)
  *
  * pmc_dev contains info about power management controller device.
  */
@@ -253,6 +256,10 @@ struct pmc_dev {
 #endif /* CONFIG_DEBUG_FS */
 	int pmc_xram_read_bit;
 	struct mutex lock; /* generic mutex lock for PMC Core */
+
+	bool check_counters; /* Check for counter increments on resume */
+	u64 pc10_counter;
+	u64 s0ix_counter;
 };
 
 #endif /* PMC_CORE_H */
-- 
2.21.0.392.gf8f6787159e-goog
