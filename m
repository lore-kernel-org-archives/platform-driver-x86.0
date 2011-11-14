From: Niv Sardi <xaiki@debian.org>
Subject: [PATCH] toshiba_acpi: backlight broken after resume.
Date: Sun, 13 Nov 2011 20:17:47 -0430
Message-ID: <87aa7z4jik.fsf@ischigualasto.evilgiggle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:37374 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751929Ab1KNAss (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 13 Nov 2011 19:48:48 -0500
Received: by vws1 with SMTP id 1so4702302vws.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Nov 2011 16:48:47 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, 599768@bugs.debian.org

--=-=-=
Content-Type: text/plain


Hi,

this was first sent to debian as bug 599768, but Ben Hutchings
recommended sending it to you guys too.

anyway, the drill: backlight on my R800 laptop works fine until I
suspend it, then, /sys/class/backlight/* doesn't change anything
anymore.

This patch is taken from the old toshset tool (that. btw.  seems to
document a few HCI commands we're not using in the toshiba_acpi code,
maybe interesting to have a look), and the important part is the code
that sets HCI_LCD_BRIGHTNESS in set_lcd.

after this patch, backlight works through
/sys/class/backlight/toshiba/brightness but for some reason the keys
(that are still detected) don't trigger any backlight change (or call of
set_lcd), ... and I really don't know how to debug that. (they still get
to me in the .notify callback, but I fail to find documentation on the
link between that and get_lcd...

(do I need to call backlight_device_register() or something along the
lines of the sparse_keymap code on resume ?)

anyway, I understand this patch is nowhere near ready for inclusion, but
I send it in order to see if it gives someone a clue to fix this
longstanding issue with toshiba backlights.

thanks,


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
 filename=0002-toshiba_acpi-implement-and-use-HCI_BACKLIGHT.patch

From 16cdcbb36dafb4c01cb040284f6424d13e94cce3 Mon Sep 17 00:00:00 2001
From: Niv Sardi <xaiki@evilgiggle.com>
Date: Sun, 13 Nov 2011 19:28:05 -0430
Subject: [PATCH 2/2] toshiba_acpi: implement and use HCI_BACKLIGHT,

this is mostly taken from the old toshset code, it seems to partially
fix the bug where toshiba backlight is broken after suspend. (getting:
ACPI: can't set backlight, in dmesg.)

this makes /sys/class/backlight/toshiba/brightness work but for some
reason after suspend the events are still recieved (they get printed
out on the .notify handler), but they don't trigger backlight
code. (result beeing that the backlight keys DO NOT work but, setting
/sys/class/backlight/toshiba/brightness DOES).

this is hackish and needs clean up, but does solve part of the issue.

Signed-off-by: Niv Sardi <xaiki@evilgiggle.com>
---
 drivers/platform/x86/toshiba_acpi.c |   28 +++++++++++++++++++++++++---
 1 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 00e9e91..45a94b9 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -94,7 +94,10 @@ MODULE_LICENSE("GPL");
 #define HCI_EMPTY			0x8c00
 
 /* registers */
+#define	HCI_BACKLIGHT       		0x0002
+#define	HCI_AC_ADAPTOR      		0x0003
 #define HCI_FAN				0x0004
+#define	HCI_TR_BACKLIGHT       		0x0005
 #define HCI_SYSTEM_EVENT		0x0016
 #define HCI_VIDEO_OUT			0x001c
 #define HCI_HOTKEY_EVENT		0x001e
@@ -548,11 +551,17 @@ static int lcd_proc_open(struct inode *inode, struct file *file)
 
 static int set_lcd(struct toshiba_acpi_dev *dev, int value)
 {
-	u32 hci_result;
+	u32 r1, r2, val;
 
 	value = value << HCI_LCD_BRIGHTNESS_SHIFT;
-	hci_write1(dev, HCI_LCD_BRIGHTNESS, value, &hci_result);
-	return hci_result == HCI_SUCCESS ? 0 : -EIO;
+	hci_write1(dev, HCI_LCD_BRIGHTNESS, value, &r1);
+	if (ACPI_FAILURE(hci_read1(dev, HCI_BACKLIGHT, &val, &r2)))
+		pr_warn("Failed to enable backlight\n");
+	pr_debug("restoring backlight, state: %d\n", val);
+	if (ACPI_FAILURE(hci_write1(dev, HCI_BACKLIGHT, 0x1, &r2)))
+		pr_warn("Failed to enable backlight\n");
+
+	return ((r1 == r2) && (r1  == HCI_SUCCESS)) ? 0 : -EIO;
 }
 
 static int set_lcd_status(struct backlight_device *bd)
@@ -1105,6 +1114,13 @@ static int __devinit toshiba_acpi_add(struct acpi_device *acpi_dev)
 
 	/* enable event fifo */
 	hci_write1(dev, HCI_SYSTEM_EVENT, 1, &hci_result);
+	hci_write1(dev, HCI_HOTKEY_EVENT, 0x9, &hci_result);
+
+	if (ACPI_FAILURE(hci_read1(dev, HCI_BACKLIGHT, &dummy, &hci_result)))
+		pr_warn("Failed to enable backlight\n");
+	pr_debug("restoring backlight, state: %d\n", dummy);
+	if (ACPI_FAILURE(hci_write1(dev, HCI_BACKLIGHT, 1, &hci_result)))
+		pr_warn("Failed to enable backlight\n");
 
 	props.type = BACKLIGHT_PLATFORM;
 	props.max_brightness = HCI_LCD_BRIGHTNESS_LEVELS - 1;
@@ -1208,6 +1224,12 @@ static int toshiba_acpi_resume(struct acpi_device *acpi_dev)
 	if (ACPI_FAILURE(hci_write1(dev, HCI_HOTKEY_EVENT, 0x9, &result)))
 		pr_warn("Failed to enable hotkey events\n");
 
+	if (ACPI_FAILURE(hci_read1(dev, HCI_BACKLIGHT, &val, &result)))
+		pr_warn("Failed to enable backlight\n");
+	pr_debug("restoring backlight, state: %d\n", val);
+	if (ACPI_FAILURE(hci_write1(dev, HCI_BACKLIGHT, 0x1, &result)))
+		pr_warn("Failed to enable backlight\n");
+
 	return 0;
 }
 
-- 
1.7.8.rc0


--=-=-=
Content-Type: text/plain


-- 
Niv Sardi

--=-=-=--
