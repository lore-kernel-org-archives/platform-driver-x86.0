From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.9 28/78] platform/x86: intel_punit_ipc: fix build errors
Date: Thu, 13 Sep 2018 15:31:15 +0200
Message-ID: <20180913131808.353589565@linuxfoundation.org>
References: <20180913131805.732342940@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180913131805.732342940@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Zha Qipeng <qipeng.zha@intel.com>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <alexander.levin@microsoft.com>
List-Id: platform-driver-x86.vger.kernel.org

4.9-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 340fd4cff43f18bace9358d4decdc9b6ed0715be ]

Fix build errors by #including <linux/io.h>.

../drivers/platform/x86/intel_punit_ipc.c: In function 'ipc_read_status':
../drivers/platform/x86/intel_punit_ipc.c:55:2: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
  return readl(ipcdev->base[type][BASE_IFACE]);
../drivers/platform/x86/intel_punit_ipc.c: In function 'ipc_write_cmd':
../drivers/platform/x86/intel_punit_ipc.c:60:2: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
  writel(cmd, ipcdev->base[type][BASE_IFACE]);

Fixes: 447ae3166702 ("x86: Don't include linux/irq.h from asm/hardirq.h")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Zha Qipeng <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/platform/x86/intel_punit_ipc.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/platform/x86/intel_punit_ipc.c
+++ b/drivers/platform/x86/intel_punit_ipc.c
@@ -17,6 +17,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/platform_device.h>
 #include <asm/intel_punit_ipc.h>
 
