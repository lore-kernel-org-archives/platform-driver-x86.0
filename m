From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 1/3] sony-laptop: keyboard backlight fixes
Date: Tue,  5 Apr 2011 23:38:34 +0900
Message-ID: <1302014316-1094-2-git-send-email-malattia@linux.it>
References: <1302014316-1094-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:43439 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752077Ab1DEOi6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Apr 2011 10:38:58 -0400
Received: by mail-iy0-f174.google.com with SMTP id 14so437551iyb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Apr 2011 07:38:58 -0700 (PDT)
In-Reply-To: <1302014316-1094-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>

From: Marco Chiappero <marco@absence.it>

Restore the original state on module removal, set the latest values on
resume.
When setting the keyboard backlight mode try to turn on/off backlight
immediately.

[malattia@linux.it: patch taken from a largely modified sony-laptop.c,
ported and slightly modified to use defines already available.]

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   35 ++++++++++++++++++++++++++++++++++-
 1 files changed, 34 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index e642f5f..77646fc 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -138,6 +138,8 @@ MODULE_PARM_DESC(kbd_backlight_timeout,
 		 "1 for 30 seconds, 2 for 60 seconds and 3 to disable timeout "
 		 "(default: 0)");
 
+static void sony_nc_kbd_backlight_resume(void);
+
 enum sony_nc_rfkill {
 	SONY_WIFI,
 	SONY_BLUETOOTH,
@@ -1168,6 +1170,9 @@ static int sony_nc_resume(struct acpi_device *device)
 	/* re-read rfkill state */
 	sony_nc_rfkill_update();
 
+	/* restore kbd backlight states */
+	sony_nc_kbd_backlight_resume();
+
 	return 0;
 }
 
@@ -1355,6 +1360,7 @@ out_no_enum:
 #define KBDBL_HANDLER	0x137
 #define KBDBL_PRESENT	0xB00
 #define	SET_MODE	0xC00
+#define SET_STATE	0xD00
 #define SET_TIMEOUT	0xE00
 
 struct kbd_backlight {
@@ -1377,6 +1383,10 @@ static ssize_t __sony_nc_kbd_backlight_mode_set(u8 value)
 				(value << 0x10) | SET_MODE, &result))
 		return -EIO;
 
+	/* Try to turn the light on/off immediately */
+	sony_call_snc_handle(KBDBL_HANDLER, (value << 0x10) | SET_STATE,
+			&result);
+
 	kbdbl_handle->mode = value;
 
 	return 0;
@@ -1458,7 +1468,7 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd)
 {
 	int result;
 
-	if (sony_call_snc_handle(0x137, KBDBL_PRESENT, &result))
+	if (sony_call_snc_handle(KBDBL_HANDLER, KBDBL_PRESENT, &result))
 		return 0;
 	if (!(result & 0x02))
 		return 0;
@@ -1501,13 +1511,36 @@ outkzalloc:
 static int sony_nc_kbd_backlight_cleanup(struct platform_device *pd)
 {
 	if (kbdbl_handle) {
+		int result;
+
 		device_remove_file(&pd->dev, &kbdbl_handle->mode_attr);
 		device_remove_file(&pd->dev, &kbdbl_handle->timeout_attr);
+
+		/* restore the default hw behaviour */
+		sony_call_snc_handle(KBDBL_HANDLER, 0x1000 | SET_MODE, &result);
+		sony_call_snc_handle(KBDBL_HANDLER, SET_TIMEOUT, &result);
+
 		kfree(kbdbl_handle);
 	}
 	return 0;
 }
 
+static void sony_nc_kbd_backlight_resume(void)
+{
+	int ignore = 0;
+
+	if (!kbdbl_handle)
+		return;
+
+	if (kbdbl_handle->mode == 0)
+		sony_call_snc_handle(KBDBL_HANDLER, SET_MODE, &ignore);
+
+	if (kbdbl_handle->timeout != 0)
+		sony_call_snc_handle(KBDBL_HANDLER,
+				(kbdbl_handle->timeout << 0x10) | SET_TIMEOUT,
+				&ignore);
+}
+
 static void sony_nc_backlight_setup(void)
 {
 	acpi_handle unused;
-- 
1.7.4.1
