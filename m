From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 22/28] platform/x86: intel_scu_ipc: Convert to use SPDX identifier
Date: Wed, 26 Sep 2018 19:52:17 +0300
Message-ID: <20180926165223.19390-22-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_ipc.c     |  8 ++------
 drivers/platform/x86/intel_scu_ipcutil.c | 12 ++++--------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 3f4b24a33430..cdab916fbf92 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -1,14 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * intel_scu_ipc.c: Driver for the Intel SCU IPC mechanism
+ * Driver for the Intel SCU IPC mechanism
  *
  * (C) Copyright 2008-2010,2015 Intel Corporation
  * Author: Sreedhara DS (sreedhara.ds@intel.com)
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; version 2
- * of the License.
- *
  * SCU running in ARC processor communicates with other entity running in IA
  * core through IPC mechanism which in turn messaging between IA core ad SCU.
  * SCU has two IPC mechanism IPC-1 and IPC-2. IPC-1 is used between IA32 and
diff --git a/drivers/platform/x86/intel_scu_ipcutil.c b/drivers/platform/x86/intel_scu_ipcutil.c
index 2a65cabe87f4..8afe6fa06d7b 100644
--- a/drivers/platform/x86/intel_scu_ipcutil.c
+++ b/drivers/platform/x86/intel_scu_ipcutil.c
@@ -1,15 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * intel_scu_ipc.c: Driver for the Intel SCU IPC mechanism
+ * Driver for the Intel SCU IPC mechanism
  *
  * (C) Copyright 2008-2010 Intel Corporation
  * Author: Sreedhara DS (sreedhara.ds@intel.com)
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; version 2
- * of the License.
- *
- * This driver provides ioctl interfaces to call intel scu ipc driver api
+ * This driver provides IOCTL interfaces to call Intel SCU IPC driver API.
  */
 
 #include <linux/errno.h>
@@ -26,7 +22,7 @@
 
 static int major;
 
-/* ioctl commnds */
+/* IOCTL commands */
 #define	INTE_SCU_IPC_REGISTER_READ	0
 #define INTE_SCU_IPC_REGISTER_WRITE	1
 #define INTE_SCU_IPC_REGISTER_UPDATE	2
-- 
2.19.0
