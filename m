From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 13/19] sony-laptop: new keyboard backlight handle
Date: Sat, 19 May 2012 22:35:56 +0900
Message-ID: <1337434562-12283-14-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47658 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758747Ab2ESNpQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:16 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>

From: Marco Chiappero <marco@absence.it>

Add support for handle 0x0143 (Vaio SA/SB/SC, CA/CB) and rework the code
to be hable to support different handles for the keyboard backlight
function.

[malattia@linux.it: group function specific variables in a struct]

Signed-off-by: Marco Chiappero <marco@absence.it>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |  149 +++++++++++++++++++++---------------
 1 file changed, 87 insertions(+), 62 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index f4dfdb0..f2d296a 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -141,8 +141,9 @@ MODULE_PARM_DESC(kbd_backlight_timeout,
 		 "(default: 0)");
 
 static void sony_nc_kbd_backlight_resume(void);
-static void sony_nc_kbd_backlight_setup(struct platform_device *pd);
-static int sony_nc_kbd_backlight_cleanup(struct platform_device *pd);
+static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
+		unsigned int handle);
+static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd);
 
 static int sony_nc_battery_care_setup(struct platform_device *pd,
 		unsigned int handle);
@@ -1339,7 +1340,11 @@ static void sony_nc_function_setup(struct acpi_device *device,
 			sony_nc_rfkill_setup(device);
 			break;
 		case 0x0137:
-			sony_nc_kbd_backlight_setup(pf_device);
+		case 0x0143:
+			result = sony_nc_kbd_backlight_setup(pf_device, handle);
+			if (result)
+				pr_err("couldn't set up keyboard backlight function (%d)\n",
+						result);
 			break;
 		default:
 			continue;
@@ -1393,6 +1398,7 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 			sony_nc_rfkill_cleanup();
 			break;
 		case 0x0137:
+		case 0x0143:
 			sony_nc_kbd_backlight_cleanup(pd);
 			break;
 		default:
@@ -1435,6 +1441,7 @@ static void sony_nc_function_resume(void)
 			sony_nc_rfkill_update();
 			break;
 		case 0x0137:
+		case 0x0143:
 			sony_nc_kbd_backlight_resume();
 			break;
 		default:
@@ -1646,20 +1653,16 @@ static void sony_nc_rfkill_setup(struct acpi_device *device)
 }
 
 /* Keyboard backlight feature */
-#define KBDBL_HANDLER	0x137
-#define KBDBL_PRESENT	0xB00
-#define	SET_MODE	0xC00
-#define SET_STATE	0xD00
-#define SET_TIMEOUT	0xE00
-
 struct kbd_backlight {
-	int mode;
-	int timeout;
+	unsigned int handle;
+	unsigned int base;
+	unsigned int mode;
+	unsigned int timeout;
 	struct device_attribute mode_attr;
 	struct device_attribute timeout_attr;
 };
 
-static struct kbd_backlight *kbdbl_handle;
+static struct kbd_backlight *kbdbl_ctl;
 
 static ssize_t __sony_nc_kbd_backlight_mode_set(u8 value)
 {
@@ -1668,15 +1671,15 @@ static ssize_t __sony_nc_kbd_backlight_mode_set(u8 value)
 	if (value > 1)
 		return -EINVAL;
 
-	if (sony_call_snc_handle(KBDBL_HANDLER,
-				(value << 0x10) | SET_MODE, &result))
+	if (sony_call_snc_handle(kbdbl_ctl->handle,
+				(value << 0x10) | (kbdbl_ctl->base), &result))
 		return -EIO;
 
 	/* Try to turn the light on/off immediately */
-	sony_call_snc_handle(KBDBL_HANDLER, (value << 0x10) | SET_STATE,
-			&result);
+	sony_call_snc_handle(kbdbl_ctl->handle,
+			(value << 0x10) | (kbdbl_ctl->base + 0x100), &result);
 
-	kbdbl_handle->mode = value;
+	kbdbl_ctl->mode = value;
 
 	return 0;
 }
