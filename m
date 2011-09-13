From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 RESEND 7/14] sony-laptop: sony_nc_function_setup
 modifications
Date: Tue, 13 Sep 2011 22:47:10 +0200
Message-ID: <1315946830.14415.137.camel@air.vesuvio.absence.it>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:33800 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756122Ab1IMUrM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Sep 2011 16:47:12 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Removed every init code, already present in sony_nc_snc_setup and
sony_nc_snc_resume. Now calling only the handles present on the device,
using the new setup and resume code.


Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1225,18 +1225,14 @@ static acpi_status sony_walk_callback(ac
 /*
  * ACPI device
  */
-static int sony_nc_function_setup(struct acpi_device *device)
+static int sony_nc_function_setup(unsigned int handle)
 {
 	unsigned int result;
 
-	/* Enable all events */
-	acpi_callsetfunc(sony_nc_acpi_handle, "SN02", 0xffff, &result);
-
-	/* Setup hotkeys */
-	sony_call_snc_handle(0x0100, 0, &result);
-	sony_call_snc_handle(0x0101, 0, &result);
-	sony_call_snc_handle(0x0102, 0x100, &result);
-	sony_call_snc_handle(0x0127, 0, &result);
+	if (handle == 0x0102)
+		sony_call_snc_handle(0x0102, 0x100, &result);
+	else
+		sony_call_snc_handle(handle, 0, &result);
 
 	return 0;
 }
@@ -1721,6 +1717,12 @@ static int sony_nc_handles_setup(struct 
 		dprintk("looking at handle 0x%.4x\n", handle);
 
 		switch (handle) {
+		case 0x0100:
+		case 0x0127:
+		case 0x0101:
+		case 0x0102:
+			ret = sony_nc_function_setup(handle);
+			break;
 		case 0x0137:
 			ret = sony_nc_kbd_backlight_setup(pd);
 		case 0x0124:
@@ -1806,6 +1808,12 @@ static int sony_nc_handles_resume(void)
 		dprintk("looking at handle 0x%.4x\n", handle);
 
 		switch (handle) {
+		case 0x0100:
+		case 0x0127:
+		case 0x0101:
+		case 0x0102:
+			sony_nc_function_setup(handle);
+			break;
 		case 0x0137: /* kbd + als */
 			sony_nc_kbd_backlight_resume();
 			break;
@@ -1871,7 +1879,7 @@ static int sony_nc_add(struct acpi_devic
 	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "SN00",
 					 &handle))) {
 		dprintk("Doing SNC setup\n");
-		sony_nc_function_setup(device);
+
 		result = sony_nc_handles_setup(sony_pf_device);
 		if (result)
 			goto outsnc;
@@ -1996,7 +2004,7 @@ static int sony_nc_resume(struct acpi_de
 	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "SN00",
 					 &handle))) {
 		dprintk("Doing SNC setup\n");
-		sony_nc_function_setup(device);
+
 		sony_nc_handles_resume();
 	}
 
