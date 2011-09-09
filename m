From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 9/14] sony-laptop: sony_walk_callback moved for better
 readability
Date: Fri, 09 Sep 2011 18:54:55 +0200
Message-ID: <1315587295.3613.96.camel@vesuvio>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:37653 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758887Ab1IIQy5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Sep 2011 12:54:57 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

sony_walk_callback moved to stay close to the other ACPI callbacks for
better code readability.

Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1149,24 +1149,6 @@ static struct sony_nc_event sony_127_eve
 };
 
 /*
- * ACPI callbacks
- */
-static acpi_status sony_walk_callback(acpi_handle handle, u32 level,
-				      void *context, void **return_value)
-{
-	struct acpi_device_info *info;
-
-	if (ACPI_SUCCESS(acpi_get_object_info(handle, &info))) {
-		pr_warn("method: name: %4.4s, args %X\n",
-			(char *)&info->name, info->param_count);
-
-		kfree(info);
-	}
-
-	return AE_OK;
-}
-
-/*
  * ACPI device
  */
 static int sony_nc_function_setup(unsigned int handle)
@@ -1811,6 +1793,24 @@ static int sony_nc_handles_resume(void)
 	return 0;
 }
 
+/*
+ * ACPI callbacks
+ */
+static acpi_status sony_walk_callback(acpi_handle handle, u32 level,
+				      void *context, void **return_value)
+{
+	struct acpi_device_info *info;
+
+	if (ACPI_SUCCESS(acpi_get_object_info(handle, &info))) {
+		pr_warn("method: name: %4.4s, args %X\n",
+			(char *)&info->name, info->param_count);
+
+		kfree(info);
+	}
+
+	return AE_OK;
+}
+
 static void sony_nc_notify(struct acpi_device *device, u32 event)
 {
 	dprintk("sony_nc_notify, event: 0x%.2x\n", event);
