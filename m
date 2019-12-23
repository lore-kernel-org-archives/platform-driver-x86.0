From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 22/37] platform/x86: intel_pmc_ipc: Drop ipc_data_readb()
Date: Mon, 23 Dec 2019 17:17:01 +0300
Message-ID: <20191223141716.13727-23-mika.westerberg@linux.intel.com>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, x86@kernel.org
Cc: Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This function is not used anywhere so drop it completely.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 677ed470e14e..83b106f66fa6 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -184,11 +184,6 @@ static inline void ipc_data_writel(u32 data, u32 offset)
 	writel(data, ipcdev.ipc_base + IPC_WRITE_BUFFER + offset);
 }
 
-static inline u8 __maybe_unused ipc_data_readb(u32 offset)
-{
-	return readb(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
-}
-
 static inline u32 ipc_data_readl(u32 offset)
 {
 	return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
-- 
2.24.0
