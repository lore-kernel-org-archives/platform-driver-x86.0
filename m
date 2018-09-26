From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 26/28] platform/x86: intel_turbo_max_3: Sort headers alphabetically
Date: Wed, 26 Sep 2018 19:52:21 +0300
Message-ID: <20180926165223.19390-26-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_turbo_max_3.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_turbo_max_3.c b/drivers/platform/x86/intel_turbo_max_3.c
index a6d5aa0c3c47..0e1bdb883ceb 100644
--- a/drivers/platform/x86/intel_turbo_max_3.c
+++ b/drivers/platform/x86/intel_turbo_max_3.c
@@ -17,12 +17,13 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/kernel.h>
+#include <linux/cpufeature.h>
+#include <linux/cpuhotplug.h>
 #include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/topology.h>
 #include <linux/workqueue.h>
-#include <linux/cpuhotplug.h>
-#include <linux/cpufeature.h>
+
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 
-- 
2.19.0
