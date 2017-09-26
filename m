From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v2 05/14] platform/x86: wmi: sort include list
Date: Tue, 26 Sep 2017 13:50:03 -0500
Message-ID: <b7c52776821073b7dad8b64be79967f2aaf909bf.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:7889 "EHLO
        esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S967877AbdIZSuX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2017 14:50:23 -0400
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>

The include list is randomly assembled right now.  Sort in alphabetical
order.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/wmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 0765b1797d4c..e19b074df01d 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -33,17 +33,17 @@
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/types.h>
+#include <linux/acpi.h>
 #include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/list.h>
-#include <linux/acpi.h>
-#include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/wmi.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 #include <linux/uuid.h>
+#include <linux/wmi.h>
 
 ACPI_MODULE_NAME("wmi");
 MODULE_AUTHOR("Carlos Corbacho");
-- 
2.14.1
