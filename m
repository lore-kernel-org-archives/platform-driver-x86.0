From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 19/28] platform/x86: intel-rst: Sort headers alphabetically
Date: Wed, 26 Sep 2018 19:52:14 +0300
Message-ID: <20180926165223.19390-19-andriy.shevchenko@linux.intel.com>
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
 drivers/platform/x86/intel-rst.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-rst.c b/drivers/platform/x86/intel-rst.c
index 7344d841f4d9..56abf5cbb824 100644
--- a/drivers/platform/x86/intel-rst.c
+++ b/drivers/platform/x86/intel-rst.c
@@ -17,10 +17,9 @@
  */
 
 
-#include <linux/init.h>
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/acpi.h>
 
 MODULE_LICENSE("GPL");
 
-- 
2.19.0
