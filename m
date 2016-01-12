From: Weng Xuetian <wengxt@gmail.com>
Subject: [PATCH v4] surface pro 4: Add support for Surface Pro 4 Buttons
Date: Tue, 12 Jan 2016 11:43:55 -0800
Message-ID: <1452627835-20806-1-git-send-email-wengxt@gmail.com>
References: <1451244080-940-1-git-send-email-wengxt@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34117 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752716AbcALToX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Jan 2016 14:44:23 -0500
In-Reply-To: <1451244080-940-1-git-send-email-wengxt@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chen Yu <yu.c.chen@intel.com>
Cc: Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Weng Xuetian <wengxt@gmail.com>

Surface Pro 4 buttons are managed by a device with _HID "MSHW0040"
different from Surface Pro 3.

This commit adds MSHW0040 to id list to support the Surface Pro 4.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=109871
Signed-off-by: Weng Xuetian <wengxt@gmail.com>
---
v4:
 - Do not rename the driver.
v3:
 - Fix commit message grammar mistakes.
v2:
 - Reformat patch with -M -C
---
 drivers/platform/x86/Kconfig              | 4 ++--
 drivers/platform/x86/surfacepro3_button.c | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1089eaa..ea76d67 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -940,8 +940,8 @@ config INTEL_PMC_IPC
 	with other entities in the CPU.
 
 config SURFACE_PRO3_BUTTON
-	tristate "Power/home/volume buttons driver for Microsoft Surface Pro 3 tablet"
+	tristate "Power/home/volume buttons driver for Microsoft Surface Pro 3/4 tablet"
 	depends on ACPI && INPUT
 	---help---
-	  This driver handles the power/home/volume buttons on the Microsoft Surface Pro 3 tablet.
+	  This driver handles the power/home/volume buttons on the Microsoft Surface Pro 3/4 tablet.
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/surfacepro3_button.c b/drivers/platform/x86/surfacepro3_button.c
index f7dade3..2c0e7d7 100644
--- a/drivers/platform/x86/surfacepro3_button.c
+++ b/drivers/platform/x86/surfacepro3_button.c
@@ -1,6 +1,6 @@
 /*
  * power/home/volume button support for
- * Microsoft Surface Pro 3 tablet.
+ * Microsoft Surface Pro 3/4 tablet.
  *
  * Copyright (c) 2015 Intel Corporation.
  * All rights reserved.
@@ -19,7 +19,8 @@
 #include <linux/acpi.h>
 #include <acpi/button.h>
 
-#define SURFACE_BUTTON_HID		"MSHW0028"
+#define SURFACE_PRO3_BUTTON_HID		"MSHW0028"
+#define SURFACE_PRO4_BUTTON_HID		"MSHW0040"
 #define SURFACE_BUTTON_OBJ_NAME		"VGBI"
 #define SURFACE_BUTTON_DEVICE_NAME	"Surface Pro 3 Buttons"
 
@@ -54,7 +55,8 @@ MODULE_LICENSE("GPL v2");
  * acpi_driver.
  */
 static const struct acpi_device_id surface_button_device_ids[] = {
-	{SURFACE_BUTTON_HID,    0},
+	{SURFACE_PRO3_BUTTON_HID,    0},
+	{SURFACE_PRO4_BUTTON_HID,    0},
 	{"", 0},
 };
 MODULE_DEVICE_TABLE(acpi, surface_button_device_ids);
-- 
2.6.4
