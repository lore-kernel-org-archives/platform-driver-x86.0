From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 16/28] platform/x86: intel_pmc: Convert to use SPDX identifier
Date: Wed, 26 Sep 2018 19:52:11 +0300
Message-ID: <20180926165223.19390-16-andriy.shevchenko@linux.intel.com>
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
 drivers/platform/x86/intel_pmc_core.c | 11 +----------
 drivers/platform/x86/intel_pmc_core.h | 11 +----------
 drivers/platform/x86/intel_pmc_ipc.c  | 12 ++++--------
 3 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 2d272a3e0176..6b31d410cb09 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Intel Core SoC Power Management Controller Driver
  *
@@ -6,16 +7,6 @@
  *
  * Authors: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
  *          Vishwanath Somayaji <vishwanath.somayaji@intel.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index 93a7e99e1f8b..be045348ad86 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Intel Core SoC Power Management Controller Header File
  *
@@ -6,16 +7,6 @@
  *
  * Authors: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
  *          Vishwanath Somayaji <vishwanath.somayaji@intel.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
  */
 
 #ifndef PMC_CORE_H
diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 8b88e1743e41..7964ba22ef8d 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -1,16 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * intel_pmc_ipc.c: Driver for the Intel PMC IPC mechanism
+ * Driver for the Intel PMC IPC mechanism
  *
  * (C) Copyright 2014-2015 Intel Corporation
  *
- * This driver is based on Intel SCU IPC driver(intel_scu_opc.c) by
+ * This driver is based on Intel SCU IPC driver(intel_scu_ipc.c) by
  *     Sreedhara DS <sreedhara.ds@intel.com>
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; version 2
- * of the License.
- *
  * PMC running in ARC processor communicates with other entity running in IA
  * core through IPC mechanism which in turn messaging between IA core ad PMC.
  */
@@ -1028,7 +1024,7 @@ static void __exit intel_pmc_ipc_exit(void)
 
 MODULE_AUTHOR("Zha Qipeng <qipeng.zha@intel.com>");
 MODULE_DESCRIPTION("Intel PMC IPC driver");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 
 /* Some modules are dependent on this, so init earlier */
 fs_initcall(intel_pmc_ipc_init);
-- 
2.19.0
