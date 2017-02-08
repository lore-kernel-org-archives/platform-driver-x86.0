From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] platform/x86: alienware-wmi: Remove header duplicate
Date: Wed,  8 Feb 2017 17:33:01 +0200
Message-ID: <20170208153301.154302-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:20984 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754667AbdBHPfM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2017 10:35:12 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

No need to #include <linux/acpi.h> twice. Remove second occurrence.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/alienware-wmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 005629447b0c..d6b34923fb4e 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -21,7 +21,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/dmi.h>
-#include <linux/acpi.h>
 #include <linux/leds.h>
 
 #define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
-- 
2.11.0
