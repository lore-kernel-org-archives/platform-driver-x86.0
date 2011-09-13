From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 RESEND 9/14] sony-laptop: sony_walk_callback moved for
 better readability
Date: Tue, 13 Sep 2011 22:47:34 +0200
Message-ID: <1315946854.14415.141.camel@air.vesuvio.absence.it>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:33854 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756122Ab1IMUrg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Sep 2011 16:47:36 -0400
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
