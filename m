From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 7/8] sony-laptop: implement keyboard backlight support
Date: Sat, 19 Feb 2011 11:52:31 +0900
Message-ID: <1298083952-22493-8-git-send-email-malattia@linux.it>
References: <1298083952-22493-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:60585
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753140Ab1BSDAQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Feb 2011 22:00:16 -0500
In-Reply-To: <1298083952-22493-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Recent Vaios have the opportunity to control the keyboard backlight via
ACPI calls to the SNC device.
Introduce two module parameters to control how keyboard backlight should
be set at module loading (default to on and with 10 seconds timeout).

Tested-by: Marco Chiappero <marco@absence.it>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |  176 +++++++++++++++++++++++++++++++++++-
 1 files changed, 175 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 1585d37..cff1b85 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -125,6 +125,19 @@ MODULE_PARM_DESC(minor,
 		 "default is -1 (automatic)");
 #endif
 
+static int kbd_backlight;	/* = 1 */
+module_param(kbd_backlight, int, 0444);
+MODULE_PARM_DESC(kbd_backlight,
+		 "set this to 0 to disable keyboard backlight, "
+		 "1 to enable it (default: 0)");
+
+static int kbd_backlight_timeout;	/* = 0 */
+module_param(kbd_backlight_timeout, int, 0444);
+MODULE_PARM_DESC(kbd_backlight_timeout,
+		 "set this to 0 to set the default 10 seconds timeout, "
+		 "1 for 30 seconds, 2 for 60 seconds and 3 to disable timeout "
+		 "(default: 0)");
+
 enum sony_nc_rfkill {
 	SONY_WIFI,
 	SONY_BLUETOOTH,
@@ -1309,6 +1322,161 @@ out_no_enum:
 	return;
 }
 
