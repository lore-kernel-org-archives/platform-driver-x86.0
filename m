From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 17/28] platform/x86: intel_punit_ipc: Sort headers alphabetically
Date: Wed, 26 Sep 2018 19:52:12 +0300
Message-ID: <20180926165223.19390-17-andriy.shevchenko@linux.intel.com>
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
 drivers/platform/x86/intel_punit_ipc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platform/x86/intel_punit_ipc.c
index 2efeab650345..8eaa60c9ad69 100644
--- a/drivers/platform/x86/intel_punit_ipc.c
+++ b/drivers/platform/x86/intel_punit_ipc.c
@@ -11,15 +11,16 @@
  * which provide mailbox interface for power management usage.
  */
 
-#include <linux/module.h>
-#include <linux/mod_devicetable.h>
 #include <linux/acpi.h>
-#include <linux/delay.h>
 #include <linux/bitops.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
+
 #include <asm/intel_punit_ipc.h>
 
 /* IPC Mailbox registers */
-- 
2.19.0
