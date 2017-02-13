From: Shanth Murthy <shanth.murthy@intel.com>
Subject: [PATCH v2] platform/x86: intel_pmc_ipc: read s0ix residency API
Date: Mon, 13 Feb 2017 04:02:52 -0800
Message-ID: <1486987372-2342-1-git-send-email-shanth.murthy@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:34211 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752088AbdBMMC4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2017 07:02:56 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, qipeng.zha@intel.com, rajneesh.bhardwaj@intel.com, linux-kernel@vger.kernel.org, Shanth Murthy <shanth.murthy@intel.com>

This patch adds a new API to indicate S0ix residency in usec. It utilizes
the PMC Global Control Registers (GCR) to read deep and shallow
S0ix residency.

PMC MMIO resources:
        o Lower 4kB: IPC1 (PMC inter-processor communication) interface
        o Upper 4kB: GCR (Global Control Registers)

This enables the power management framework to take corrective actions when
the platform fails to enter S0ix after kernel freeze as part of the suspend
to idle flow. (echo freeze > /sys/power/state).

This is expected to be used with a S0ix failsafe framework such as:
<https://lwn.net/Articles/689505/>

[rajneesh: folded in "fix division in 32-bit case" from Andy Shevchenko]
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
[andy: fixed kbuild error, removed "total" from variables, fixed macro]
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Shanth Murthy <shanth.murthy@intel.com>
---
Changes in v2:
 * Added protection for exported function intel_pmc_s0ix_counter_read().
 * Made intel_pmc_s0ix_counter_read() function "inline" in "intel_pmc_ipc.h".
 * Includes fixes from Andy Shevchenko for kbuild error, variables renaming,
   macro fix, and 32bit build error

 arch/x86/include/asm/intel_pmc_ipc.h |  6 ++++
 drivers/platform/x86/intel_pmc_ipc.c | 64 ++++++++++++++++++++++++++++++++----
 2 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/intel_pmc_ipc.h b/arch/x86/include/asm/intel_pmc_ipc.h
index cd0310e..4291b6a 100644
--- a/arch/x86/include/asm/intel_pmc_ipc.h
+++ b/arch/x86/include/asm/intel_pmc_ipc.h
@@ -30,6 +30,7 @@ int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen,
 		u32 *out, u32 outlen, u32 dptr, u32 sptr);
 int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
 		u32 *out, u32 outlen);
+int intel_pmc_s0ix_counter_read(u64 *data);
 
 #else
 
@@ -50,6 +51,11 @@ static inline int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
 	return -EINVAL;
 }
 
+static inline int intel_pmc_s0ix_counter_read(u64 *data)
+{
+	return -EINVAL;
+}
+
 #endif /*CONFIG_INTEL_PMC_IPC*/
 
 #endif
diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 0bf51d5..de64678 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -32,7 +32,10 @@
 #include <linux/notifier.h>
 #include <linux/suspend.h>
 #include <linux/acpi.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+
 #include <asm/intel_pmc_ipc.h>
+
 #include <linux/platform_data/itco_wdt.h>
 
 /*
@@ -54,6 +57,18 @@
 #define IPC_WRITE_BUFFER	0x80
 #define IPC_READ_BUFFER		0x90
 
+/* PMC Global Control Registers */
+#define GCR_TELEM_DEEP_S0IX_OFFSET	0x1078
+#define GCR_TELEM_SHLW_S0IX_OFFSET	0x1080
+
+/* Residency with clock rate at 19.2MHz to usecs */
+#define S0IX_RESIDENCY_IN_USECS(d, s)		\
+({						\
+	u64 result = 10ull * ((d) + (s));	\
+	do_div(result, 192);			\
+	result;					\
+})
+
 /*
  * 16-byte buffer for sending data associated with IPC command.
  */
@@ -68,7 +83,7 @@
 #define PLAT_RESOURCE_IPC_INDEX		0
 #define PLAT_RESOURCE_IPC_SIZE		0x1000
 #define PLAT_RESOURCE_GCR_OFFSET	0x1008
