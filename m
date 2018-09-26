From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 25/28] platform/x86: intel_telemetry: Convert to use SPDX identifier
Date: Wed, 26 Sep 2018 19:52:20 +0300
Message-ID: <20180926165223.19390-25-andriy.shevchenko@linux.intel.com>
References: <20180926165223.19390-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926165223.19390-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>, Mario Limonciello <mario.limonciello@dell.com>, Sujith Thomas <sujith.thomas@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Zha Qipeng <qipeng.zha@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Reduce size of duplicated comments by switching to use SPDX identifier.

No functional change.

While here, correct MODULE_LICENSE() string to be aligned with license text.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_telemetry_core.c    | 12 ++----------
 drivers/platform/x86/intel_telemetry_debugfs.c | 12 ++----------
 drivers/platform/x86/intel_telemetry_pltdrv.c  | 12 ++----------
 3 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/x86/intel_telemetry_core.c b/drivers/platform/x86/intel_telemetry_core.c
index f378621b5fe9..d4040bb222b4 100644
--- a/drivers/platform/x86/intel_telemetry_core.c
+++ b/drivers/platform/x86/intel_telemetry_core.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Intel SoC Core Telemetry Driver
  * Copyright (C) 2015, Intel Corporation.
  * All Rights Reserved.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
  * Telemetry Framework provides platform related PM and performance statistics.
  * This file provides the core telemetry API implementation.
  */
@@ -460,4 +452,4 @@ module_exit(telemetry_module_exit);
 
 MODULE_AUTHOR("Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>");
 MODULE_DESCRIPTION("Intel SoC Telemetry Interface");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index ffd0474b0531..badd1682f9c1 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Intel SOC Telemetry debugfs Driver: Currently supports APL
  * Copyright (c) 2015, Intel Corporation.
  * All Rights Reserved.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
  * This file provides the debugfs interfaces for telemetry.
  * /sys/kernel/debug/telemetry/pss_info: Shows Primary Control Sub-Sys Counters
  * /sys/kernel/debug/telemetry/ioss_info: Shows IO Sub-System Counters
@@ -1037,4 +1029,4 @@ module_exit(telemetry_debugfs_exit);
 MODULE_AUTHOR("Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>");
 MODULE_DESCRIPTION("Intel SoC Telemetry debugfs Interface");
 MODULE_VERSION(DRIVER_VERSION);
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
index 2f889d6c270e..62531d2524d8 100644
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Intel SOC Telemetry Platform Driver: Currently supports APL
  * Copyright (c) 2015, Intel Corporation.
  * All Rights Reserved.
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
  * This file provides the platform specific telemetry implementation for APL.
  * It used the PUNIT and PMC IPC interfaces for configuring the counters.
  * The accumulated results are fetched from SRAM.
@@ -1242,4 +1234,4 @@ module_exit(telemetry_module_exit);
 MODULE_AUTHOR("Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>");
 MODULE_DESCRIPTION("Intel SoC Telemetry Platform Driver");
 MODULE_VERSION(DRIVER_VERSION);
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
-- 
2.19.0
