From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH] apple-gmux: Add suspend/resume support for the backlight
Date: Thu, 19 Apr 2012 10:55:35 -0500
Message-ID: <1334850935-6659-1-git-send-email-seth.forshee@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:55828 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753777Ab2DSPzr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 Apr 2012 11:55:47 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org
Cc: Seth Forshee <seth.forshee@canonical.com>

After S3, the brightness might not be restored to the pre-suspend value.
Request status update calls from the backlight core on suspend/resume to
ensure the brightness value is restored.

Reported-and-tested-by: Austin Lund <austin.lund@gmail.com>
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/apple-gmux.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 8a582bd..6dcef4f 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -87,6 +87,9 @@ static int gmux_update_status(struct backlight_device *bd)
 	struct apple_gmux_data *gmux_data = bl_get_data(bd);
 	u32 brightness = bd->props.brightness;
 
+	if (bd->props.state & BL_CORE_SUSPENDED)
+		brightness = 0;
+
 	/*
 	 * Older gmux versions require writing out lower bytes first then
 	 * setting the upper byte to 0 to flush the values. Newer versions
@@ -102,6 +105,7 @@ static int gmux_update_status(struct backlight_device *bd)
 }
 
 static const struct backlight_ops gmux_bl_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
 	.get_brightness = gmux_get_brightness,
 	.update_status = gmux_update_status,
 };
-- 
1.7.9.5
