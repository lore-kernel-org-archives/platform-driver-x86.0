From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 RESEND 11/14] sony-laptop: keyboard backlight support
 extended to newer Vaios
Date: Tue, 13 Sep 2011 22:53:50 +0200
Message-ID: <1315947230.14415.160.camel@air.vesuvio.absence.it>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:34041 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932446Ab1IMUxw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Sep 2011 16:53:52 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Added support for handle 0x0143 (Vaio SA/SB/SC, CA/CB) and improved the
keyboard backlight code, removing the struct "kbd_backlight" in favor of
"struct snc_kbdbl_device". Minor corrections are also included.


Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -127,7 +127,7 @@ MODULE_PARM_DESC(minor,
 		 "default is -1 (automatic)");
 #endif
 
-static int kbd_backlight;	/* = 1 */
+static int kbd_backlight;	/* = 0 */
 module_param(kbd_backlight, int, 0444);
 MODULE_PARM_DESC(kbd_backlight,
 		 "set this to 0 to disable keyboard backlight, "
@@ -140,7 +140,6 @@ MODULE_PARM_DESC(kbd_backlight_timeout,
 		 "1 for 30 seconds, 2 for 60 seconds and 3 to disable timeout "
 		 "(default: 0)");
 
-static void sony_nc_kbd_backlight_resume(void);
 
 enum sony_nc_rfkill {
 	SONY_WIFI,
@@ -1362,37 +1361,31 @@ static int sony_nc_rfkill_setup(struct a
 }
 
 /* Keyboard backlight feature */
-#define KBDBL_HANDLER	0x137
-#define KBDBL_PRESENT	0xB00
-#define	SET_MODE	0xC00
-#define SET_STATE	0xD00
-#define SET_TIMEOUT	0xE00
-
-struct kbd_backlight {
-	int mode;
-	int timeout;
+static struct snc_kbdbl_device {
+	unsigned int handle;
+	unsigned int base;
+	unsigned int mode;
+	unsigned int timeout;
 	struct device_attribute mode_attr;
 	struct device_attribute timeout_attr;
-};
-
-static struct kbd_backlight *kbdbl_handle;
+} *snc_kbdbl;
 
-static ssize_t __sony_nc_kbd_backlight_mode_set(u8 value)
+static int __sony_nc_kbd_backlight_mode_set(u8 value)
 {
 	unsigned int result;
 
 	if (value > 1)
 		return -EINVAL;
 
-	if (sony_call_snc_handle(KBDBL_HANDLER,
-				(value << 0x10) | SET_MODE, &result))
+	if (sony_call_snc_handle(snc_kbdbl->handle, (value << 0x10) |
+				(snc_kbdbl->base), &result))
 		return -EIO;
 
-	/* Try to turn the light on/off immediately */
-	sony_call_snc_handle(KBDBL_HANDLER, (value << 0x10) | SET_STATE,
-			&result);
+	snc_kbdbl->mode = value;
 
-	kbdbl_handle->mode = value;
+	/* Try to turn the light on/off immediately */
+	sony_call_snc_handle(snc_kbdbl->handle, (value << 0x10) |
+				(snc_kbdbl->base + 0x100), &result);
 
 	return 0;
 }
@@ -1421,7 +1414,9 @@ static ssize_t sony_nc_kbd_backlight_mod
 		struct device_attribute *attr, char *buffer)
 {
 	ssize_t count = 0;
-	count = snprintf(buffer, PAGE_SIZE, "%d\n", kbdbl_handle->mode);
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", snc_kbdbl->mode);
+
 	return count;
 }
 
@@ -1432,11 +1427,11 @@ static int __sony_nc_kbd_backlight_timeo
 	if (value > 3)
 		return -EINVAL;
 
-	if (sony_call_snc_handle(KBDBL_HANDLER,
-				(value << 0x10) | SET_TIMEOUT, &result))
+	if (sony_call_snc_handle(snc_kbdbl->handle, (value << 0x10) |
+				(snc_kbdbl->base + 0x200), &result))
 		return -EIO;
 
-	kbdbl_handle->timeout = value;
+	snc_kbdbl->timeout = value;
 
 	return 0;
 }
