From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] platform/x86: intel_pmc_ipc: Mark ipc_data_readb() as __maybe_unused
Date: Thu, 25 May 2017 15:15:10 -0700
Message-ID: <20170525221510.41751-1-mka@chromium.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:35025 "EHLO
        mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760040AbdEYWPp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2017 18:15:45 -0400
Received: by mail-pf0-f172.google.com with SMTP id n23so179181533pfb.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2017 15:15:44 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>

The function is currently not used, however it is part of the API and
might be used in the future. Adding the attribute fixes the following
warning when building with clang:

    drivers/platform/x86/intel_pmc_ipc.c:189:18: error: unused function
        'ipc_data_readb' [-Werror,-Wunused-function]

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/platform/x86/intel_pmc_ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index e4d4dfe3e1d1..bb792a52248b 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -186,7 +186,7 @@ static inline void ipc_data_writel(u32 data, u32 offset)
 	writel(data, ipcdev.ipc_base + IPC_WRITE_BUFFER + offset);
 }
 
-static inline u8 ipc_data_readb(u32 offset)
+static inline u8 __maybe_unused ipc_data_readb(u32 offset)
 {
 	return readb(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
 }
-- 
2.13.0.219.gdb65acc882-goog
