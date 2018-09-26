From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 14/28] platform/x86: intel_oaktrail: Convert to use SPDX identifier
Date: Wed, 26 Sep 2018 19:52:09 +0300
Message-ID: <20180926165223.19390-14-andriy.shevchenko@linux.intel.com>
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
 drivers/platform/x86/intel_oaktrail.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/intel_oaktrail.c b/drivers/platform/x86/intel_oaktrail.c
index 1d98fd9ca1ea..3c0438ba385e 100644
--- a/drivers/platform/x86/intel_oaktrail.c
+++ b/drivers/platform/x86/intel_oaktrail.c
@@ -1,5 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
- * intel_oaktrail.c - Intel OakTrail Platform support.
+ * Intel OakTrail Platform support
  *
  * Copyright (C) 2010-2011 Intel Corporation
  * Author: Yin Kangkai (kangkai.yin@intel.com)
@@ -8,21 +9,6 @@
  * <cezary.jackiewicz (at) gmail.com>, based on MSI driver
  * Copyright (C) 2006 Lennart Poettering <mzxreary (at) 0pointer (dot) de>
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful, but
- *  WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
- *  General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
- *  02110-1301, USA.
- *
  * This driver does below things:
  * 1. registers itself in the Linux backlight control in
  *    /sys/class/backlight/intel_oaktrail/
-- 
2.19.0
