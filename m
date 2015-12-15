From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH] Keyboard backlight control for some Vaio Fit models
Date: Mon, 14 Dec 2015 21:12:32 -0800
Message-ID: <1450156352-16240-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:34212 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750943AbbLOFMz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 15 Dec 2015 00:12:55 -0500
Received: by pacwq6 with SMTP id wq6so115986895pac.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Dec 2015 21:12:54 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>, Dominik Matta <dominik@matta.sk>

SVF1521P6EW, SVF1521DCXW, SVF13N1L2ES and likely most SVF*.
do not expose separate timeout controls in auto mode.

Signed-off-by: Dominik Matta <dominik@matta.sk>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 65 ++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index f73c295..e9caa34 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1393,6 +1393,7 @@ static void sony_nc_function_setup(struct acpi_device *device,
 		case 0x0143:
 		case 0x014b:
 		case 0x014c:
+		case 0x0153:
 		case 0x0163:
 			result = sony_nc_kbd_backlight_setup(pf_device, handle);
 			if (result)
@@ -1490,6 +1491,7 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x0143:
 		case 0x014b:
 		case 0x014c:
+		case 0x0153:
 		case 0x0163:
 			sony_nc_kbd_backlight_cleanup(pd, handle);
 			break;
@@ -1773,6 +1775,7 @@ struct kbd_backlight {
 	unsigned int base;
 	unsigned int mode;
 	unsigned int timeout;
+	unsigned int has_timeout;
 	struct device_attribute mode_attr;
 	struct device_attribute timeout_attr;
 };
@@ -1877,6 +1880,8 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
 		unsigned int handle)
 {
 	int result;
+	int probe_base = 0;
+	int ctl_base = 0;
 	int ret = 0;
 
 	if (kbdbl_ctl) {
@@ -1885,11 +1890,25 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
 		return -EBUSY;
 	}
 
-	/* verify the kbd backlight presence, these handles are not used for
-	 * keyboard backlight only
+	/* verify the kbd backlight presence, some of these handles are not used
+	 * for keyboard backlight only
 	 */
-	ret = sony_call_snc_handle(handle, handle == 0x0137 ? 0x0B00 : 0x0100,
-			&result);
+	switch (handle) {
+	case 0x0153:
+		probe_base = 0x0;
+		ctl_base = 0x0;
+		break;
+	case 0x0137:
+		probe_base = 0x0B00;
+		ctl_base = 0x0C00;
+		break;
+	default:
+		probe_base = 0x0100;
+		ctl_base = 0x4000;
+		break;
+	}
+
+	ret = sony_call_snc_handle(handle, probe_base, &result);
 	if (ret)
 		return ret;
 
@@ -1906,10 +1925,9 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
 	kbdbl_ctl->mode = kbd_backlight;
 	kbdbl_ctl->timeout = kbd_backlight_timeout;
 	kbdbl_ctl->handle = handle;
-	if (handle == 0x0137)
-		kbdbl_ctl->base = 0x0C00;
-	else
-		kbdbl_ctl->base = 0x4000;
+	kbdbl_ctl->base = ctl_base;
+	/* Some models do not allow timeout control */
+	kbdbl_ctl->has_timeout = handle != 0x0153;
 
 	sysfs_attr_init(&kbdbl_ctl->mode_attr.attr);
 	kbdbl_ctl->mode_attr.attr.name = "kbd_backlight";
@@ -1917,22 +1935,28 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
 	kbdbl_ctl->mode_attr.show = sony_nc_kbd_backlight_mode_show;
 	kbdbl_ctl->mode_attr.store = sony_nc_kbd_backlight_mode_store;
 
-	sysfs_attr_init(&kbdbl_ctl->timeout_attr.attr);
-	kbdbl_ctl->timeout_attr.attr.name = "kbd_backlight_timeout";
-	kbdbl_ctl->timeout_attr.attr.mode = S_IRUGO | S_IWUSR;
-	kbdbl_ctl->timeout_attr.show = sony_nc_kbd_backlight_timeout_show;
-	kbdbl_ctl->timeout_attr.store = sony_nc_kbd_backlight_timeout_store;
-
 	ret = device_create_file(&pd->dev, &kbdbl_ctl->mode_attr);
 	if (ret)
 		goto outkzalloc;
 
-	ret = device_create_file(&pd->dev, &kbdbl_ctl->timeout_attr);
-	if (ret)
-		goto outmode;
-
 	__sony_nc_kbd_backlight_mode_set(kbdbl_ctl->mode);
-	__sony_nc_kbd_backlight_timeout_set(kbdbl_ctl->timeout);
+
+	if (kbdbl_ctl->has_timeout) {
+		sysfs_attr_init(&kbdbl_ctl->timeout_attr.attr);
+		kbdbl_ctl->timeout_attr.attr.name = "kbd_backlight_timeout";
+		kbdbl_ctl->timeout_attr.attr.mode = S_IRUGO | S_IWUSR;
+		kbdbl_ctl->timeout_attr.show =
+			sony_nc_kbd_backlight_timeout_show;
+		kbdbl_ctl->timeout_attr.store =
+			sony_nc_kbd_backlight_timeout_store;
+
+		ret = device_create_file(&pd->dev, &kbdbl_ctl->timeout_attr);
+		if (ret)
+			goto outmode;
+
+		__sony_nc_kbd_backlight_timeout_set(kbdbl_ctl->timeout);
+	}
+
 
 	return 0;
 
@@ -1949,7 +1973,8 @@ static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd,
 {
 	if (kbdbl_ctl && handle == kbdbl_ctl->handle) {
 		device_remove_file(&pd->dev, &kbdbl_ctl->mode_attr);
-		device_remove_file(&pd->dev, &kbdbl_ctl->timeout_attr);
+		if (kbdbl_ctl->has_timeout)
+			device_remove_file(&pd->dev, &kbdbl_ctl->timeout_attr);
 		kfree(kbdbl_ctl);
 		kbdbl_ctl = NULL;
 	}
-- 
2.6.4
