From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 3/3] toshiba_acpi: Add keyboard backlight mode change event
Date: Wed,  3 Dec 2014 23:42:05 -0700
Message-ID: <1417675325-14921-4-git-send-email-coproscefalo@gmail.com>
References: <1417675325-14921-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417675325-14921-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

A previous patch added support to handle more events.

This patch adds support to update the sysfs group whenever we receive
a 0x92 event, which indicates a change in the keyboard backlight mode.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 21ac11f..5e9b298 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1393,12 +1393,6 @@ static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
 		if (ret)
 			return ret;
 
-		/* Update sysfs entries on successful mode change*/
-		ret = sysfs_update_group(&toshiba->acpi_dev->dev.kobj,
-					 &toshiba_attr_group);
-		if (ret)
-			return ret;
-
 		toshiba->kbd_mode = mode;
 	}
 
@@ -2014,6 +2008,13 @@ static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 event)
 	case 0x80: /* Hotkeys and some system events */
 		toshiba_acpi_process_hotkeys(dev);
 		break;
+	case 0x92: /* Keyboard backlight mode changed */
+		/* Update sysfs entries */
+		ret = sysfs_update_group(&acpi_dev->dev.kobj,
+					 &toshiba_attr_group);
+		if (ret)
+			pr_err("Unable to update sysfs entries\n");
+		break;
 	case 0x81: /* Unknown */
 	case 0x82: /* Unknown */
 	case 0x83: /* Unknown */
-- 
2.1.2
