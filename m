From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v1 1/5] platform/x86: intel_pmc_ipc: Fix register names
Date: Thu, 16 Nov 2017 15:48:13 +0530
Message-ID: <1510827497-25188-2-git-send-email-souvik.k.chakravarty@intel.com>
References: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

GCR TELEM register names have been fixed as per the External Design
Sepcification (EDS) of Apollolake and GeminiLake. This makes it
possible to fetch the complete 64-bit S0ix counter using exported APIs.

This patch also fixes some alignment issues in the macro definition
section.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 arch/x86/include/asm/intel_pmc_ipc.h | 10 ++++++----
 drivers/platform/x86/intel_pmc_ipc.c |  4 ++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/intel_pmc_ipc.h b/arch/x86/include/asm/intel_pmc_ipc.h
index fac89eb..b41f388 100644
--- a/arch/x86/include/asm/intel_pmc_ipc.h
+++ b/arch/x86/include/asm/intel_pmc_ipc.h
@@ -3,8 +3,8 @@
 
 /* Commands */
 #define PMC_IPC_PMIC_ACCESS		0xFF
-#define		PMC_IPC_PMIC_ACCESS_READ	0x0
-#define		PMC_IPC_PMIC_ACCESS_WRITE	0x1
+#define	PMC_IPC_PMIC_ACCESS_READ	0x0
+#define	PMC_IPC_PMIC_ACCESS_WRITE	0x1
 #define PMC_IPC_USB_PWR_CTRL		0xF0
 #define PMC_IPC_PMIC_BLACKLIST_SEL	0xEF
 #define PMC_IPC_PHY_CONFIG		0xEE
@@ -25,8 +25,10 @@
 
 /* GCR reg offsets from gcr base*/
 #define PMC_GCR_PMC_CFG_REG		0x08
-#define PMC_GCR_TELEM_DEEP_S0IX_REG	0x78
-#define PMC_GCR_TELEM_SHLW_S0IX_REG	0x80
+#define PMC_GCR_TELEM_DEEP_S0IX_LO_REG	0x78
+#define PMC_GCR_TELEM_DEEP_S0IX_HI_REG	0x7C
+#define PMC_GCR_TELEM_SHLW_S0IX_LO_REG	0x80
+#define PMC_GCR_TELEM_SHLW_S0IX_HI_REG	0x84
 
 #if IS_ENABLED(CONFIG_INTEL_PMC_IPC)
 
diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index e03fa314..1c096e7 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -883,8 +883,8 @@ int intel_pmc_s0ix_counter_read(u64 *data)
 	if (!ipcdev.has_gcr_regs)
 		return -EACCES;
 
-	deep = gcr_data_readq(PMC_GCR_TELEM_DEEP_S0IX_REG);
-	shlw = gcr_data_readq(PMC_GCR_TELEM_SHLW_S0IX_REG);
+	deep = gcr_data_readq(PMC_GCR_TELEM_DEEP_S0IX_LO_REG);
+	shlw = gcr_data_readq(PMC_GCR_TELEM_SHLW_S0IX_LO_REG);
 
 	*data = S0IX_RESIDENCY_IN_USECS(deep, shlw);
 
-- 
2.7.4
