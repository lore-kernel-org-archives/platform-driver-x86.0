From: Nick <xerofoify@gmail.com>
Subject: [PATCH] platform/x86/toshiba-apci.c possible bad if test?
Date: Thu, 12 Jun 2014 23:04:15 -0400
Message-ID: <1402628655-2904-1-git-send-email-nickkrause@sympatico.ca>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:35993 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751060AbaFMDEp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 Jun 2014 23:04:45 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 76441dc..dfd2243 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1238,7 +1238,7 @@ static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
 	int mode = -1;
 	int time = -1;
 
-	if (sscanf(buf, "%i", &mode) != 1 && (mode != 2 || mode != 1))
+	if (sscanf(buf, "%i", &mode) != 1  || (mode != 2 || mode != 1))
 		return -EINVAL;
 
 	/* Set the Keyboard Backlight Mode where:
-- 
1.9.1
