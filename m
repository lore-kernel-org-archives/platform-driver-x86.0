From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 RESEND 5/14] sony-laptop: new SNC setup and cleanup
 functions
Date: Tue, 13 Sep 2011 22:46:00 +0200
Message-ID: <1315946760.14415.130.camel@air.vesuvio.absence.it>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:38227 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756140Ab1IMUqD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Sep 2011 16:46:03 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

New SNC handles setup and cleanup functions, sony_nc_handles_setup and
sony_nc_handles_cleanup. They avoid eccessive tainting of sony_nc_add
and sony_nc_remove, with cleaner and easier to read code, better event
initialization and better error handling. Due to name collision, the
previously defined functions related to the handle list has been renamed
sony_nc_handles_list_setup and sony_nc_handles_list_show.


Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -810,14 +810,14 @@ error:
 	return length;
 }
 
-struct sony_nc_handles {
+struct sony_nc_handles_list {
 	u16 cap[0x10];
 	struct device_attribute devattr;
 };
 
-static struct sony_nc_handles *handles;
+static struct sony_nc_handles_list *handles;
 
-static ssize_t sony_nc_handles_show(struct device *dev,
+static ssize_t sony_nc_handles_list_show(struct device *dev,
 		struct device_attribute *attr, char *buffer)
 {
 	ssize_t len = 0;
@@ -832,7 +832,7 @@ static ssize_t sony_nc_handles_show(stru
 	return len;
 }
 
-static int sony_nc_handles_setup(struct platform_device *pd)
+static int sony_nc_handles_list_setup(struct platform_device *pd)
 {
 	unsigned int i, result;
 
@@ -853,7 +853,7 @@ static int sony_nc_handles_setup(struct 
 		sysfs_attr_init(&handles->devattr.attr);
 		handles->devattr.attr.name = "handles";
 		handles->devattr.attr.mode = S_IRUGO;
-		handles->devattr.show = sony_nc_handles_show;
+		handles->devattr.show = sony_nc_handles_list_show;
 
 		/* allow reading capabilities via sysfs */
 		if (device_create_file(&pd->dev, &handles->devattr)) {
@@ -866,7 +866,7 @@ static int sony_nc_handles_setup(struct 
 	return 0;
 }
 
-static int sony_nc_handles_cleanup(struct platform_device *pd)
+static int sony_nc_handles_list_cleanup(struct platform_device *pd)
 {
 	if (handles) {
 		if (debug)
@@ -1736,6 +1736,94 @@ static void sony_nc_backlight_cleanup(vo
 		backlight_device_unregister(sony_bl_props.dev);
 }
 
+static int sony_nc_handles_setup(struct platform_device *pd)
+{
+	unsigned int i, bitmask, result;
+	int ret;
+
+	/* retrieve the implemented offsets mask */
+	if (acpi_callsetfunc(sony_nc_acpi_handle, "SN00", 0x10, &bitmask))
+		return -EIO;
+
+	/* retrieve the available handles, otherwise return */
+	ret = sony_nc_handles_list_setup(pd);
+	if (ret)
+		return ret;
+
+	/* setup found handles here */
+	for (i = 0; i < ARRAY_SIZE(handles->cap); i++) {
+		int unsigned handle = handles->cap[i];
+
+		if (!handle)
+			continue;
+
+		dprintk("looking at handle 0x%.4x\n", handle);
+
+		switch (handle) {
+		case 0x0137:
+			ret = sony_nc_kbd_backlight_setup(pd);
+		case 0x0124:
+		case 0x0135:
+			ret = sony_nc_rfkill_setup(sony_nc_acpi_device);
+			break;
+		default:
+			continue;
+		}
+
+		if (ret < 0)
+			pr_warn("handle 0x%.4x setup failed (ret: %i)",
+								handle, ret);
+		else
+			dprintk("handle 0x%.4x setup completed\n", handle);
+	}
+
+	/* Enable all events for the found handles, otherwise return */
+	if (acpi_callsetfunc(sony_nc_acpi_handle, "SN02", bitmask, &result))
+		return -EIO;
+
+	return 0;
+}
+
+static int sony_nc_handles_cleanup(struct platform_device *pd)
+{
+	unsigned int i, result, bitmask;
+
+	/* retrieve the event enabled handles */
+	acpi_callgetfunc(sony_nc_acpi_handle, "SN01", &bitmask);
+
+	/* disable the event generation	for every handle */
+	acpi_callsetfunc(sony_nc_acpi_handle, "SN03", bitmask, &result);
+
+	/* cleanup handles here */
+	for (i = 0; i < ARRAY_SIZE(handles->cap); i++) {
+
+		int unsigned handle = handles->cap[i];
+
+		if (!handle)
+			continue;
+
+		dprintk("looking at handle 0x%.4x\n", handle);
+
+		switch (handle) {
+		case 0x0137:
+			sony_nc_kbd_backlight_cleanup(pd);
+		case 0x0124:
+		case 0x0135:
+			sony_nc_rfkill_cleanup();
+			break;
+		default:
+			continue;
+		}
+
+		dprintk("handle 0x%.4x deconfigured\n", handle);
+	}
+
+	/* finally cleanup the handles list */
+	sony_nc_handles_list_cleanup(pd);
+
+	return 0;
+}
+
 static int sony_nc_add(struct acpi_device *device)
 {
 	acpi_status status;
@@ -1783,21 +1871,17 @@ static int sony_nc_add(struct acpi_devic
 	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "SN00",
 					 &handle))) {
 		dprintk("Doing SNC setup\n");
+		sony_nc_function_setup(device);
 		result = sony_nc_handles_setup(sony_pf_device);
 		if (result)
-			goto outpresent;
-		result = sony_nc_kbd_backlight_setup(sony_pf_device);
-		if (result)
 			goto outsnc;
-		sony_nc_function_setup(device);
-		sony_nc_rfkill_setup(device);
 	}
 
 	/* setup input devices and helper fifo */
 	result = sony_laptop_setup_input(device);
 	if (result) {
 		pr_err("Unable to create input devices\n");
-		goto outkbdbacklight;
+		goto outsnc;
 	}
 
 	if (acpi_video_backlight_support()) {
@@ -1855,9 +1939,6 @@ static int sony_nc_add(struct acpi_devic
 
 	sony_laptop_remove_input();
 
-      outkbdbacklight:
-	sony_nc_kbd_backlight_cleanup(sony_pf_device);
-
       outsnc:
 	sony_nc_handles_cleanup(sony_pf_device);
 
@@ -1865,7 +1946,6 @@ static int sony_nc_add(struct acpi_devic
 	sony_pf_remove();
 
       outwalk:
-	sony_nc_rfkill_cleanup();
 	return result;
 }
 
@@ -1874,6 +1954,7 @@ static int sony_nc_remove(struct acpi_de
 	struct sony_nc_value *item;
 
 	sony_nc_backlight_cleanup();
+	sony_nc_handles_cleanup(sony_pf_device);
 
 	sony_nc_acpi_device = NULL;
 
@@ -1881,11 +1962,8 @@ static int sony_nc_remove(struct acpi_de
 		device_remove_file(&sony_pf_device->dev, &item->devattr);
 	}
 
-	sony_nc_kbd_backlight_cleanup(sony_pf_device);
-	sony_nc_handles_cleanup(sony_pf_device);
 	sony_pf_remove();
 	sony_laptop_remove_input();
-	sony_nc_rfkill_cleanup();
 	dprintk(SONY_NC_DRIVER_NAME " removed.\n");
 
 	return 0;