-#define PLAT_RESOURCE_GCR_SIZE		0x4
+#define PLAT_RESOURCE_GCR_SIZE		0x1000
 #define PLAT_RESOURCE_BIOS_DATA_INDEX	1
 #define PLAT_RESOURCE_BIOS_IFACE_INDEX	2
 #define PLAT_RESOURCE_TELEM_SSRAM_INDEX	3
@@ -115,6 +130,7 @@
 	/* gcr */
 	resource_size_t gcr_base;
 	int gcr_size;
+	bool has_gcr_regs;
 
 	/* punit */
 	struct platform_device *punit_dev;
@@ -180,6 +196,11 @@ static inline u32 ipc_data_readl(u32 offset)
 	return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
 }
 
+static inline u64 gcr_data_readq(u32 offset)
+{
+	return readq(ipcdev.ipc_base + offset);
+}
+
 static int intel_pmc_ipc_check_status(void)
 {
 	int status;
@@ -712,7 +733,8 @@ static int ipc_plat_get_res(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Failed to get ipc resource\n");
 		return -ENXIO;
 	}
-	size = PLAT_RESOURCE_IPC_SIZE;
+	size = PLAT_RESOURCE_IPC_SIZE + PLAT_RESOURCE_GCR_SIZE;
+
 	if (!request_mem_region(res->start, size, pdev->name)) {
 		dev_err(&pdev->dev, "Failed to request ipc resource\n");
 		return -EBUSY;
@@ -748,6 +770,28 @@ static int ipc_plat_get_res(struct platform_device *pdev)
 	return 0;
 }
 
+/**
+ * intel_pmc_s0ix_counter_read() - Read S0ix residency.
+ * @data: Out param that contains current S0ix residency count.
+ *
+ * Return: an error code or 0 on success.
+ */
+int intel_pmc_s0ix_counter_read(u64 *data)
+{
+	u64 deep, shlw;
+
+	if (!ipcdev.has_gcr_regs)
+		return -EACCES;
+
+	deep = gcr_data_readq(GCR_TELEM_DEEP_S0IX_OFFSET);
+	shlw = gcr_data_readq(GCR_TELEM_SHLW_S0IX_OFFSET);
+
+	*data = S0IX_RESIDENCY_IN_USECS(deep, shlw);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(intel_pmc_s0ix_counter_read);
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ipc_acpi_ids[] = {
 	{ "INT34D2", 0},
@@ -797,6 +841,8 @@ static int ipc_plat_probe(struct platform_device *pdev)
 		goto err_sys;
 	}
 
+	ipcdev.has_gcr_regs = true;
+
 	return 0;
 err_sys:
 	free_irq(ipcdev.irq, &ipcdev);
@@ -808,8 +854,11 @@ static int ipc_plat_probe(struct platform_device *pdev)
 	iounmap(ipcdev.ipc_base);
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
 				    PLAT_RESOURCE_IPC_INDEX);
-	if (res)
-		release_mem_region(res->start, PLAT_RESOURCE_IPC_SIZE);
+	if (res) {
+		release_mem_region(res->start,
+				   PLAT_RESOURCE_IPC_SIZE +
+				   PLAT_RESOURCE_GCR_SIZE);
+	}
 	return ret;
 }
 
@@ -825,8 +874,11 @@ static int ipc_plat_remove(struct platform_device *pdev)
 	iounmap(ipcdev.ipc_base);
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
 				    PLAT_RESOURCE_IPC_INDEX);
-	if (res)
-		release_mem_region(res->start, PLAT_RESOURCE_IPC_SIZE);
+	if (res) {
+		release_mem_region(res->start,
+				   PLAT_RESOURCE_IPC_SIZE +
+				   PLAT_RESOURCE_GCR_SIZE);
+	}
 	ipcdev.dev = NULL;
 	return 0;
 }
-- 
1.9.1
