From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_acpi: Change some variables to avoid warnings the ninja-check script
Date: Wed, 22 Jul 2015 19:37:49 -0600
Message-ID: <1437615474-27936-4-git-send-email-coproscefalo@gmail.com>
References: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch changes some variables to avoid warnins in the ninja-check
script.

We are basically moving some variables inside the conditionals were
such variables are being used, and we are checking the returned
values of some others.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 08fc867..32d6d16 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1668,7 +1668,6 @@ static ssize_t kbd_backlight_mode_store(struct device *dev,
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	int mode;
-	int time;
 	int ret;
 
 
@@ -1699,7 +1698,7 @@ static ssize_t kbd_backlight_mode_store(struct device *dev,
 	/* Only make a change if the actual mode has changed */
 	if (toshiba->kbd_mode != mode) {
 		/* Shift the time to "base time" (0x3c0000 == 60 seconds) */
-		time = toshiba->kbd_time << HCI_MISC_SHIFT;
+		int time = toshiba->kbd_time << HCI_MISC_SHIFT;
 
 		/* OR the "base time" to the actual method format */
 		if (toshiba->kbd_type == 1) {
@@ -2873,10 +2872,14 @@ static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 event)
 static int toshiba_acpi_suspend(struct device *device)
 {
 	struct toshiba_acpi_dev *dev = acpi_driver_data(to_acpi_device(device));
-	u32 result;
 
-	if (dev->hotkey_dev)
+	if (dev->hotkey_dev) {
+		u32 result;
+
 		result = hci_write(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_DISABLE);
+		if (result != TOS_SUCCESS)
+			pr_info("Unable to disable hotkeys\n");
+	}
 
 	return 0;
 }
@@ -2884,10 +2887,10 @@ static int toshiba_acpi_suspend(struct device *device)
 static int toshiba_acpi_resume(struct device *device)
 {
 	struct toshiba_acpi_dev *dev = acpi_driver_data(to_acpi_device(device));
-	int error;
 
 	if (dev->hotkey_dev) {
-		error = toshiba_acpi_enable_hotkeys(dev);
+		int error = toshiba_acpi_enable_hotkeys(dev);
+
 		if (error)
 			pr_info("Unable to re-enable hotkeys\n");
 	}
-- 
2.4.5
