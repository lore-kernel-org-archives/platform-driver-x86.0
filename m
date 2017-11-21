From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v1 1/4] platform/x86: intel_pmc_ipc: Add readq API for GCR
Date: Tue, 21 Nov 2017 20:06:21 +0530
Message-ID: <1511274984-6165-2-git-send-email-souvik.k.chakravarty@intel.com>
References: <1511274984-6165-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511274984-6165-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Add intel_pmc_gcr_readq API for reading from 64-bit GCR registers.
This API will be called from intel_telemetry. Rename intel_pmc_gcr_read
to more appropriate intel_pmc_gcr_readl.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 arch/x86/include/asm/intel_pmc_ipc.h | 10 ++++++++--
 drivers/platform/x86/intel_pmc_ipc.c | 37 ++++++++++++++++++++++++++++++++----
 2 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/intel_pmc_ipc.h b/arch/x86/include/asm/intel_pmc_ipc.h
index fac89eb..0aa5be9 100644
--- a/arch/x86/include/asm/intel_pmc_ipc.h
+++ b/arch/x86/include/asm/intel_pmc_ipc.h
@@ -36,7 +36,8 @@ int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen,
 int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
 		u32 *out, u32 outlen);
 int intel_pmc_s0ix_counter_read(u64 *data);
-int intel_pmc_gcr_read(u32 offset, u32 *data);
+int intel_pmc_gcr_readl(u32 offset, u32 *data);
+int intel_pmc_gcr_readq(u32 offset, u64 *data);
 int intel_pmc_gcr_write(u32 offset, u32 data);
 int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val);
 
@@ -64,7 +65,12 @@ static inline int intel_pmc_s0ix_counter_read(u64 *data)
 	return -EINVAL;
 }
 
-static inline int intel_pmc_gcr_read(u32 offset, u32 *data)
+static inline int intel_pmc_gcr_readl(u32 offset, u32 *data)
+{
+	return -EINVAL;
+}
+
+static inline int intel_pmc_gcr_readq(u32 offset, u64 *data)
 {
 	return -EINVAL;
 }
diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index e03fa314..bef9c57 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -215,15 +215,15 @@ static inline int is_gcr_valid(u32 offset)
 }
 
 /**
- * intel_pmc_gcr_read() - Read PMC GCR register
+ * intel_pmc_gcr_readl() - Read a 32-bit PMC GCR register
  * @offset:	offset of GCR register from GCR address base
  * @data:	data pointer for storing the register output
  *
- * Reads the PMC GCR register of given offset.
+ * Reads the 32-bit PMC GCR register at given offset.
  *
  * Return:	negative value on error or 0 on success.
  */
-int intel_pmc_gcr_read(u32 offset, u32 *data)
+int intel_pmc_gcr_readl(u32 offset, u32 *data)
 {
 	int ret;
 
@@ -241,7 +241,36 @@ int intel_pmc_gcr_read(u32 offset, u32 *data)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(intel_pmc_gcr_read);
+EXPORT_SYMBOL_GPL(intel_pmc_gcr_readl);
+
+/**
+ * intel_pmc_gcr_readq() - Read a 64-bit PMC GCR register
+ * @offset:	offset of GCR register from GCR address base
+ * @data:	data pointer for storing the register output
+ *
+ * Reads the 64-bit PMC GCR register at given offset.
+ *
+ * Return:	negative value on error or 0 on success.
+ */
+int intel_pmc_gcr_readq(u32 offset, u64 *data)
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
+EXPORT_SYMBOL_GPL(intel_pmc_gcr_readq);
 
 /**
  * intel_pmc_gcr_write() - Write PMC GCR register
-- 
2.7.4
