From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/10] platform/x86: intel_scu_ipc: Drop unused macros
Date: Wed, 22 Jan 2020 19:28:10 +0300
Message-ID: <20200122162813.26070-8-mika.westerberg@linux.intel.com>
References: <20200122162813.26070-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200122162813.26070-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

These macros are not used anywhere in the driver so drop them.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index c93571cea920..baf7679e1cde 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -26,11 +26,7 @@
 #include <asm/intel_scu_ipc.h>
 
 /* IPC defines the following message types */
-#define IPCMSG_WATCHDOG_TIMER 0xF8 /* Set Kernel Watchdog Threshold */
-#define IPCMSG_BATTERY        0xEF /* Coulomb Counter Accumulator */
-#define IPCMSG_FW_UPDATE      0xFE /* Firmware update */
-#define IPCMSG_PCNTRL         0xFF /* Power controller unit read/write */
-#define IPCMSG_FW_REVISION    0xF4 /* Get firmware revision */
+#define IPCMSG_PCNTRL         0xff /* Power controller unit read/write */
 
 /* Command id associated with message IPCMSG_PCNTRL */
 #define IPC_CMD_PCNTRL_W      0 /* Register write */
-- 
2.24.1