@@ -1705,7 +1708,7 @@ static ssize_t sony_nc_kbd_backlight_mode_show(struct device *dev,
 		struct device_attribute *attr, char *buffer)
 {
 	ssize_t count = 0;
-	count = snprintf(buffer, PAGE_SIZE, "%d\n", kbdbl_handle->mode);
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", kbdbl_ctl->mode);
 	return count;
 }
 
@@ -1716,11 +1719,11 @@ static int __sony_nc_kbd_backlight_timeout_set(u8 value)
 	if (value > 3)
 		return -EINVAL;
 
-	if (sony_call_snc_handle(KBDBL_HANDLER,
-				(value << 0x10) | SET_TIMEOUT, &result))
+	if (sony_call_snc_handle(kbdbl_ctl->handle, (value << 0x10) |
+				(kbdbl_ctl->base + 0x200), &result))
 		return -EIO;
 
-	kbdbl_handle->timeout = value;
+	kbdbl_ctl->timeout = value;
 
 	return 0;
 }
@@ -1749,85 +1752,107 @@ static ssize_t sony_nc_kbd_backlight_timeout_show(struct device *dev,
 		struct device_attribute *attr, char *buffer)
 {
 	ssize_t count = 0;
-	count = snprintf(buffer, PAGE_SIZE, "%d\n", kbdbl_handle->timeout);
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", kbdbl_ctl->timeout);
 	return count;
 }
 
-static void sony_nc_kbd_backlight_setup(struct platform_device *pd)
+static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
+		unsigned int handle)
 {
 	int result;
+	int ret = 0;
 
-	if (sony_call_snc_handle(KBDBL_HANDLER, KBDBL_PRESENT, &result))
-		return;
-	if (!(result & 0x02))
-		return;
+	/* verify the kbd backlight presence, these handles are not used for
+	 * keyboard backlight only
+	 */
+	ret = sony_call_snc_handle(handle, handle == 0x0137 ? 0x0B00 : 0x0100,
+			&result);
+	if (ret)
+		return ret;
 
-	kbdbl_handle = kzalloc(sizeof(*kbdbl_handle), GFP_KERNEL);
-	if (!kbdbl_handle)
-		return;
+	if ((handle == 0x0137 && !(result & 0x02)) ||
+			!(result & 0x01)) {
+		dprintk("no backlight keyboard found\n");
+		return 0;
+	}
+
+	kbdbl_ctl = kzalloc(sizeof(*kbdbl_ctl), GFP_KERNEL);
+	if (!kbdbl_ctl)
+		return -ENOMEM;
+
+	kbdbl_ctl->handle = handle;
+	if (handle == 0x0137)
+		kbdbl_ctl->base = 0x0C00;
+	else
+		kbdbl_ctl->base = 0x4000;
 
-	sysfs_attr_init(&kbdbl_handle->mode_attr.attr);
-	kbdbl_handle->mode_attr.attr.name = "kbd_backlight";
-	kbdbl_handle->mode_attr.attr.mode = S_IRUGO | S_IWUSR;
-	kbdbl_handle->mode_attr.show = sony_nc_kbd_backlight_mode_show;
-	kbdbl_handle->mode_attr.store = sony_nc_kbd_backlight_mode_store;
+	sysfs_attr_init(&kbdbl_ctl->mode_attr.attr);
+	kbdbl_ctl->mode_attr.attr.name = "kbd_backlight";
+	kbdbl_ctl->mode_attr.attr.mode = S_IRUGO | S_IWUSR;
+	kbdbl_ctl->mode_attr.show = sony_nc_kbd_backlight_mode_show;
+	kbdbl_ctl->mode_attr.store = sony_nc_kbd_backlight_mode_store;
 
-	sysfs_attr_init(&kbdbl_handle->timeout_attr.attr);
-	kbdbl_handle->timeout_attr.attr.name = "kbd_backlight_timeout";
-	kbdbl_handle->timeout_attr.attr.mode = S_IRUGO | S_IWUSR;
-	kbdbl_handle->timeout_attr.show = sony_nc_kbd_backlight_timeout_show;
-	kbdbl_handle->timeout_attr.store = sony_nc_kbd_backlight_timeout_store;
+	sysfs_attr_init(&kbdbl_ctl->timeout_attr.attr);
+	kbdbl_ctl->timeout_attr.attr.name = "kbd_backlight_timeout";
+	kbdbl_ctl->timeout_attr.attr.mode = S_IRUGO | S_IWUSR;
+	kbdbl_ctl->timeout_attr.show = sony_nc_kbd_backlight_timeout_show;
+	kbdbl_ctl->timeout_attr.store = sony_nc_kbd_backlight_timeout_store;
 
-	if (device_create_file(&pd->dev, &kbdbl_handle->mode_attr))
+	ret = device_create_file(&pd->dev, &kbdbl_ctl->mode_attr);
+	if (ret)
 		goto outkzalloc;
 
-	if (device_create_file(&pd->dev, &kbdbl_handle->timeout_attr))
+	ret = device_create_file(&pd->dev, &kbdbl_ctl->timeout_attr);
+	if (ret)
 		goto outmode;
 
 	__sony_nc_kbd_backlight_mode_set(kbd_backlight);
 	__sony_nc_kbd_backlight_timeout_set(kbd_backlight_timeout);
 
-	return;
+	return 0;
 
 outmode:
-	device_remove_file(&pd->dev, &kbdbl_handle->mode_attr);
+	device_remove_file(&pd->dev, &kbdbl_ctl->mode_attr);
 outkzalloc:
-	kfree(kbdbl_handle);
-	kbdbl_handle = NULL;
-	return;
+	kfree(kbdbl_ctl);
+	kbdbl_ctl = NULL;
+	return ret;
 }
 
