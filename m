From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] intel_punit_ipc: include linux/io.h
Date: Fri, 17 Aug 2018 11:51:21 +0200
Message-ID: <20180817095131.2557798-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolai Stange <nstange@suse.de>, Thomas Gleixner <tglx@linutronix.de>, "Michael S. Tsirkin" <mst@redhat.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

After we stop including linux/irq.h implicitly, we don't see linux/io.h
in intel_punit_ipc.c, leading to a build failure:

drivers/platform/x86/intel_punit_ipc.c: In function 'ipc_read_status':
drivers/platform/x86/intel_punit_ipc.c:55:9: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]

Add back the include that is clearly needed.

Fixes: 447ae3166702 ("x86: Don't include linux/irq.h from asm/hardirq.h")
Cc: Nicolai Stange <nstange@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/intel_punit_ipc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platform/x86/intel_punit_ipc.c
index f1afc0ebbc68..2efeab650345 100644
--- a/drivers/platform/x86/intel_punit_ipc.c
+++ b/drivers/platform/x86/intel_punit_ipc.c
@@ -18,6 +18,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/platform_device.h>
 #include <asm/intel_punit_ipc.h>
 
-- 
2.18.0
