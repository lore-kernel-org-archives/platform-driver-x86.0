From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 11/36] platform/x86: intel_scu_ipc: Drop intel_scu_ipc_raw_command()
Date: Mon, 13 Jan 2020 16:55:58 +0300
Message-ID: <20200113135623.56286-12-mika.westerberg@linux.intel.com>
References: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

There is no user for this function so we can drop it from the driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/include/asm/intel_scu_ipc.h |  2 -
 drivers/platform/x86/intel_scu_ipc.c | 63 ----------------------------
 2 files changed, 65 deletions(-)

diff --git a/arch/x86/include/asm/intel_scu_ipc.h b/arch/x86/include/asm/intel_scu_ipc.h
index b59afa59a4cb..2a1442ba6e78 100644
--- a/arch/x86/include/asm/intel_scu_ipc.h
+++ b/arch/x86/include/asm/intel_scu_ipc.h
@@ -38,8 +38,6 @@ int intel_scu_ipc_update_register(u16 addr, u8 data, u8 mask);
 int intel_scu_ipc_simple_command(int cmd, int sub);
 int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 			  u32 *out, int outlen);
-int intel_scu_ipc_raw_command(int cmd, int sub, u8 *in, int inlen,
-			      u32 *out, int outlen, u32 dptr, u32 sptr);
 
 extern struct blocking_notifier_head intel_scu_notifier;
 
diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index ba857e54800b..93a810fa6c8a 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -383,69 +383,6 @@ int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 }
 EXPORT_SYMBOL(intel_scu_ipc_command);
 
-#define IPC_SPTR		0x08
-#define IPC_DPTR		0x0C
-
-/**
- * intel_scu_ipc_raw_command() - IPC command with data and pointers
- * @cmd:	IPC command code.
- * @sub:	IPC command sub type.
- * @in:		input data of this IPC command.
- * @inlen:	input data length in dwords.
- * @out:	output data of this IPC command.
- * @outlen:	output data length in dwords.
- * @sptr:	data writing to SPTR register.
- * @dptr:	data writing to DPTR register.
- *
- * Send an IPC command to SCU with input/output data and source/dest pointers.
- *
- * Return:	an IPC error code or 0 on success.
- */
-int intel_scu_ipc_raw_command(int cmd, int sub, u8 *in, int inlen,
-			      u32 *out, int outlen, u32 dptr, u32 sptr)
-{
-	struct intel_scu_ipc_dev *scu = &ipcdev;
-	int inbuflen = DIV_ROUND_UP(inlen, 4);
-	u32 inbuf[4];
-	int i, err;
-
-	/* Up to 16 bytes */
-	if (inbuflen > 4)
-		return -EINVAL;
-
-	mutex_lock(&ipclock);
-	if (scu->dev == NULL) {
-		mutex_unlock(&ipclock);
-		return -ENODEV;
-	}
-
-	writel(dptr, scu->ipc_base + IPC_DPTR);
-	writel(sptr, scu->ipc_base + IPC_SPTR);
-
-	/*
-	 * SRAM controller doesn't support 8-bit writes, it only
-	 * supports 32-bit writes, so we have to copy input data into
-	 * the temporary buffer, and SCU FW will use the inlen to
-	 * determine the actual input data length in the temporary
-	 * buffer.
-	 */
-	memcpy(inbuf, in, inlen);
-
-	for (i = 0; i < inbuflen; i++)
-		ipc_data_writel(scu, inbuf[i], 4 * i);
-
-	ipc_command(scu, (inlen << 16) | (sub << 12) | cmd);
-	err = intel_scu_ipc_check_status(scu);
-	if (!err) {
-		for (i = 0; i < outlen; i++)
-			*out++ = ipc_data_readl(scu, 4 * i);
-	}
-
-	mutex_unlock(&ipclock);
-	return err;
-}
-EXPORT_SYMBOL_GPL(intel_scu_ipc_raw_command);
-
 /*
  * Interrupt handler gets called when ioc bit of IPC_COMMAND_REG set to 1
  * When ioc bit is set to 1, caller api must wait for interrupt handler called
-- 
2.24.1
