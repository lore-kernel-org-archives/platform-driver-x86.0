From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] platform/x86: intel-vbtn: Remove redundant inclusions
Date: Wed, 31 Jan 2018 19:54:06 +0200
Message-ID: <20180131175407.18301-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, AceLan Kao <acelan.kao@canonical.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Some headers are not needed since the driver can be built as module.
Remove them.

While here, sort headers alphabetically.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel-vbtn.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 101c100a3929..69bc39f8d61d 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -16,15 +16,13 @@
  *
  */
 
+#include <linux/acpi.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/init.h>
-#include <linux/input.h>
 #include <linux/platform_device.h>
-#include <linux/input/sparse-keymap.h>
-#include <linux/acpi.h>
 #include <linux/suspend.h>
-#include <acpi/acpi_bus.h>
 
 /* When NOT in tablet mode, VGBS returns with the flag 0x40 */
 #define TABLET_MODE_FLAG 0x40
-- 
2.15.1
