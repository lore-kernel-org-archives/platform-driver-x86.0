From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 5/25] sony-laptop: new handles setup and cleanup functions
Date: Fri, 03 Jun 2011 17:33:40 +0200
Message-ID: <4DE8FED4.6060205@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:34646 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753313Ab1FCPdm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 11:33:42 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

New sony_nc_snc_setup_handles and sony_nc_snc_cleanup_handles, dealing 
with the initialization and cleanup of the model specific handles in a 
clear and extensible way.

Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1736,6 +1736,69 @@ static void sony_nc_backlight_cleanup(vo
  		backlight_device_unregister(sony_bl_props.dev);
  }

+static void sony_nc_snc_setup_handles(struct platform_device *pd)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(handles->cap); i++) {
+		int ret = 0;
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
+			break;
+		case 0x0124:
+		case 0x0135:
+			ret = sony_nc_rfkill_setup(sony_nc_acpi_device);
+			break;
+		default:
+			continue;
+		}
+
+		if (ret < 0) {
+			pr_warn("handle 0x%.4x setup failed (ret: %i)",
+								handle, ret);
+		} else {
+			dprintk("handle 0x%.4x setup completed\n", handle);
+		}
+	}
+}
+
+static void sony_nc_snc_cleanup_handles(struct platform_device *pd)
+{
+	unsigned int i;
+
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
+			break;
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
+}
+
  static int sony_nc_snc_setup(struct platform_device *pd)
  {
  	unsigned int i, string[4], bitmask, result;
@@ -1766,9 +1829,8 @@ static int sony_nc_snc_setup(struct plat
  		return -2;

  	/* setup found handles here */
-	sony_nc_kbd_backlight_setup(pd);
  	sony_nc_function_setup(sony_nc_acpi_device);
-	sony_nc_rfkill_setup(sony_nc_acpi_device);
+	sony_nc_snc_setup_handles(pd);

  	/* Enable all events for the found handles, otherwise return */
  	if (acpi_callsetfunc(sony_nc_acpi_handle, "SN02", bitmask, &result))
@@ -1788,8 +1850,7 @@ static int sony_nc_snc_cleanup(struct pl
  	acpi_callsetfunc(sony_nc_acpi_handle, "SN03", bitmask, &result);

  	/* cleanup handles here */
-	sony_nc_kbd_backlight_cleanup(pd);
-	sony_nc_rfkill_cleanup();
+	sony_nc_snc_cleanup_handles(pd);

  	sony_nc_handles_cleanup(pd);
