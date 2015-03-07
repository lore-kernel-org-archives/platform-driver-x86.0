From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_acpi: Update events in toshiba_acpi_notify
Date: Fri,  6 Mar 2015 18:14:41 -0700
Message-ID: <1425690882-2772-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:41607 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346AbbCGBOs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Mar 2015 20:14:48 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch adds a few more events sent to TOSXXXX devices, some of
them are already identified, while some others simply print a message
informing the type of event received.

Also, a netlink event is generated so that userspace apps, daemons,
etc. act accordingly to these events.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 09c6a2f..3a895a8 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2801,6 +2801,21 @@ static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 event)
 	case 0x80: /* Hotkeys and some system events */
 		toshiba_acpi_process_hotkeys(dev);
 		break;
+	case 0x81: /* Dock events */
+	case 0x82:
+	case 0x83:
+		pr_info("Dock event received %x\n", event);
+		break;
+	case 0x88: /* Thermal events */
+		pr_info("Thermal event received\n");
+		break;
+	case 0x8f: /* LID closed */
+	case 0x90: /* LID is closed and Dock has been ejected */
+		break;
+	case 0x8c: /* SATA power events */
+	case 0x8b:
+		pr_info("SATA power event received %x\n", event);
+		break;
 	case 0x92: /* Keyboard backlight mode changed */
 		/* Update sysfs entries */
 		ret = sysfs_update_group(&acpi_dev->dev.kobj,
@@ -2808,17 +2823,19 @@ static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 event)
 		if (ret)
 			pr_err("Unable to update sysfs entries\n");
 		break;
-	case 0x81: /* Unknown */
-	case 0x82: /* Unknown */
-	case 0x83: /* Unknown */
-	case 0x8c: /* Unknown */
+	case 0x85: /* Unknown */
+	case 0x8d: /* Unknown */
 	case 0x8e: /* Unknown */
-	case 0x8f: /* Unknown */
-	case 0x90: /* Unknown */
+	case 0x94: /* Unknown */
+	case 0x95: /* Unknown */
 	default:
 		pr_info("Unknown event received %x\n", event);
 		break;
 	}
+
+	acpi_bus_generate_netlink_event(acpi_dev->pnp.device_class,
+					dev_name(&acpi_dev->dev),
+					event, 0);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.2.2
