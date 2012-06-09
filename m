From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 5/7] sony-laptop: input initialization should be done before SNC
Date: Sat,  9 Jun 2012 13:18:12 +0900
Message-ID: <1339215494-4020-6-git-send-email-malattia@linux.it>
References: <20120531220257.GA3986@kamineko.org>
 <1339215494-4020-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:33919 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750823Ab2FIESh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Jun 2012 00:18:37 -0400
In-Reply-To: <1339215494-4020-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

SNC needs input devices so better have those ready before starting
handle events.

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index ec7f4e0..534c295 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2642,6 +2642,12 @@ static int sony_nc_add(struct acpi_device *device)
 		}
 	}
 
+	result = sony_laptop_setup_input(device);
+	if (result) {
+		pr_err("Unable to create input devices\n");
+		goto outplatform;
+	}
+
 	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "ECON",
 					 &handle))) {
 		int arg = 1;
@@ -2659,12 +2665,6 @@ static int sony_nc_add(struct acpi_device *device)
 	}
 
 	/* setup input devices and helper fifo */
-	result = sony_laptop_setup_input(device);
-	if (result) {
-		pr_err("Unable to create input devices\n");
-		goto outsnc;
-	}
-
 	if (acpi_video_backlight_support()) {
 		pr_info("brightness ignored, must be controlled by ACPI video driver\n");
 	} else {
@@ -2712,22 +2712,21 @@ static int sony_nc_add(struct acpi_device *device)
 
 	return 0;
 
-      out_sysfs:
+out_sysfs:
 	for (item = sony_nc_values; item->name; ++item) {
 		device_remove_file(&sony_pf_device->dev, &item->devattr);
 	}
 	sony_nc_backlight_cleanup();
-
-	sony_laptop_remove_input();
-
-      outsnc:
 	sony_nc_function_cleanup(sony_pf_device);
 	sony_nc_handles_cleanup(sony_pf_device);
 
-      outpresent:
+outplatform:
+	sony_laptop_remove_input();
+
+outpresent:
 	sony_pf_remove();
 
-      outwalk:
+outwalk:
 	sony_nc_rfkill_cleanup();
 	return result;
 }
-- 
1.7.10
