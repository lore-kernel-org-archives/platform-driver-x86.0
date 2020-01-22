From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 02/10] platform/x86: intel_scu_ipc: Add constants for register offsets
Date: Wed, 22 Jan 2020 19:28:05 +0300
Message-ID: <20200122162813.26070-3-mika.westerberg@linux.intel.com>
References: <20200122162813.26070-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200122162813.26070-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This makes the code more readable. These are taken from intel_pmc_ipc.c
which implements the same thing.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index e330ec73c465..a9b6decbb367 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -97,12 +97,14 @@ static struct intel_scu_ipc_dev  ipcdev; /* Only one for now */
 
 #define IPC_STATUS		0x04
 #define IPC_STATUS_IRQ		BIT(2)
+#define IPC_STATUS_ERR		BIT(1)
+#define IPC_STATUS_BUSY		BIT(0)
 
 /*
- * IPC Read Buffer (Read Only):
- * 16 byte buffer for receiving data from SCU, if IPC command
- * processing results in response data
+ * IPC Write/Read Buffers:
+ * 16 byte buffer for sending and receiving data to and from SCU.
  */
+#define IPC_WRITE_BUFFER	0x80
 #define IPC_READ_BUFFER		0x90
 
 #define IPC_I2C_CNTRL_ADDR	0
@@ -131,7 +133,7 @@ static inline void ipc_command(struct intel_scu_ipc_dev *scu, u32 cmd)
  */
 static inline void ipc_data_writel(struct intel_scu_ipc_dev *scu, u32 data, u32 offset)
 {
-	writel(data, scu->ipc_base + 0x80 + offset);
+	writel(data, scu->ipc_base + IPC_WRITE_BUFFER + offset);
 }
 
 /*
@@ -143,7 +145,7 @@ static inline void ipc_data_writel(struct intel_scu_ipc_dev *scu, u32 data, u32
  */
 static inline u8 ipc_read_status(struct intel_scu_ipc_dev *scu)
 {
-	return __raw_readl(scu->ipc_base + 0x04);
+	return __raw_readl(scu->ipc_base + IPC_STATUS);
 }
 
 /* Read ipc byte data */
@@ -165,17 +167,17 @@ static inline int busy_loop(struct intel_scu_ipc_dev *scu)
 	u32 loop_count = 100000;
 
 	/* break if scu doesn't reset busy bit after huge retry */
-	while ((status & BIT(0)) && --loop_count) {
+	while ((status & IPC_STATUS_BUSY) && --loop_count) {
 		udelay(1); /* scu processing time is in few u secods */
 		status = ipc_read_status(scu);
 	}
 
-	if (status & BIT(0)) {
+	if (status & IPC_STATUS_BUSY) {
 		dev_err(scu->dev, "IPC timed out");
 		return -ETIMEDOUT;
 	}
 
-	if (status & BIT(1))
+	if (status & IPC_STATUS_ERR)
 		return -EIO;
 
 	return 0;
@@ -192,7 +194,7 @@ static inline int ipc_wait_for_interrupt(struct intel_scu_ipc_dev *scu)
 	}
 
 	status = ipc_read_status(scu);
-	if (status & BIT(1))
+	if (status & IPC_STATUS_ERR)
 		return -EIO;
 
 	return 0;
-- 
2.24.1
