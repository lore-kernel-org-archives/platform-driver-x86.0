From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH] platform/x86: intel_pmc_ipc: Use XTAL freq based on cpuid
Date: Fri, 17 Feb 2017 14:53:54 +0530
Message-ID: <1487323434-8553-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch uses crystal frequency based on the cpu model.

On Apollo Lake SoC we have 19.2 MHz clock frequency for counting S0ix
residency but this clock frequency might change on future platforms
depending on the crystal oscillator.

Signed-off-by: Shanth Murthy <shanth.murthy@intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
Note:
This patch depends on the following:
 * platform/x86: intel_pmc_ipc: read s0ix residency API
 * platform/x86: intel_pmc_ipc: Add APL PMC PCI Id

 drivers/platform/x86/intel_pmc_ipc.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 6b6bdf1..557f017 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -34,6 +34,7 @@
 #include <linux/acpi.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 
+#include <asm/intel-family.h>
 #include <asm/intel_pmc_ipc.h>
 
 #include <linux/platform_data/itco_wdt.h>
@@ -61,11 +62,11 @@
 #define GCR_TELEM_DEEP_S0IX_OFFSET	0x1078
 #define GCR_TELEM_SHLW_S0IX_OFFSET	0x1080
 
-/* Residency with clock rate at 19.2MHz to usecs */
-#define S0IX_RESIDENCY_IN_USECS(d, s)		\
+/* Convert S0ix residency to usecs based on XTAL frequency */
+#define S0IX_RESIDENCY_IN_USECS(d, s, x)		\
 ({						\
-	u64 result = 10ull * ((d) + (s));	\
-	do_div(result, 192);			\
+	u64 result = 1000ull * ((d) + (s));	\
+	do_div(result, x);			\
 	result;					\
 })
 
@@ -131,6 +132,7 @@
 	resource_size_t gcr_base;
 	int gcr_size;
 	bool has_gcr_regs;
+	u32 xtal_khz;
 
 	/* punit */
 	struct platform_device *punit_dev;
@@ -201,6 +203,18 @@ static inline u64 gcr_data_readq(u32 offset)
 	return readq(ipcdev.ipc_base + offset);
 }
 
+static int get_xtal_clock_freq(void)
+{
+	switch (boot_cpu_data.x86_model) {
+	case INTEL_FAM6_ATOM_GOLDMONT:
+		ipcdev.xtal_khz = 19200;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int intel_pmc_ipc_check_status(void)
 {
 	int status;
@@ -787,7 +801,7 @@ int intel_pmc_s0ix_counter_read(u64 *data)
 	deep = gcr_data_readq(GCR_TELEM_DEEP_S0IX_OFFSET);
 	shlw = gcr_data_readq(GCR_TELEM_SHLW_S0IX_OFFSET);
 
-	*data = S0IX_RESIDENCY_IN_USECS(deep, shlw);
+	*data = S0IX_RESIDENCY_IN_USECS(deep, shlw, ipcdev.xtal_khz);
 
 	return 0;
 }
@@ -835,6 +849,12 @@ static int ipc_plat_probe(struct platform_device *pdev)
 		goto err_irq;
 	}
 
+	ret = get_xtal_clock_freq();
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get XTAL freq\n");
+		goto err_sys;
+	}
+
 	ret = sysfs_create_group(&pdev->dev.kobj, &intel_ipc_group);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to create sysfs group %d\n",
-- 
1.9.1
