From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 10/10] platform/x86: intel_mid_powerbtn: Remove snail address
Date: Thu, 19 Jan 2017 18:39:49 +0200
Message-ID: <20170119163949.147183-11-andriy.shevchenko@linux.intel.com>
References: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:52485 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753875AbdASQlF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Jan 2017 11:41:05 -0500
In-Reply-To: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The snail address is subject to change. This already happened once.
Remove the address completely from the file to avoid potential noise
when update.

While here, adjust copyright years and list authors.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 63ffd1ce3d1c..1d30b3549748 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -1,7 +1,10 @@
 /*
  * Power button driver for Intel MID platforms.
  *
- * Copyright (C) 2010 Intel Corp
+ * Copyright (C) 2010,2017 Intel Corp
+ *
+ * Author: Hong Liu <hong.liu@intel.com>
+ * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -11,10 +14,6 @@
  * WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write to the Free Software Foundation, Inc.,
- * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
  */
 
 #include <linux/init.h>
-- 
2.11.0
