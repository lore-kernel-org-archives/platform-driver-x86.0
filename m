From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 7/25] sony-laptop: sony_nc_function_setup modifications
Date: Fri, 03 Jun 2011 17:36:40 +0200
Message-ID: <4DE8FF88.7060400@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:52986 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751762Ab1FCPgn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 11:36:43 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
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
@@ -1711,6 +1707,12 @@ static void sony_nc_snc_setup_handles(st
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
  			break;
@@ -1790,7 +1792,6 @@ static int sony_nc_snc_setup(struct plat
  		return -2;

  	/* setup found handles here */
-	sony_nc_function_setup(sony_nc_acpi_device);
  	sony_nc_snc_setup_handles(pd);

  	/* Enable all events for the found handles, otherwise return */
@@ -1839,6 +1840,12 @@ static int sony_nc_snc_resume(void)
  		dprintk("looking at handle 0x%.4x\n", handle);

  		switch (handle) {
+		case 0x0100:
+		case 0x0127:
+		case 0x0101:
+		case 0x0102:
+			sony_nc_function_setup(handle);
+			break;
  		case 0x0124:
  		case 0x0135:
  			/* re-read rfkill state */
@@ -2028,7 +2035,7 @@ static int sony_nc_resume(struct acpi_de
  	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "SN00",
  					 &handle))) {
  		dprintk("Doing SNC setup\n");
-		sony_nc_function_setup(device);
+
  		sony_nc_snc_resume();
  	}
