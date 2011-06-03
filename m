From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 9/25] sony-laptop: sony_walk_callback moved for better readability
Date: Fri, 03 Jun 2011 17:39:41 +0200
Message-ID: <4DE9003D.4030002@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:56255 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756093Ab1FCPjo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 11:39:44 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
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
@@ -1844,6 +1826,24 @@ static int sony_nc_snc_resume(void)
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
  	u8 ev = 0;
