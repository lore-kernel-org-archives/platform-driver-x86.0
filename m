From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/4] platform/x86: intel_pmc_ipc: Use BIT() macro
Date: Tue,  9 Apr 2019 14:25:12 +0300
Message-ID: <20190409112515.84725-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, junxiao.chang@intel.com, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Use BIT() and BIT_MASK() macros for definitions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index d37cbd1cf58c..eb0b342996ca 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -41,13 +41,13 @@
  * the IPC1 registers, updates the IPC_STS response register with the status.
  */
 #define IPC_CMD			0x0
-#define		IPC_CMD_MSI		0x100
+#define		IPC_CMD_MSI		BIT(8)
 #define		IPC_CMD_SIZE		16
 #define		IPC_CMD_SUBCMD		12
 #define IPC_STATUS		0x04
-#define		IPC_STATUS_IRQ		0x4
-#define		IPC_STATUS_ERR		0x2
-#define		IPC_STATUS_BUSY		0x1
+#define		IPC_STATUS_IRQ		BIT(2)
+#define		IPC_STATUS_ERR		BIT(1)
+#define		IPC_STATUS_BUSY		BIT(0)
 #define IPC_SPTR		0x08
 #define IPC_DPTR		0x0C
 #define IPC_WRITE_BUFFER	0x80
@@ -107,7 +107,7 @@
 /* PMC register bit definitions */
 
 /* PMC_CFG_REG bit masks */
-#define PMC_CFG_NO_REBOOT_MASK		(1 << 4)
+#define PMC_CFG_NO_REBOOT_MASK		BIT_MASK(4)
 #define PMC_CFG_NO_REBOOT_EN		(1 << 4)
 #define PMC_CFG_NO_REBOOT_DIS		(0 << 4)
 
-- 
2.20.1
