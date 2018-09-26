From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 09/28] platform/x86: intel_mid_powerbtn: Remove unnecessary init.h inclusion
Date: Wed, 26 Sep 2018 19:52:04 +0300
Message-ID: <20180926165223.19390-9-andriy.shevchenko@linux.intel.com>
References: <20180926165223.19390-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926165223.19390-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>, Mario Limonciello <mario.limonciello@dell.com>, Sujith Thomas <sujith.thomas@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Zha Qipeng <qipeng.zha@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

No need to include linux/init.h when linux/module.h is.

No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index c93299002169..b8d659233c6a 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -16,7 +16,6 @@
  * General Public License for more details.
  */
 
-#include <linux/init.h>
 #include <linux/input.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/intel_msic.h>
-- 
2.19.0
