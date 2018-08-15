From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] platform/x86: fix intel_punit_ipc.c build errors
Date: Wed, 15 Aug 2018 09:12:07 -0700
Message-ID: <aee82dc5-cc0f-0698-04a8-a5857fce9791@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
Cc: Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors by #including <linux/io.h>.

../drivers/platform/x86/intel_punit_ipc.c: In function 'ipc_read_status':
../drivers/platform/x86/intel_punit_ipc.c:55:2: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
  return readl(ipcdev->base[type][BASE_IFACE]);
../drivers/platform/x86/intel_punit_ipc.c: In function 'ipc_write_cmd':
../drivers/platform/x86/intel_punit_ipc.c:60:2: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
  writel(cmd, ipcdev->base[type][BASE_IFACE]);

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Zha Qipeng <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org
---
Found in linux-next but applies to current mainline also.

 drivers/platform/x86/intel_punit_ipc.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20180815.orig/drivers/platform/x86/intel_punit_ipc.c
+++ linux-next-20180815/drivers/platform/x86/intel_punit_ipc.c
@@ -18,6 +18,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/platform_device.h>
 #include <asm/intel_punit_ipc.h>
 
