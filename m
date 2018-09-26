From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 13/28] platform/x86: intel_oaktrail: Sort headers alphabetically
Date: Wed, 26 Sep 2018 19:52:08 +0300
Message-ID: <20180926165223.19390-13-andriy.shevchenko@linux.intel.com>
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
 drivers/platform/x86/intel_oaktrail.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel_oaktrail.c b/drivers/platform/x86/intel_oaktrail.c
index 5747f63c8d9f..1d98fd9ca1ea 100644
--- a/drivers/platform/x86/intel_oaktrail.c
+++ b/drivers/platform/x86/intel_oaktrail.c
@@ -38,18 +38,18 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
 #include <linux/acpi.h>
-#include <linux/fb.h>
-#include <linux/mutex.h>
+#include <linux/backlight.h>
+#include <linux/dmi.h>
 #include <linux/err.h>
+#include <linux/fb.h>
 #include <linux/i2c.h>
-#include <linux/backlight.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/dmi.h>
 #include <linux/rfkill.h>
+
 #include <acpi/video.h>
 
 #define DRIVER_NAME	"intel_oaktrail"
-- 
2.19.0