+/* Keyboard backlight feature */
+#define KBDBL_HANDLER	0x137
+#define KBDBL_PRESENT	0xB00
+#define	SET_MODE	0xC00
+#define SET_TIMEOUT	0xE00
+
+struct kbd_backlight {
+	int mode;
+	int timeout;
+	struct device_attribute mode_attr;
+	struct device_attribute timeout_attr;
+};
+
+struct kbd_backlight *kbdbl_handle;
+
+static ssize_t __sony_nc_kbd_backlight_mode_set(u8 value)
+{
+	int result;
+
+	if (value > 1)
+		return -EINVAL;
+
+	if (sony_call_snc_handle(KBDBL_HANDLER,
+				(value << 0x10) | SET_MODE, &result))
+		return -EIO;
+
+	kbdbl_handle->mode = value;
+
+	return 0;
+}
+
+static ssize_t sony_nc_kbd_backlight_mode_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	int ret = 0;
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+
+	if (strict_strtoul(buffer, 10, &value))
+		return -EINVAL;
+
+	ret = __sony_nc_kbd_backlight_mode_set(value);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t sony_nc_kbd_backlight_mode_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", kbdbl_handle->mode);
+	return count;
+}
+
+static int __sony_nc_kbd_backlight_timeout_set(u8 value)
+{
+	int result;
+
+	if (value > 3)
+		return -EINVAL;
+
+	if (sony_call_snc_handle(KBDBL_HANDLER,
+				(value << 0x10) | SET_TIMEOUT, &result))
+		return -EIO;
+
+	kbdbl_handle->timeout = value;
+
+	return 0;
+}
+
+static ssize_t sony_nc_kbd_backlight_timeout_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	int ret = 0;
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+
+	if (strict_strtoul(buffer, 10, &value))
+		return -EINVAL;
+
+	ret = __sony_nc_kbd_backlight_timeout_set(value);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t sony_nc_kbd_backlight_timeout_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", kbdbl_handle->timeout);
+	return count;
+}
+
+static int sony_nc_kbd_backlight_setup(struct platform_device *pd)
+{
+	int result;
+
+	if (sony_call_snc_handle(0x137, KBDBL_PRESENT, &result))
+		return 0;
+	if (!(result & 0x02))
+		return 0;
+
+	kbdbl_handle = kzalloc(sizeof(*kbdbl_handle), GFP_KERNEL);
+
+	sysfs_attr_init(kbdbl_handle->mode_attr);
+	kbdbl_handle->mode_attr.attr.name = "kbd_backlight";
+	kbdbl_handle->mode_attr.attr.mode = S_IRUGO | S_IWUSR;
+	kbdbl_handle->mode_attr.show = sony_nc_kbd_backlight_mode_show;
+	kbdbl_handle->mode_attr.store = sony_nc_kbd_backlight_mode_store;
+
+	sysfs_attr_init(kbdbl_handle->timeout_attr);
+	kbdbl_handle->timeout_attr.attr.name = "kbd_backlight_timeout";
+	kbdbl_handle->timeout_attr.attr.mode = S_IRUGO | S_IWUSR;
+	kbdbl_handle->timeout_attr.show = sony_nc_kbd_backlight_timeout_show;
+	kbdbl_handle->timeout_attr.store = sony_nc_kbd_backlight_timeout_store;
+
+	if (device_create_file(&pd->dev, &kbdbl_handle->mode_attr))
+		goto outkzalloc;
+
+	if (device_create_file(&pd->dev, &kbdbl_handle->timeout_attr))
+		goto outmode;
+
+	__sony_nc_kbd_backlight_mode_set(kbd_backlight);
+	__sony_nc_kbd_backlight_timeout_set(kbd_backlight_timeout);
+
+	return 0;
+
+outmode:
+	device_remove_file(&pd->dev, &kbdbl_handle->mode_attr);
+outkzalloc:
+	kfree(kbdbl_handle);
+	kbdbl_handle = NULL;
+	return -1;
+}
+
+static int sony_nc_kbd_backlight_cleanup(struct platform_device *pd)
+{
+	if (kbdbl_handle) {
+		device_remove_file(&pd->dev, &kbdbl_handle->mode_attr);
+		device_remove_file(&pd->dev, &kbdbl_handle->timeout_attr);
+		kfree(kbdbl_handle);
+	}
+	return 0;
+}
+
 static int sony_nc_add(struct acpi_device *device)
 {
 	acpi_status status;
@@ -1359,6 +1527,8 @@ static int sony_nc_add(struct acpi_device *device)
 		dprintk("Doing SNC setup\n");
 		if (sony_nc_handles_setup(sony_pf_device))
 			goto outpresent;
+		if (sony_nc_kbd_backlight_setup(sony_pf_device))
+			goto outsnc;
 		sony_nc_function_setup(device);
 		sony_nc_rfkill_setup(device);
 	}
@@ -1367,7 +1537,7 @@ static int sony_nc_add(struct acpi_device *device)
 	result = sony_laptop_setup_input(device);
 	if (result) {
 		pr_err(DRV_PFX "Unable to create input devices.\n");
-		goto outsnc;
+		goto outkbdbacklight;
 	}
 
 	if (acpi_video_backlight_support()) {
@@ -1444,6 +1614,9 @@ static int sony_nc_add(struct acpi_device *device)
 
 	sony_laptop_remove_input();
 
+      outkbdbacklight:
+	sony_nc_kbd_backlight_cleanup(sony_pf_device);
+
       outsnc:
 	sony_nc_handles_cleanup(sony_pf_device);
 
@@ -1468,6 +1641,7 @@ static int sony_nc_remove(struct acpi_device *device, int type)
 		device_remove_file(&sony_pf_device->dev, &item->devattr);
 	}
 
+	sony_nc_kbd_backlight_cleanup(sony_pf_device);
 	sony_nc_handles_cleanup(sony_pf_device);
 	sony_pf_remove();
 	sony_laptop_remove_input();
-- 
1.7.2.3
