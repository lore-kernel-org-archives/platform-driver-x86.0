From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/1] toshiba_acpi: Silence build testing warnings
Date: Sun, 13 Apr 2014 16:30:23 -0600
Message-ID: <1397428223-2880-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:44157 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750795AbaDMWbe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 13 Apr 2014 18:31:34 -0400
Received: by mail-ob0-f178.google.com with SMTP id wp18so8439436obc.9
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Apr 2014 15:31:33 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Intel test builder caught some warnings, one at the
KBD backlight mode store while validating for
correct parameters, and another one that might lead
to not creating the sysfs group

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index fbbe46d..f397594 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1218,7 +1218,7 @@ static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
 	int mode = -1;
 	int time = -1;
 
-	if (sscanf(buf, "%i", &mode) != 1 && (mode != 2 || mode != 1))
+	if (sscanf(buf, "%i", &mode) != 1 && (mode > 2 || mode < 1))
 		return -EINVAL;
 
 	/* Set the Keyboard Backlight Mode where:
@@ -1741,7 +1741,7 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 
 	ret = sysfs_create_group(&dev->acpi_dev->dev.kobj,
 				 &toshiba_attr_group);
-	if (ret) {
+	if (ret != 0) {
 		dev->sysfs_created = 0;
 		goto error;
 	}
-- 
1.9.1