@@ -1465,85 +1460,111 @@ static ssize_t sony_nc_kbd_backlight_tim
 		struct device_attribute *attr, char *buffer)
 {
 	ssize_t count = 0;
-	count = snprintf(buffer, PAGE_SIZE, "%d\n", kbdbl_handle->timeout);
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", snc_kbdbl->timeout);
+
 	return count;
 }
 
-static int sony_nc_kbd_backlight_setup(struct platform_device *pd)
+static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
+					unsigned int handle)
 {
-	unsigned int result;
+	unsigned int result, base_cmd;
+	bool found = false;
 
-	if (sony_call_snc_handle(KBDBL_HANDLER, KBDBL_PRESENT, &result))
-		return 0;
-	if (!(result & 0x02))
+	/* verify the kbd backlight presence, some models do not have it */
+	if (handle == 0x0137) {
+		if (sony_call_snc_handle(handle, 0x0B00, &result))
+			return -EIO;
+
+		found = !!(result & 0x02);
+		base_cmd = 0x0C00;
+	} else {
+		if (sony_call_snc_handle(handle, 0x0100, &result))
+			return -EIO;
+
+		found = result & 0x01;
+		base_cmd = 0x4000;
+	}
+
+	if (!found) {
+		dprintk("no backlight keyboard found\n");
 		return 0;
+	}
 
-	kbdbl_handle = kzalloc(sizeof(*kbdbl_handle), GFP_KERNEL);
-	if (!kbdbl_handle)
+	snc_kbdbl = kzalloc(sizeof(*snc_kbdbl), GFP_KERNEL);
+	if (!snc_kbdbl)
 		return -ENOMEM;
 
-	sysfs_attr_init(&kbdbl_handle->mode_attr.attr);
-	kbdbl_handle->mode_attr.attr.name = "kbd_backlight";
-	kbdbl_handle->mode_attr.attr.mode = S_IRUGO | S_IWUSR;
-	kbdbl_handle->mode_attr.show = sony_nc_kbd_backlight_mode_show;
-	kbdbl_handle->mode_attr.store = sony_nc_kbd_backlight_mode_store;
-
-	sysfs_attr_init(&kbdbl_handle->timeout_attr.attr);
-	kbdbl_handle->timeout_attr.attr.name = "kbd_backlight_timeout";
-	kbdbl_handle->timeout_attr.attr.mode = S_IRUGO | S_IWUSR;
-	kbdbl_handle->timeout_attr.show = sony_nc_kbd_backlight_timeout_show;
-	kbdbl_handle->timeout_attr.store = sony_nc_kbd_backlight_timeout_store;
+	sysfs_attr_init(&snc_kbdbl->mode_attr.attr);
+	snc_kbdbl->mode_attr.attr.name = "kbd_backlight";
+	snc_kbdbl->mode_attr.attr.mode = S_IRUGO | S_IWUSR;
+	snc_kbdbl->mode_attr.show = sony_nc_kbd_backlight_mode_show;
+	snc_kbdbl->mode_attr.store = sony_nc_kbd_backlight_mode_store;
+
+	sysfs_attr_init(&snc_kbdbl->timeout_attr.attr);
+	snc_kbdbl->timeout_attr.attr.name = "kbd_backlight_timeout";
+	snc_kbdbl->timeout_attr.attr.mode = S_IRUGO | S_IWUSR;
+	snc_kbdbl->timeout_attr.show = sony_nc_kbd_backlight_timeout_show;
+	snc_kbdbl->timeout_attr.store = sony_nc_kbd_backlight_timeout_store;
 
-	if (device_create_file(&pd->dev, &kbdbl_handle->mode_attr))
+	if (device_create_file(&pd->dev, &snc_kbdbl->mode_attr))
 		goto outkzalloc;
 
-	if (device_create_file(&pd->dev, &kbdbl_handle->timeout_attr))
+	if (device_create_file(&pd->dev, &snc_kbdbl->timeout_attr))
 		goto outmode;
 
+	snc_kbdbl->handle = handle;
+	snc_kbdbl->base = base_cmd;
+
 	__sony_nc_kbd_backlight_mode_set(kbd_backlight);
 	__sony_nc_kbd_backlight_timeout_set(kbd_backlight_timeout);
 
 	return 0;
 
 outmode:
-	device_remove_file(&pd->dev, &kbdbl_handle->mode_attr);
+	device_remove_file(&pd->dev, &snc_kbdbl->mode_attr);
 outkzalloc:
-	kfree(kbdbl_handle);
-	kbdbl_handle = NULL;
+	kfree(snc_kbdbl);
+	snc_kbdbl = NULL;
 	return -1;
 }
 
 static int sony_nc_kbd_backlight_cleanup(struct platform_device *pd)
 {
-	if (kbdbl_handle) {
+	if (snc_kbdbl) {
 		unsigned int result;
 
-		device_remove_file(&pd->dev, &kbdbl_handle->mode_attr);
-		device_remove_file(&pd->dev, &kbdbl_handle->timeout_attr);
+		device_remove_file(&pd->dev, &snc_kbdbl->mode_attr);
+		device_remove_file(&pd->dev, &snc_kbdbl->timeout_attr);
 
 		/* restore the default hw behaviour */
-		sony_call_snc_handle(KBDBL_HANDLER, 0x1000 | SET_MODE, &result);
-		sony_call_snc_handle(KBDBL_HANDLER, SET_TIMEOUT, &result);
+		sony_call_snc_handle(snc_kbdbl->handle,
+				snc_kbdbl->base | 0x10000, &result);
+		sony_call_snc_handle(snc_kbdbl->handle,
+				snc_kbdbl->base + 0x200, &result);
 
-		kfree(kbdbl_handle);
+		kfree(snc_kbdbl);
+		snc_kbdbl = NULL;
 	}
 	return 0;
 }
 
 static void sony_nc_kbd_backlight_resume(void)
 {
-	unsigned int ignore = 0;
+	unsigned int result;
 
-	if (!kbdbl_handle)
+	if (!snc_kbdbl)
 		return;
 
-	if (kbdbl_handle->mode == 0)
-		sony_call_snc_handle(KBDBL_HANDLER, SET_MODE, &ignore);
-
-	if (kbdbl_handle->timeout != 0)
-		sony_call_snc_handle(KBDBL_HANDLER,
-				(kbdbl_handle->timeout << 0x10) | SET_TIMEOUT,
-				&ignore);
+	if (snc_kbdbl->mode == 0)
+		sony_call_snc_handle(snc_kbdbl->handle,
+				snc_kbdbl->base, &result);
+
+	if (snc_kbdbl->timeout != 0)
+		sony_call_snc_handle(snc_kbdbl->handle,
+				(snc_kbdbl->base + 0x200) |
+				(snc_kbdbl->timeout << 0x10), &result);
 }
 
 static void sony_nc_backlight_ng_read_limits(unsigned int handle,
@@ -1692,7 +1713,8 @@ static int sony_nc_handles_setup(struct 
 			ret = sony_nc_function_setup(handle);
 			break;
 		case 0x0137:
-			ret = sony_nc_kbd_backlight_setup(pd);
+		case 0x0143:
+			ret = sony_nc_kbd_backlight_setup(pd, handle);
 		case 0x0124:
 		case 0x0135:
 			ret = sony_nc_rfkill_setup(sony_nc_acpi_device);
@@ -1737,6 +1759,7 @@ static int sony_nc_handles_cleanup(struc
 
 		switch (handle) {
 		case 0x0137:
+		case 0x0143:
 			sony_nc_kbd_backlight_cleanup(pd);
 		case 0x0124:
 		case 0x0135:
@@ -1783,6 +1806,7 @@ static int sony_nc_handles_resume(void)
 			sony_nc_function_setup(handle);
 			break;
 		case 0x0137: /* kbd + als */
+		case 0x0143:
 			sony_nc_kbd_backlight_resume();
 			break;
 		case 0x0124:
