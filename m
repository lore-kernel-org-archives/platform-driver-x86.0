From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 15/28] platform/x86: intel_pmc: Sort headers alphabetically
Date: Wed, 26 Sep 2018 19:52:10 +0300
Message-ID: <20180926165223.19390-15-andriy.shevchenko@linux.intel.com>
References: <20180926165223.19390-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926165223.19390-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>, Mario Limonciello <mario.limonciello@dell.com>, Sujith Thomas <sujith.thomas@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Zha Qipeng <qipeng.zha@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Sort headers alphabetically for better maintenance.

No functional change.

While here, remove unneeded linux/init.h inclusion.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index e7edc8c63936..8b88e1743e41 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -15,25 +15,24 @@
  * core through IPC mechanism which in turn messaging between IA core ad PMC.
  */
 
-#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/atomic.h>
+#include <linux/bitops.h>
 #include <linux/delay.h>
-#include <linux/errno.h>
-#include <linux/init.h>
 #include <linux/device.h>
-#include <linux/pm.h>
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
-#include <linux/interrupt.h>
+#include <linux/pm.h>
 #include <linux/pm_qos.h>
-#include <linux/kernel.h>
-#include <linux/bitops.h>
 #include <linux/sched.h>
-#include <linux/atomic.h>
-#include <linux/notifier.h>
-#include <linux/suspend.h>
-#include <linux/acpi.h>
-#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/spinlock.h>
+#include <linux/suspend.h>
 
 #include <asm/intel_pmc_ipc.h>
 
-- 
2.19.0
