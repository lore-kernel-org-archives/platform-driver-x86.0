From: Kuppuswamy Sathyanarayanan
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v2 2/4] platform/x86: intel_pmc_ipc: Add pmc gcr read/write api's
Date: Thu, 16 Mar 2017 17:41:34 -0700
Message-ID: <f9bceaee4cb1c84f2cd34987ab6a443f5d367d4d.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20170316192003.GA19344@rajaneesh-OptiPlex-9010>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:48207 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752856AbdCQAqr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2017 20:46:47 -0400
In-Reply-To: <20170316192003.GA19344@rajaneesh-OptiPlex-9010>
In-Reply-To: <b89221c652d06c3c07fdf2ec32fd4fc8930c64df.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <b89221c652d06c3c07fdf2ec32fd4fc8930c64df.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: andy@infradead.org, qipeng.zha@intel.com, dvhart@infradead.org, david.e.box@linux.intel.com
Cc: rajneesh.bhardwaj@intel.com, sathyanarayanan.kuppuswamy@linux.intel.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This patch adds API's to read/write PMC GC registers.
PMC dependent devices like iTCO_WDT, Telemetry has requirement
to acces GCR registers. These API's can be used for this
purpose.

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 arch/x86/include/asm/intel_pmc_ipc.h | 16 ++++++++++++++++
 drivers/platform/x86/intel_pmc_ipc.c | 14 ++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/x86/include/asm/intel_pmc_ipc.h b/arch/x86/include/asm/intel_pmc_ipc.h
index 4291b6a..017429d 100644
--- a/arch/x86/include/asm/intel_pmc_ipc.h
+++ b/arch/x86/include/asm/intel_pmc_ipc.h
@@ -23,6 +23,10 @@
 #define IPC_ERR_EMSECURITY		6
 #define IPC_ERR_UNSIGNEDKERNEL		7
 
+/* GCR reg offsets from gcr base*/
+#define PMC_GCR_PRSTS_REG		0x00
+#define PMC_GCR_PMC_CFG_REG		0x08
+
 #if IS_ENABLED(CONFIG_INTEL_PMC_IPC)
 
 int intel_pmc_ipc_simple_command(int cmd, int sub);
@@ -31,6 +35,8 @@ int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen,
 int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
 		u32 *out, u32 outlen);
 int intel_pmc_s0ix_counter_read(u64 *data);
+u32 intel_pmc_gcr_read(u32 offset);
+void intel_pmc_gcr_write(u32 offset, u32 data);
 
 #else
 
@@ -56,6 +62,16 @@ static inline int intel_pmc_s0ix_counter_read(u64 *data)
 	return -EINVAL;
 }
 
+static inline u32 intel_pmc_gcr_read(u32 offset)
+{
+	return -EINVAL;
+}
+
+static inline void intel_pmc_gcr_write(u32 offset, u32 data)
+{
+	return;
+}
+
 #endif /*CONFIG_INTEL_PMC_IPC*/
 
 #endif
diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 0a33592..12018f3 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -127,6 +127,7 @@ static struct intel_pmc_ipc_dev {
 
 	/* gcr */
 	resource_size_t gcr_base;
+	void __iomem *gcr_mem_base;
 	int gcr_size;
 	bool has_gcr_regs;
 
@@ -199,6 +200,18 @@ static inline u64 gcr_data_readq(u32 offset)
 	return readq(ipcdev.ipc_base + offset);
 }
 
+u32 intel_pmc_gcr_read(u32 offset)
+{
+	return readl(ipcdev.gcr_mem_base + offset);
+}
+EXPORT_SYMBOL_GPL(intel_pmc_gcr_read);
+
+void intel_pmc_gcr_write(u32 offset, u32 data)
+{
+	writel(data, ipcdev.gcr_mem_base + offset);
+}
+EXPORT_SYMBOL_GPL(intel_pmc_gcr_write);
+
 static int intel_pmc_ipc_check_status(void)
 {
 	int status;
@@ -747,6 +760,7 @@ static int ipc_plat_get_res(struct platform_device *pdev)
 	ipcdev.ipc_base = addr;
 
 	ipcdev.gcr_base = res->start + PLAT_RESOURCE_GCR_OFFSET;
+	ipcdev.gcr_mem_base = addr + PLAT_RESOURCE_GCR_OFFSET;
 	ipcdev.gcr_size = PLAT_RESOURCE_GCR_SIZE;
 	dev_info(&pdev->dev, "ipc res: %pR\n", res);
 
-- 
2.7.4
