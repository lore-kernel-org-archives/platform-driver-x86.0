From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/5] platform/x86: intel_scu_ipc: Introduce intel_scu_ipc_raw_command()
Date: Wed,  5 Apr 2017 19:05:28 +0300
Message-ID: <20170405160528.9678-5-andriy.shevchenko@linux.intel.com>
References: <20170405160528.9678-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170405160528.9678-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

A new call to SCU intel_scu_ipc_raw_command() writes SPTR and DPTR
registers before sending a command.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/include/asm/intel_scu_ipc.h |  8 ++++-
 drivers/platform/x86/intel_scu_ipc.c | 63 ++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/intel_scu_ipc.h b/arch/x86/include/asm/intel_scu_ipc.h
index 4fb1d0abef95..81d3d8776fd9 100644
--- a/arch/x86/include/asm/intel_scu_ipc.h
+++ b/arch/x86/include/asm/intel_scu_ipc.h
@@ -3,6 +3,9 @@
 
 #include <linux/notifier.h>
 
+#define IPCMSG_INDIRECT_READ	0x02
+#define IPCMSG_INDIRECT_WRITE	0x05
+
 #define IPCMSG_COLD_OFF		0x80	/* Only for Tangier */
 
 #define IPCMSG_WARM_RESET	0xF0
@@ -45,7 +48,10 @@ int intel_scu_ipc_update_register(u16 addr, u8 data, u8 mask);
 /* Issue commands to the SCU with or without data */
 int intel_scu_ipc_simple_command(int cmd, int sub);
 int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
-							u32 *out, int outlen);
+			  u32 *out, int outlen);
+int intel_scu_ipc_raw_command(int cmd, int sub, u8 *in, int inlen,
+			      u32 *out, int outlen, u32 dptr, u32 sptr);
+
 /* I2C control api */
 int intel_scu_ipc_i2c_cntrl(u32 addr, u32 *data);
 
diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index f9d3eb505a0b..f7cf981502cd 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -491,6 +491,69 @@ int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 }
 EXPORT_SYMBOL(intel_scu_ipc_command);
 
+#define IPC_SPTR		0x08
+#define IPC_DPTR		0x0C
+
+/**
+ * intel_scu_ipc_raw_command() - IPC command with data and pointers
+ * @cmd:	IPC command code.
+ * @sub:	IPC command sub type.
+ * @in:		input data of this IPC command.
+ * @inlen:	input data length in dwords.
+ * @out:	output data of this IPC command.
+ * @outlen:	output data length in dwords.
+ * @sptr:	data writing to SPTR register.
+ * @dptr:	data writing to DPTR register.
+ *
+ * Send an IPC command to SCU with input/output data and source/dest pointers.
+ *
+ * Return:	an IPC error code or 0 on success.
+ */
+int intel_scu_ipc_raw_command(int cmd, int sub, u8 *in, int inlen,
+			      u32 *out, int outlen, u32 dptr, u32 sptr)
+{
+	struct intel_scu_ipc_dev *scu = &ipcdev;
+	int inbuflen = DIV_ROUND_UP(inlen, 4);
+	u32 inbuf[4];
+	int i, err;
+
+	/* Up to 16 bytes */
+	if (inbuflen > 4)
+		return -EINVAL;
+
+	mutex_lock(&ipclock);
+	if (scu->dev == NULL) {
+		mutex_unlock(&ipclock);
+		return -ENODEV;
+	}
+
+	writel(dptr, scu->ipc_base + IPC_DPTR);
+	writel(sptr, scu->ipc_base + IPC_SPTR);
+
+	/*
+	 * SRAM controller doesn't support 8-bit writes, it only
+	 * supports 32-bit writes, so we have to copy input data into
+	 * the temporary buffer, and SCU FW will use the inlen to
+	 * determine the actual input data length in the temporary
+	 * buffer.
+	 */
+	memcpy(inbuf, in, inlen);
+
+	for (i = 0; i < inbuflen; i++)
+		ipc_data_writel(scu, inbuf[i], 4 * i);
+
+	ipc_command(scu, (inlen << 16) | (sub << 12) | cmd);
+	err = intel_scu_ipc_check_status(scu);
+	if (!err) {
+		for (i = 0; i < outlen; i++)
+			*out++ = ipc_data_readl(scu, 4 * i);
+	}
+
+	mutex_unlock(&ipclock);
+	return err;
+}
+EXPORT_SYMBOL_GPL(intel_scu_ipc_raw_command);
+
 /* I2C commands */
 #define IPC_I2C_WRITE 1 /* I2C Write command */
 #define IPC_I2C_READ  2 /* I2C Read command */
-- 
2.11.0
