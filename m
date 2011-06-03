From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 4/25] sony-laptop: new SNC setup and cleanup functions
Date: Fri, 03 Jun 2011 17:32:11 +0200
Message-ID: <4DE8FE7B.6090602@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:33194 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750807Ab1FCPcO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 11:32:14 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

New SNC setup and cleanup functions, sony_nc_snc_setup and 
sony_nc_snc_cleanup, to avoid eccessive tainting of sony_nc_add and 
sony_nc_remove, with cleaner and easier to read code, better event 
initialization and better error handling.

Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1736,6 +1736,66 @@ static void sony_nc_backlight_cleanup(vo
  		backlight_device_unregister(sony_bl_props.dev);
  }

+static int sony_nc_snc_setup(struct platform_device *pd)
+{
+	unsigned int i, string[4], bitmask, result;
+
+	for (i = 0; i < 4; i++) {
+		if (acpi_callsetfunc(sony_nc_acpi_handle,
+				"SN00", i, &string[i]))
+			return -EIO;
+	}
+	if (strncmp("SncSupported", (char *) string, 0x10)) {
+		pr_info("SNC device present but not supported by hardware");
+		return -1;
+	}
+
+	if (!acpi_callsetfunc(sony_nc_acpi_handle, "SN00", 0x04, &result)) {
+		unsigned int model, i;
+		for (model = 0, i = 0; i < 4; i++)
+			model |= ((result >> (i * 8)) & 0xff) << ((3 - i) * 8);
+		pr_info("found Vaio model ID: %u\n", model);
+	}
+
+	/* retrieve the implemented offsets mask */
+	if (acpi_callsetfunc(sony_nc_acpi_handle, "SN00", 0x10, &bitmask))
+		return -EIO;
+
+	/* retrieve the available handles, otherwise return */
+	if (sony_nc_handles_setup(pd))
+		return -2;
+
+	/* setup found handles here */
+	sony_nc_kbd_backlight_setup(pd);
+	sony_nc_function_setup(sony_nc_acpi_device);
+	sony_nc_rfkill_setup(sony_nc_acpi_device);
+
+	/* Enable all events for the found handles, otherwise return */
+	if (acpi_callsetfunc(sony_nc_acpi_handle, "SN02", bitmask, &result))
+		return -EIO;
+
+	return 0;
+}
+
+static int sony_nc_snc_cleanup(struct platform_device *pd)
+{
+	unsigned int result, bitmask;
+
+	/* retrieve the event enabled handles */
+	acpi_callgetfunc(sony_nc_acpi_handle, "SN01", &bitmask);
+
+	/* disable the event generation	for every handle */
+	acpi_callsetfunc(sony_nc_acpi_handle, "SN03", bitmask, &result);
+
+	/* cleanup handles here */
+	sony_nc_kbd_backlight_cleanup(pd);
+	sony_nc_rfkill_cleanup();
+
+	sony_nc_handles_cleanup(pd);
+
+	return 0;
+}
+
  static int sony_nc_add(struct acpi_device *device)
  {
  	acpi_status status;
@@ -1783,21 +1843,16 @@ static int sony_nc_add(struct acpi_devic
  	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "SN00",
  					 &handle))) {
  		dprintk("Doing SNC setup\n");
-		result = sony_nc_handles_setup(sony_pf_device);
-		if (result)
-			goto outpresent;
-		result = sony_nc_kbd_backlight_setup(sony_pf_device);
-		if (result)
+
+		if (sony_nc_snc_setup(sony_pf_device))
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
@@ -1855,17 +1910,13 @@ static int sony_nc_add(struct acpi_devic

  	sony_laptop_remove_input();

-      outkbdbacklight:
-	sony_nc_kbd_backlight_cleanup(sony_pf_device);
-
        outsnc:
-	sony_nc_handles_cleanup(sony_pf_device);
+	sony_nc_snc_cleanup(sony_pf_device);

        outpresent:
  	sony_pf_remove();

        outwalk:
-	sony_nc_rfkill_cleanup();
  	return result;
  }

@@ -1881,11 +1932,9 @@ static int sony_nc_remove(struct acpi_de
  		device_remove_file(&sony_pf_device->dev, &item->devattr);
  	}

-	sony_nc_kbd_backlight_cleanup(sony_pf_device);
-	sony_nc_handles_cleanup(sony_pf_device);
+	sony_nc_snc_cleanup(sony_pf_device);
  	sony_pf_remove();
  	sony_laptop_remove_input();
-	sony_nc_rfkill_cleanup();
  	dprintk(SONY_NC_DRIVER_NAME " removed.\n");

  	return 0;
