From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 3/3] sony-laptop: report failures on setting LCD brightness
Date: Tue,  5 Apr 2011 23:38:36 +0900
Message-ID: <1302014316-1094-4-git-send-email-malattia@linux.it>
References: <1302014316-1094-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:53399 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752402Ab1DEOjJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Apr 2011 10:39:09 -0400
Received: by mail-iw0-f174.google.com with SMTP id 34so438617iwn.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Apr 2011 07:39:09 -0700 (PDT)
In-Reply-To: <1302014316-1094-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Check if we were successful in setting the requested brightness and
report failure in that case.

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index c8d755a..2fe7ddd 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -961,9 +961,10 @@ static int sony_nc_update_status_ng(struct backlight_device *bd)
 	int *handle = (int *)bl_get_data(bd);
 
 	value = bd->props.brightness;
-	sony_call_snc_handle(*handle, 0x0100 | (value << 16), &result);
+	if (sony_call_snc_handle(*handle, 0x0100 | (value << 16), &result))
+		return -EIO;
 
-	return sony_nc_get_brightness_ng(bd);
+	return value;
 }
 
 static const struct backlight_ops sony_backlight_ops = {
-- 
1.7.4.1
