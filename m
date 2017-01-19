From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 09/10] platform/x86: intel_mid_powerbtn: Sort headers alphabetically
Date: Thu, 19 Jan 2017 18:39:48 +0200
Message-ID: <20170119163949.147183-10-andriy.shevchenko@linux.intel.com>
References: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Sort header inclusion block in alphabetical order.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 9b718cf237ee..63ffd1ce3d1c 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -17,14 +17,14 @@
  * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
  */
 
-#include <linux/module.h>
 #include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/slab.h>
-#include <linux/platform_device.h>
 #include <linux/input.h>
+#include <linux/interrupt.h>
 #include <linux/mfd/intel_msic.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
+#include <linux/slab.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
-- 
2.11.0
