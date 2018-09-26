From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 23/28] platform/x86: intel-smartconnect: Sort headers alphabetically
Date: Wed, 26 Sep 2018 19:52:18 +0300
Message-ID: <20180926165223.19390-23-andriy.shevchenko@linux.intel.com>
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

While here, remove unneeded linux/init.h inclusion and
move MODULE_DEVICE_TABLE() close to the table.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel-smartconnect.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel-smartconnect.c b/drivers/platform/x86/intel-smartconnect.c
index bbe4c06c769f..274ac488afcb 100644
--- a/drivers/platform/x86/intel-smartconnect.c
+++ b/drivers/platform/x86/intel-smartconnect.c
@@ -17,9 +17,8 @@
  */
 
 
-#include <linux/init.h>
-#include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/module.h>
 
 MODULE_LICENSE("GPL");
 
@@ -44,6 +43,7 @@ static const struct acpi_device_id smartconnect_ids[] = {
 	{"INT33A0", 0},
 	{"", 0}
 };
+MODULE_DEVICE_TABLE(acpi, smartconnect_ids);
 
 static struct acpi_driver smartconnect_driver = {
 	.owner = THIS_MODULE,
@@ -56,5 +56,3 @@ static struct acpi_driver smartconnect_driver = {
 };
 
 module_acpi_driver(smartconnect_driver);
-
-MODULE_DEVICE_TABLE(acpi, smartconnect_ids);
-- 
2.19.0
