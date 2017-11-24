From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v1 1/4] platform/x86: intel_pmc_ipc: Add read64 API
Date: Fri, 24 Nov 2017 19:04:41 +0530
Message-ID: <1511530484-29845-2-git-send-email-souvik.k.chakravarty@intel.com>
References: <1511530484-29845-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511530484-29845-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Add intel_pmc_gcr_read64() API for reading from 64-bit GCR registers.
This API will be called from intel_telemetry. Update description of
intel_pmc_gcr_read().

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 arch/x86/include/asm/intel_pmc_ipc.h |  6 ++++++
 drivers/platform/x86/intel_pmc_ipc.c | 33 +++++++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/intel_pmc_ipc.h b/arch/x86/include/asm/intel_pmc_ipc.h
index fac89eb..19c9369 100644
--- a/arch/x86/include/asm/intel_pmc_ipc.h
+++ b/arch/x86/include/asm/intel_pmc_ipc.h
@@ -37,6 +37,7 @@ int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
 		u32 *out, u32 outlen);
 int intel_pmc_s0ix_counter_read(u64 *data);
 int intel_pmc_gcr_read(u32 offset, u32 *data);
+int intel_pmc_gcr_read64(u32 offset, u64 *data);
 int intel_pmc_gcr_write(u32 offset, u32 data);
 int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val);
 
@@ -69,6 +70,11 @@ static inline int intel_pmc_gcr_read(u32 offset, u32 *data)
 	return -EINVAL;
 }
 
+static inline int intel_pmc_gcr_read64(u32 offset, u64 *data)
+{
+	return -EINVAL;
+}
+
 static inline int intel_pmc_gcr_write(u32 offset, u32 data)
 {
 	return -EINVAL;
diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index e03fa314..e7edc8c 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -215,11 +215,11 @@ static inline int is_gcr_valid(u32 offset)
 }
 
 /**
- * intel_pmc_gcr_read() - Read PMC GCR register
+ * intel_pmc_gcr_read() - Read a 32-bit PMC GCR register
  * @offset:	offset of GCR register from GCR address base
  * @data:	data pointer for storing the register output
  *
- * Reads the PMC GCR register of given offset.
+ * Reads the 32-bit PMC GCR register at given offset.
  *
  * Return:	negative value on error or 0 on success.
  */
@@ -244,6 +244,35 @@ int intel_pmc_gcr_read(u32 offset, u32 *data)
 EXPORT_SYMBOL_GPL(intel_pmc_gcr_read);
 
 /**
+ * intel_pmc_gcr_read64() - Read a 64-bit PMC GCR register
+ * @offset:	offset of GCR register from GCR address base
+ * @data:	data pointer for storing the register output
+ *
+ * Reads the 64-bit PMC GCR register at given offset.
+ *
+ * Return:	negative value on error or 0 on success.
+ */
+int intel_pmc_gcr_read64(u32 offset, u64 *data)
+{
+	int ret;
+
+	spin_lock(&ipcdev.gcr_lock);
+
+	ret = is_gcr_valid(offset);
+	if (ret < 0) {
+		spin_unlock(&ipcdev.gcr_lock);
+		return ret;
+	}
+
+	*data = readq(ipcdev.gcr_mem_base + offset);
+
+	spin_unlock(&ipcdev.gcr_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(intel_pmc_gcr_read64);
+
+/**
  * intel_pmc_gcr_write() - Write PMC GCR register
  * @offset:	offset of GCR register from GCR address base
  * @data:	register update value
-- 
2.7.4