-static int sony_nc_kbd_backlight_cleanup(struct platform_device *pd)
+static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd)
 {
-	if (kbdbl_handle) {
+	if (kbdbl_ctl) {
 		int result;
 
-		device_remove_file(&pd->dev, &kbdbl_handle->mode_attr);
-		device_remove_file(&pd->dev, &kbdbl_handle->timeout_attr);
+		device_remove_file(&pd->dev, &kbdbl_ctl->mode_attr);
+		device_remove_file(&pd->dev, &kbdbl_ctl->timeout_attr);
 
 		/* restore the default hw behaviour */
-		sony_call_snc_handle(KBDBL_HANDLER, 0x1000 | SET_MODE, &result);
-		sony_call_snc_handle(KBDBL_HANDLER, SET_TIMEOUT, &result);
+		sony_call_snc_handle(kbdbl_ctl->handle,
+				kbdbl_ctl->base | 0x10000, &result);
+		sony_call_snc_handle(kbdbl_ctl->handle,
+				kbdbl_ctl->base + 0x200, &result);
 
-		kfree(kbdbl_handle);
+		kfree(kbdbl_ctl);
+		kbdbl_ctl = NULL;
 	}
-	return 0;
 }
 
 static void sony_nc_kbd_backlight_resume(void)
 {
 	int ignore = 0;
 
-	if (!kbdbl_handle)
+	if (!kbdbl_ctl)
 		return;
 
-	if (kbdbl_handle->mode == 0)
-		sony_call_snc_handle(KBDBL_HANDLER, SET_MODE, &ignore);
-
-	if (kbdbl_handle->timeout != 0)
-		sony_call_snc_handle(KBDBL_HANDLER,
-				(kbdbl_handle->timeout << 0x10) | SET_TIMEOUT,
+	if (kbdbl_ctl->mode == 0)
+		sony_call_snc_handle(kbdbl_ctl->handle, kbdbl_ctl->base,
 				&ignore);
+
+	if (kbdbl_ctl->timeout != 0)
+		sony_call_snc_handle(kbdbl_ctl->handle,
+				(kbdbl_ctl->base + 0x200) |
+				(kbdbl_ctl->timeout << 0x10), &ignore);
 }
 
 struct battery_care_control {
-- 
1.7.10
