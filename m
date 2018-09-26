From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 21/28] platform/x86: intel_scu_ipc: Sort headers alphabetically
Date: Wed, 26 Sep 2018 19:52:16 +0300
Message-ID: <20180926165223.19390-21-andriy.shevchenko@linux.intel.com>
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
 drivers/platform/x86/intel_scu_ipc.c     |  8 +++++---
 drivers/platform/x86/intel_scu_ipcutil.c | 12 ++++++------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 75c8fef7a482..3f4b24a33430 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -16,14 +16,16 @@
  * IPC-1 Driver provides an API for power control unit registers (e.g. MSIC)
  * along with other APIs.
  */
+
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/init.h>
-#include <linux/device.h>
-#include <linux/pm.h>
-#include <linux/pci.h>
 #include <linux/interrupt.h>
+#include <linux/pci.h>
+#include <linux/pm.h>
 #include <linux/sfi.h>
+
 #include <asm/intel-mid.h>
 #include <asm/intel_scu_ipc.h>
 
diff --git a/drivers/platform/x86/intel_scu_ipcutil.c b/drivers/platform/x86/intel_scu_ipcutil.c
index aa454241489c..2a65cabe87f4 100644
--- a/drivers/platform/x86/intel_scu_ipcutil.c
+++ b/drivers/platform/x86/intel_scu_ipcutil.c
@@ -12,16 +12,16 @@
  * This driver provides ioctl interfaces to call intel scu ipc driver api
  */
 
-#include <linux/module.h>
-#include <linux/kernel.h>
 #include <linux/errno.h>
-#include <linux/types.h>
-#include <linux/fs.h>
 #include <linux/fcntl.h>
+#include <linux/fs.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/sched.h>
-#include <linux/uaccess.h>
 #include <linux/slab.h>
-#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+
 #include <asm/intel_scu_ipc.h>
 
 static int major;
-- 
2.19.0
