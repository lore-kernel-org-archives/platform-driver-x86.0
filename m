From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 11/28] platform/x86: intel_mid_thermal: Sort headers alphabetically
Date: Wed, 26 Sep 2018 19:52:06 +0300
Message-ID: <20180926165223.19390-11-andriy.shevchenko@linux.intel.com>
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
 drivers/platform/x86/intel_mid_thermal.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index 008a76903cbf..3fa8207dd34e 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -24,16 +24,15 @@
 
 #define pr_fmt(fmt) "intel_mid_thermal: " fmt
 
-#include <linux/module.h>
-#include <linux/init.h>
+#include <linux/device.h>
 #include <linux/err.h>
+#include <linux/mfd/intel_msic.h>
+#include <linux/module.h>
 #include <linux/param.h>
-#include <linux/device.h>
 #include <linux/platform_device.h>
-#include <linux/slab.h>
 #include <linux/pm.h>
+#include <linux/slab.h>
 #include <linux/thermal.h>
-#include <linux/mfd/intel_msic.h>
 
 /* Number of thermal sensors */
 #define MSIC_THERMAL_SENSORS	4
-- 
2.19.0
