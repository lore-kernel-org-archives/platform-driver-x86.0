From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 2/3] sony-laptop: only show the handles sysfs file in debug mode
Date: Tue,  5 Apr 2011 23:38:35 +0900
Message-ID: <1302014316-1094-3-git-send-email-malattia@linux.it>
References: <1302014316-1094-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:43439 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752494Ab1DEOjH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Apr 2011 10:39:07 -0400
Received: by mail-iy0-f174.google.com with SMTP id 14so437551iyb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Apr 2011 07:39:07 -0700 (PDT)
In-Reply-To: <1302014316-1094-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

It makes no sense to expose this type of information to userspace unless
the driver was explicitly loaded with the debug option.

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   25 ++++++++++++++-----------
 1 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 77646fc..c8d755a 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -773,11 +773,6 @@ static int sony_nc_handles_setup(struct platform_device *pd)
 	if (!handles)
 		return -ENOMEM;
 
-	sysfs_attr_init(&handles->devattr.attr);
-	handles->devattr.attr.name = "handles";
-	handles->devattr.attr.mode = S_IRUGO;
-	handles->devattr.show = sony_nc_handles_show;
-
 	for (i = 0; i < ARRAY_SIZE(handles->cap); i++) {
 		if (!acpi_callsetfunc(sony_nc_acpi_handle,
 					"SN00", i + 0x20, &result)) {
@@ -787,11 +782,18 @@ static int sony_nc_handles_setup(struct platform_device *pd)
 		}
 	}
 
-	/* allow reading capabilities via sysfs */
-	if (device_create_file(&pd->dev, &handles->devattr)) {
-		kfree(handles);
-		handles = NULL;
-		return -1;
+	if (debug) {
+		sysfs_attr_init(&handles->devattr.attr);
+		handles->devattr.attr.name = "handles";
+		handles->devattr.attr.mode = S_IRUGO;
+		handles->devattr.show = sony_nc_handles_show;
+
+		/* allow reading capabilities via sysfs */
+		if (device_create_file(&pd->dev, &handles->devattr)) {
+			kfree(handles);
+			handles = NULL;
+			return -1;
+		}
 	}
 
 	return 0;
@@ -800,7 +802,8 @@ static int sony_nc_handles_setup(struct platform_device *pd)
 static int sony_nc_handles_cleanup(struct platform_device *pd)
 {
 	if (handles) {
-		device_remove_file(&pd->dev, &handles->devattr);
+		if (debug)
+			device_remove_file(&pd->dev, &handles->devattr);
 		kfree(handles);
 		handles = NULL;
 	}
-- 
1.7.4.1
