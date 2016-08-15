From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] platform: intel_pmic: make gpio explicitly non-modular
Date: Mon, 15 Aug 2016 18:24:59 -0400
Message-ID: <20160815222459.1279-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:60486 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753021AbcHOWZl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Aug 2016 18:25:41 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Darren Hart <dvhart@infradead.org>, Alek Du <alek.du@intel.com>, platform-driver-x86@vger.kernel.org

The Kconfig entry controlling compilation of this code is:

drivers/platform/x86/Kconfig:config GPIO_INTEL_PMIC
drivers/platform/x86/Kconfig:   bool "Intel PMIC GPIO support"

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular infrastructure use, so that
when reading the driver there is no doubt it is builtin-only.

We delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

We don't replace module.h with init.h since the file already has that.

Cc: Darren Hart <dvhart@infradead.org>
Cc: Alek Du <alek.du@intel.com>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/platform/x86/intel_pmic_gpio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel_pmic_gpio.c b/drivers/platform/x86/intel_pmic_gpio.c
index 63b371d6ee55..91ae58510d92 100644
--- a/drivers/platform/x86/intel_pmic_gpio.c
+++ b/drivers/platform/x86/intel_pmic_gpio.c
@@ -1,6 +1,8 @@
 /* Moorestown PMIC GPIO (access through IPC) driver
  * Copyright (c) 2008 - 2009, Intel Corporation.
  *
+ * Author: Alek Du <alek.du@intel.com>
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
@@ -21,7 +23,6 @@
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
-#include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
@@ -322,9 +323,4 @@ static int __init platform_pmic_gpio_init(void)
 {
 	return platform_driver_register(&platform_pmic_gpio_driver);
 }
-
 subsys_initcall(platform_pmic_gpio_init);
-
-MODULE_AUTHOR("Alek Du <alek.du@intel.com>");
-MODULE_DESCRIPTION("Intel Moorestown PMIC GPIO driver");
-MODULE_LICENSE("GPL v2");
-- 
2.8.4
