From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] toshiba_acpi: fix and cleanup toshiba_kbd_bl_mode_store()
Date: Wed, 3 Sep 2014 14:44:37 +0300
Message-ID: <20140903114437.GA3359@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:38525 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755893AbaICLo5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 3 Sep 2014 07:44:57 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

The current code just returns -EINVAL because mode can't be equal to
both 1 and 2.

Also this function is messy so I have cleaned it up:
1) Remove initializers like "int time = -1".  Initializing variables to
   garbage values turns off GCC's uninitialized variable warnings so it
   can lead to bugs.
2) Use kstrtoint() instead of sscanf().
3) Use SCI_KBD_MODE_FNZ and SCI_KBD_MODE_AUTO instead of magic numbers 1
   and 2.
4) Don't check for "mode == -1" because that can't happen.
5) Preserve the error code from toshiba_kbd_illum_status_set().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index e4da61b..bd76f3e 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1255,10 +1255,14 @@ static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
 					 const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
-	int mode = -1;
-	int time = -1;
+	int mode;
+	int time;
+	int ret;
 
-	if (sscanf(buf, "%i", &mode) != 1  || (mode != 2 || mode != 1))
+	ret = kstrtoint(buf, 0, &mode);
+	if (ret)
+		return ret;
+	if (mode != SCI_KBD_MODE_FNZ && mode != SCI_KBD_MODE_AUTO)
 		return -EINVAL;
 
 	/* Set the Keyboard Backlight Mode where:
@@ -1266,11 +1270,12 @@ static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
 	 *	Auto - KBD backlight turns off automatically in given time
 	 *	FN-Z - KBD backlight "toggles" when hotkey pressed
 	 */
-	if (mode != -1 && toshiba->kbd_mode != mode) {
+	if (toshiba->kbd_mode != mode) {
 		time = toshiba->kbd_time << HCI_MISC_SHIFT;
 		time = time + toshiba->kbd_mode;
-		if (toshiba_kbd_illum_status_set(toshiba, time) < 0)
-			return -EIO;
+		ret = toshiba_kbd_illum_status_set(toshiba, time);
+		if (ret)
+			return ret;
 		toshiba->kbd_mode = mode;
 	}
 
