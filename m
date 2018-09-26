From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 12/28] platform/x86: intel_mid_thermal: Convert to use SPDX identifier
Date: Wed, 26 Sep 2018 19:52:07 +0300
Message-ID: <20180926165223.19390-12-andriy.shevchenko@linux.intel.com>
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
 drivers/platform/x86/intel_mid_thermal.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index 3fa8207dd34e..f402e2e74a38 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -1,24 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * intel_mid_thermal.c - Intel MID platform thermal driver
+ * Intel MID platform thermal driver
  *
  * Copyright (C) 2011 Intel Corporation
  *
- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.        See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write to the Free Software Foundation, Inc.,
- * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
- *
- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * Author: Durgadoss R <durgadoss.r@intel.com>
  */
 
@@ -566,4 +551,4 @@ module_platform_driver(mid_thermal_driver);
 
 MODULE_AUTHOR("Durgadoss R <durgadoss.r@intel.com>");
 MODULE_DESCRIPTION("Intel Medfield Platform Thermal Driver");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
-- 
2.19.0
