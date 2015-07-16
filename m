From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_acpi: Transflective backlight updates
Date: Thu, 16 Jul 2015 17:33:52 -0600
Message-ID: <1437089632-4293-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36293 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751927AbbGPXd7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 16 Jul 2015 19:33:59 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch changes the tr function seconf parameter from bool to u32,
to be in par with the rest of the TCI functions of the driver, and the
code was updated accordingly.

Also, the check for translective support was moved to the *add
function, as the {__get, set}_lcd_brightness functions amke use of it.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 3ad7b1f..15d8f0d 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1184,22 +1184,17 @@ static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
 }
 
 /* Transflective Backlight */
-static int get_tr_backlight_status(struct toshiba_acpi_dev *dev, bool *enabled)
+static int get_tr_backlight_status(struct toshiba_acpi_dev *dev, u32 *status)
 {
-	u32 hci_result;
-	u32 status;
+	u32 hci_result = hci_read(dev, HCI_TR_BACKLIGHT, status);
 
-	hci_result = hci_read(dev, HCI_TR_BACKLIGHT, &status);
-	*enabled = !status;
 	return hci_result == TOS_SUCCESS ? 0 : -EIO;
 }
 
-static int set_tr_backlight_status(struct toshiba_acpi_dev *dev, bool enable)
+static int set_tr_backlight_status(struct toshiba_acpi_dev *dev, u32 status)
 {
-	u32 hci_result;
-	u32 value = !enable;
+	u32 hci_result = hci_write(dev, HCI_TR_BACKLIGHT, !status);
 
-	hci_result = hci_write(dev, HCI_TR_BACKLIGHT, value);
 	return hci_result == TOS_SUCCESS ? 0 : -EIO;
 }
 
@@ -1213,12 +1208,11 @@ static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 	int brightness = 0;
 
 	if (dev->tr_backlight_supported) {
-		bool enabled;
-		int ret = get_tr_backlight_status(dev, &enabled);
+		int ret = get_tr_backlight_status(dev, &value);
 
 		if (ret)
 			return ret;
-		if (enabled)
+		if (value)
 			return 0;
 		brightness++;
 	}
@@ -1268,8 +1262,7 @@ static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
 	u32 hci_result;
 
 	if (dev->tr_backlight_supported) {
-		bool enable = !value;
-		int ret = set_tr_backlight_status(dev, enable);
+		int ret = set_tr_backlight_status(dev, !value);
 
 		if (ret)
 			return ret;
@@ -2496,7 +2489,6 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 	struct backlight_properties props;
 	int brightness;
 	int ret;
-	bool enabled;
 
 	/*
 	 * Some machines don't support the backlight methods at all, and
@@ -2513,10 +2505,6 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 		return 0;
 	}
 
-	/* Determine whether or not BIOS supports transflective backlight */
-	ret = get_tr_backlight_status(dev, &enabled);
-	dev->tr_backlight_supported = !ret;
-
 	/*
 	 * Tell acpi-video-detect code to prefer vendor backlight on all
 	 * systems with transflective backlight and on dmi matched systems.
@@ -2643,6 +2631,10 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	if (toshiba_acpi_setup_keyboard(dev))
 		pr_info("Unable to activate hotkeys\n");
 
+	/* Determine whether or not BIOS supports transflective backlight */
+	ret = get_tr_backlight_status(dev, &dummy);
+	dev->tr_backlight_supported = !ret;
+
 	ret = toshiba_acpi_setup_backlight(dev);
 	if (ret)
 		goto error;
-- 
2.4.3
