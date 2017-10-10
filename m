From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH 3/3] platform/x86: intel_telemetry: cleanup redundant headers
Date: Tue, 10 Oct 2017 15:35:19 +0530
Message-ID: <1507629919-31299-3-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1507629919-31299-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507629919-31299-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, souvik.k.chakravarty@intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Removes unnecessary header files included in the driver and sorts the
remaining ones in the alphabetical order.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_telemetry_core.c    | 3 +--
 drivers/platform/x86/intel_telemetry_debugfs.c | 8 +++-----
 drivers/platform/x86/intel_telemetry_pltdrv.c  | 8 --------
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel_telemetry_core.c b/drivers/platform/x86/intel_telemetry_core.c
index 0d4c3808a6d8..f378621b5fe9 100644
--- a/drivers/platform/x86/intel_telemetry_core.c
+++ b/drivers/platform/x86/intel_telemetry_core.c
@@ -15,9 +15,8 @@
  * Telemetry Framework provides platform related PM and performance statistics.
  * This file provides the core telemetry API implementation.
  */
-#include <linux/module.h>
-#include <linux/init.h>
 #include <linux/device.h>
+#include <linux/module.h>
 
 #include <asm/intel_telemetry.h>
 
diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index d4fc42b4cbeb..6219a6541965 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -21,14 +21,12 @@
  * /sys/kernel/debug/telemetry/ioss_race_verbosity: Write and Change Tracing
  *				Verbosity via firmware
  */
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/device.h>
 #include <linux/debugfs.h>
-#include <linux/seq_file.h>
+#include <linux/device.h>
 #include <linux/io.h>
-#include <linux/uaccess.h>
+#include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/seq_file.h>
 #include <linux/suspend.h>
 
 #include <asm/cpu_device_id.h>
diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
index 3daf92e1282f..678abf2e9e92 100644
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -17,14 +17,6 @@
  * The accumulated results are fetched from SRAM.
  */
 #include <linux/module.h>
-#include <linux/init.h>
-#include <linux/device.h>
-#include <linux/debugfs.h>
-#include <linux/seq_file.h>
-#include <linux/io.h>
-#include <linux/uaccess.h>
-#include <linux/pci.h>
-#include <linux/suspend.h>
 #include <linux/platform_device.h>
 
 #include <asm/cpu_device_id.h>
-- 
2.7.4
