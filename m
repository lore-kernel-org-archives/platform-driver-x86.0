From: Sasha Levin <Alexander.Levin@microsoft.com>
Subject: [PATCH AUTOSEL 4.9 14/42] platform/x86: intel_punit_ipc: fix build
 errors
Date: Thu, 30 Aug 2018 18:13:43 +0000
Message-ID: <20180830181245.36526-14-alexander.levin@microsoft.com>
References: <20180830181245.36526-1-alexander.levin@microsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180830181245.36526-1-alexander.levin@microsoft.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Zha Qipeng <qipeng.zha@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <Alexander.Levin@microsoft.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 340fd4cff43f18bace9358d4decdc9b6ed0715be ]

Fix build errors by #including <linux/io.h>.

../drivers/platform/x86/intel_punit_ipc.c: In function 'ipc_read_status':
../drivers/platform/x86/intel_punit_ipc.c:55:2: error: implicit declaration=
 of function 'readl' [-Werror=3Dimplicit-function-declaration]
  return readl(ipcdev->base[type][BASE_IFACE]);
../drivers/platform/x86/intel_punit_ipc.c: In function 'ipc_write_cmd':
../drivers/platform/x86/intel_punit_ipc.c:60:2: error: implicit declaration=
 of function 'writel' [-Werror=3Dimplicit-function-declaration]
  writel(cmd, ipcdev->base[type][BASE_IFACE]);

Fixes: 447ae3166702 ("x86: Don't include linux/irq.h from asm/hardirq.h")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Zha Qipeng <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
---
 drivers/platform/x86/intel_punit_ipc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platform/x86/=
intel_punit_ipc.c
index b5b890127479..b7dfe06261f1 100644
--- a/drivers/platform/x86/intel_punit_ipc.c
+++ b/drivers/platform/x86/intel_punit_ipc.c
@@ -17,6 +17,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/platform_device.h>
 #include <asm/intel_punit_ipc.h>
=20
--=20
2.17.1
