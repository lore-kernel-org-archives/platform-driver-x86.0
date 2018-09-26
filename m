From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 05/28] platform/x86: intel_int0002_vgpio: Convert to use SPDX identifier
Date: Wed, 26 Sep 2018 19:52:00 +0300
Message-ID: <20180926165223.19390-5-andriy.shevchenko@linux.intel.com>
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
 drivers/platform/x86/intel_int0002_vgpio.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
index 33c3489f5bc1..c958a628c375 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Intel INT0002 "Virtual GPIO" driver
  *
@@ -9,10 +10,6 @@
  *
  * Author: Dyut Kumar Sil <dyut.k.sil@intel.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  * Some peripherals on Bay Trail and Cherry Trail platforms signal a Power
  * Management Event (PME) to the Power Management Controller (PMC) to wakeup
  * the system. When this happens software needs to clear the PME bus 0 status
@@ -228,4 +225,4 @@ module_platform_driver(int0002_driver);
 
 MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
 MODULE_DESCRIPTION("Intel INT0002 Virtual GPIO driver");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
-- 
2.19.0
