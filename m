From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 6/8] sony-laptop: cache handles and report them via sysfs
Date: Sat, 19 Feb 2011 11:52:30 +0900
Message-ID: <1298083952-22493-7-git-send-email-malattia@linux.it>
References: <1298083952-22493-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:60589
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753697Ab1BSDAR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Feb 2011 22:00:17 -0500
In-Reply-To: <1298083952-22493-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Avoid calling into acpi each time we need to lookup a method handle
and report the available handles to ease collection of information when
debugging issues. Also move initialization of the platform driver
earlier to allow adding files from other setup functions.

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   97 ++++++++++++++++++++++++++++++------
 1 files changed, 81 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 22519a4..1585d37 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -727,20 +727,79 @@ static int acpi_callsetfunc(acpi_handle handle, char *name, int value,
 	return -1;
 }
 
-static int sony_find_snc_handle(int handle)
+struct sony_nc_handles {
+	u16 cap[0x10];
+	struct device_attribute devattr;
+};
+
+struct sony_nc_handles *handles;
+
+static ssize_t sony_nc_handles_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t len = 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(handles->cap); i++) {
+		len += snprintf(buffer + len, PAGE_SIZE - len, "0x%.4x ",
+				handles->cap[i]);
+	}
+	len += snprintf(buffer + len, PAGE_SIZE - len, "\n");
+
+	return len;
+}
+
+static int sony_nc_handles_setup(struct platform_device *pd)
 {
 	int i;
 	int result;
 
-	for (i = 0x20; i < 0x30; i++) {
-		acpi_callsetfunc(sony_nc_acpi_handle, "SN00", i, &result);
-		if (result == handle) {
-			dprintk("found handle 0x%.4x (offset: 0x%.2x)\n",
-					handle, i - 0x20);
-			return i-0x20;
+	handles = kzalloc(sizeof(*handles), GFP_KERNEL);
+
+	sysfs_attr_init(handles->devattr);
+	handles->devattr.attr.name = "handles";
+	handles->devattr.attr.mode = S_IRUGO;
+	handles->devattr.show = sony_nc_handles_show;
+
+	for (i = 0; i < ARRAY_SIZE(handles->cap); i++) {
+		if (!acpi_callsetfunc(sony_nc_acpi_handle,
+					"SN00", i + 0x20, &result)) {
+			dprintk("caching handle 0x%.4x (offset: 0x%.2x)\n",
+					result, i);
+			handles->cap[i] = result;
 		}
 	}
 
+	/* allow reading capabilities via sysfs */
+	if (device_create_file(&pd->dev, &handles->devattr)) {
+		kfree(handles);
+		handles = NULL;
+		return -1;
+	}
+
+	return 0;
+}
+
+static int sony_nc_handles_cleanup(struct platform_device *pd)
+{
+	if (handles) {
+		device_remove_file(&pd->dev, &handles->devattr);
+		kfree(handles);
+		handles = NULL;
+	}
+	return 0;
+}
+
+static int sony_find_snc_handle(int handle)
+{
+	int i;
+	for (i = 0; i < 0x10; i++) {
+		if (handles->cap[i] == handle) {
+			dprintk("found handle 0x%.4x (offset: 0x%.2x)\n",
+					handle, i);
+			return i;
+		}
+	}
 	dprintk("handle 0x%.4x not found\n", handle);
 	return -1;
 }
@@ -1274,6 +1333,10 @@ static int sony_nc_add(struct acpi_device *device)
 		goto outwalk;
 	}
 
+	result = sony_pf_add();
+	if (result)
+		goto outpresent;
+
 	if (debug) {
 		status = acpi_walk_namespace(ACPI_TYPE_METHOD,
 				sony_nc_acpi_handle, 1, sony_walk_callback,
@@ -1281,7 +1344,7 @@ static int sony_nc_add(struct acpi_device *device)
 		if (ACPI_FAILURE(status)) {
 			pr_warn(DRV_PFX "unable to walk acpi resources\n");
 			result = -ENODEV;
-			goto outwalk;
+			goto outpresent;
 		}
 	}
 
@@ -1294,6 +1357,8 @@ static int sony_nc_add(struct acpi_device *device)
 	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "SN00",
 					 &handle))) {
 		dprintk("Doing SNC setup\n");
+		if (sony_nc_handles_setup(sony_pf_device))
+			goto outpresent;
 		sony_nc_function_setup(device);
 		sony_nc_rfkill_setup(device);
 	}
@@ -1302,7 +1367,7 @@ static int sony_nc_add(struct acpi_device *device)
 	result = sony_laptop_setup_input(device);
 	if (result) {
 		pr_err(DRV_PFX "Unable to create input devices.\n");
-		goto outwalk;
+		goto outsnc;
 	}
 
 	if (acpi_video_backlight_support()) {
@@ -1329,10 +1394,6 @@ static int sony_nc_add(struct acpi_device *device)
 
 	}
 
-	result = sony_pf_add();
-	if (result)
-		goto outbacklight;
-
 	/* create sony_pf sysfs attributes related to the SNC device */
 	for (item = sony_nc_values; item->name; ++item) {
 
@@ -1378,14 +1439,17 @@ static int sony_nc_add(struct acpi_device *device)
 	for (item = sony_nc_values; item->name; ++item) {
 		device_remove_file(&sony_pf_device->dev, &item->devattr);
 	}
-	sony_pf_remove();
-
-      outbacklight:
 	if (sony_backlight_device)
 		backlight_device_unregister(sony_backlight_device);
 
 	sony_laptop_remove_input();
 
+      outsnc:
+	sony_nc_handles_cleanup(sony_pf_device);
+
+      outpresent:
+	sony_pf_remove();
+
       outwalk:
 	sony_nc_rfkill_cleanup();
 	return result;
@@ -1404,6 +1468,7 @@ static int sony_nc_remove(struct acpi_device *device, int type)
 		device_remove_file(&sony_pf_device->dev, &item->devattr);
 	}
 
+	sony_nc_handles_cleanup(sony_pf_device);
 	sony_pf_remove();
 	sony_laptop_remove_input();
 	sony_nc_rfkill_cleanup();
-- 
1.7.2.3
