From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/4] platform/x86: intel_pmc_ipc: Apply same width for offset definitions
Date: Tue,  9 Apr 2019 14:25:13 +0300
Message-ID: <20190409112515.84725-2-andriy.shevchenko@linux.intel.com>
References: <20190409112515.84725-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409112515.84725-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, junxiao.chang@intel.com, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Apply same width for offset definitions to make code more consistent.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index eb0b342996ca..9007aa717586 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -40,7 +40,7 @@
  * The ARC handles the interrupt and services it, writing optional data to
  * the IPC1 registers, updates the IPC_STS response register with the status.
  */
-#define IPC_CMD			0x0
+#define IPC_CMD			0x00
 #define		IPC_CMD_MSI		BIT(8)
 #define		IPC_CMD_SIZE		16
 #define		IPC_CMD_SUBCMD		12
@@ -101,8 +101,8 @@
 #define TELEM_SSRAM_SIZE		240
 #define TELEM_PMC_SSRAM_OFFSET		0x1B00
 #define TELEM_PUNIT_SSRAM_OFFSET	0x1A00
-#define TCO_PMC_OFFSET			0x8
-#define TCO_PMC_SIZE			0x4
+#define TCO_PMC_OFFSET			0x08
+#define TCO_PMC_SIZE			0x04
 
 /* PMC register bit definitions */
 
-- 
2.20.1
