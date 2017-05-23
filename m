From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] platform/x86: intel_pmc_ipc: Delete unused function ipc_data_readb()
Date: Tue, 23 May 2017 13:55:39 -0700
Message-ID: <20170523205539.71450-1-mka@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: platform-driver-x86.vger.kernel.org

The function was added by commit 0a8b83530b6f ("intel_pmc_ipc: Add Intel
Apollo Lake PMC IPC driver") in 2015 and hasn't been used since then.
Removing it fixes the following warning when building with clang:

    drivers/platform/x86/intel_pmc_ipc.c:189:18: error: unused function
        'ipc_data_readb' [-Werror,-Wunused-function]

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/platform/x86/intel_pmc_ipc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index e4d4dfe3e1d1..aa2fd58b75c4 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -186,11 +186,6 @@ static inline void ipc_data_writel(u32 data, u32 offset)
 	writel(data, ipcdev.ipc_base + IPC_WRITE_BUFFER + offset);
 }
 
-static inline u8 ipc_data_readb(u32 offset)
-{
-	return readb(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
-}
-
 static inline u32 ipc_data_readl(u32 offset)
 {
 	return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
-- 
2.13.0.219.gdb65acc882-goog
