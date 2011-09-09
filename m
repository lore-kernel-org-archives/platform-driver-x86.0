From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 6/14] sony-laptop: new sony_nc_handles_resume function
Date: Fri, 09 Sep 2011 18:49:33 +0200
Message-ID: <1315586973.3613.89.camel@vesuvio>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:59313 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758887Ab1IIQtf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Sep 2011 12:49:35 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

New SNC resume function (sony_nc_handles_resume) for better event and
handle re-initialization called by sony_nc_resume, now pushed downwards
near sony_nc_add and sony_nc_cleanup for better readability and fewer
function prototypes.

Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1241,45 +1241,6 @@ static int sony_nc_function_setup(struct
 	return 0;
 }
 
-static int sony_nc_resume(struct acpi_device *device)
-{
-	struct sony_nc_value *item;
-	acpi_handle handle;
-
-	for (item = sony_nc_values; item->name; item++) {
-		int ret;
-
-		if (!item->valid)
-			continue;
-		ret = acpi_callsetfunc(sony_nc_acpi_handle, *item->acpiset,
-				       item->value, NULL);
-		if (ret < 0) {
-			pr_err("%s: %d\n", __func__, ret);
-			break;
-		}
-	}
-
-	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "ECON",
-					 &handle))) {
-		if (acpi_callsetfunc(sony_nc_acpi_handle, "ECON", 1, NULL))
-			dprintk("ECON Method failed\n");
-	}
-
-	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "SN00",
-					 &handle))) {
-		dprintk("Doing SNC setup\n");
-		sony_nc_function_setup(device);
-	}
-
-	/* re-read rfkill state */
-	sony_nc_rfkill_update();
-
-	/* restore kbd backlight states */
-	sony_nc_kbd_backlight_resume();
-
-	return 0;
-}
-
 static void sony_nc_rfkill_cleanup(void)
 {
 	int i;
@@ -1824,6 +1785,45 @@ static int sony_nc_handles_cleanup(struc
 	return 0;
 }
 
+static int sony_nc_handles_resume(void)
+{
+	unsigned int i, result, bitmask;
+
+	/* retrieve the implemented offsets mask */
+	if (acpi_callsetfunc(sony_nc_acpi_handle, "SN00", 0x10, &bitmask))
+		return -EIO;
+
+	/* Enable all events, otherwise return */
+	if (acpi_callsetfunc(sony_nc_acpi_handle, "SN02", bitmask, &result))
+		return -EIO;
+
+	for (i = 0; i < ARRAY_SIZE(handles->cap); i++) {
+		int unsigned handle = handles->cap[i];
+
+		if (!handle)
+			continue;
+
+		dprintk("looking at handle 0x%.4x\n", handle);
+
+		switch (handle) {
+		case 0x0137: /* kbd + als */
+			sony_nc_kbd_backlight_resume();
+			break;
+		case 0x0124:
+		case 0x0135:
+			/* re-read rfkill state */
+			sony_nc_rfkill_update();
+			break;
+		default:
+			continue;
+		}
+
+		dprintk("handle 0x%.4x updated\n", handle);
+	}
+
+	return 0;
+}
+
 static int sony_nc_add(struct acpi_device *device)
 {
 	acpi_status status;
@@ -1969,6 +1969,40 @@ static int sony_nc_remove(struct acpi_de
 	return 0;
 }
 
+static int sony_nc_resume(struct acpi_device *device)
+{
+	struct sony_nc_value *item;
+	acpi_handle handle;
+
+	for (item = sony_nc_values; item->name; item++) {
+		int ret;
+
+		if (!item->valid)
+			continue;
+		ret = acpi_callsetfunc(sony_nc_acpi_handle, *item->acpiset,
+				       item->value, NULL);
+		if (ret < 0) {
+			pr_err("%s: %d\n", __func__, ret);
+			break;
+		}
+	}
+
+	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "ECON",
+					 &handle))) {
+		if (acpi_callsetfunc(sony_nc_acpi_handle, "ECON", 1, NULL))
+			dprintk("ECON Method failed\n");
+	}
+
+	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "SN00",
+					 &handle))) {
+		dprintk("Doing SNC setup\n");
+		sony_nc_function_setup(device);
+		sony_nc_handles_resume();
+	}
+
+	return 0;
+}
+
 static const struct acpi_device_id sony_device_ids[] = {
 	{SONY_NC_HID, 0},
 	{SONY_PIC_HID, 0},
