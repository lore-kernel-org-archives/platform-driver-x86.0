From: Weng Xuetian <wengxt@gmail.com>
Subject: [PATCH v5] surface pro 4: Add support for Surface Pro 4 Buttons
Date: Sun, 17 Jan 2016 15:10:38 -0800
Message-ID: <1453072238-14789-1-git-send-email-wengxt@gmail.com>
References: <1452627835-20806-1-git-send-email-wengxt@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35785 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753191AbcAQXLE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Jan 2016 18:11:04 -0500
In-Reply-To: <1452627835-20806-1-git-send-email-wengxt@gmail.com>
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
v5:
 - rename device name macro as required by Chen Yu
v4:
 - Do not rename the driver.
v3:
 - Fix commit message grammar mistakes.
v2:
 - Reformat patch with -M -C
---
 drivers/platform/x86/Kconfig              |  4 ++--
 drivers/platform/x86/surfacepro3_button.c | 10 ++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

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
index f7dade3..b9c38f6 100644
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
@@ -19,9 +19,10 @@
 #include <linux/acpi.h>
 #include <acpi/button.h>
 
-#define SURFACE_BUTTON_HID		"MSHW0028"
+#define SURFACE_PRO3_BUTTON_HID		"MSHW0028"
+#define SURFACE_PRO4_BUTTON_HID		"MSHW0040"
 #define SURFACE_BUTTON_OBJ_NAME		"VGBI"
-#define SURFACE_BUTTON_DEVICE_NAME	"Surface Pro 3 Buttons"
+#define SURFACE_BUTTON_DEVICE_NAME	"Surface Pro 3/4 Buttons"
 
 #define SURFACE_BUTTON_NOTIFY_PRESS_POWER	0xc6
 #define SURFACE_BUTTON_NOTIFY_RELEASE_POWER	0xc7
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
2.7.0
