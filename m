From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 20/28] platform/x86: intel-rst: Convert to use SPDX identifier
Date: Wed, 26 Sep 2018 19:52:15 +0300
Message-ID: <20180926165223.19390-20-andriy.shevchenko@linux.intel.com>
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

While here, throw away some extra blank lines.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel-rst.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/platform/x86/intel-rst.c b/drivers/platform/x86/intel-rst.c
index 56abf5cbb824..3b81cb896fed 100644
--- a/drivers/platform/x86/intel-rst.c
+++ b/drivers/platform/x86/intel-rst.c
@@ -1,22 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *  Copyright 2013 Matthew Garrett <mjg59@srcf.ucam.org>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License along
- *  with this program; if not, write to the Free Software Foundation, Inc.,
- *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 
-
 #include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -52,12 +38,10 @@ static ssize_t irst_store_wakeup_events(struct device *dev,
 	acpi = to_acpi_device(dev);
 
 	error = kstrtoul(buf, 0, &value);
-
 	if (error)
 		return error;
 
 	status = acpi_execute_simple_method(acpi->handle, "SFFS", value);
-
 	if (ACPI_FAILURE(status))
 		return -EINVAL;
 
@@ -98,12 +82,10 @@ static ssize_t irst_store_wakeup_time(struct device *dev,
 	acpi = to_acpi_device(dev);
 
 	error = kstrtoul(buf, 0, &value);
-
 	if (error)
 		return error;
 
 	status = acpi_execute_simple_method(acpi->handle, "SFTV", value);
-
 	if (ACPI_FAILURE(status))
 		return -EINVAL;
 
-- 
2.19.0
