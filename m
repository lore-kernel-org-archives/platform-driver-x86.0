From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH v2] platform/x86: dell-laptop: Handle return error form dell_get_intensity.
Date: Thu,  9 Mar 2017 11:19:56 +0530
Message-ID: <1489038596-3765-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36815 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750763AbdCIF6j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2017 00:58:39 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Here, This patch is to handle a return error from dell_get_intensity.
This change is done using Coccinelle.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/dell-laptop.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f57dd28..7fcf680 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -2053,11 +2053,17 @@ static int __init dell_init(void)
 
 		dell_backlight_device->props.brightness =
 			dell_get_intensity(dell_backlight_device);
+		if (dell_backlight_device->props.brightness < 0) {
+			ret = dell_backlight_device->props.brightness;
+			goto fail_get_brightness;
+		}
 		backlight_update_status(dell_backlight_device);
 	}
 
 	return 0;
 
+fail_get_brightness:
+	backlight_device_unregister(dell_backlight_device);
 fail_backlight:
 	dell_cleanup_rfkill();
 fail_rfkill:
-- 
1.9.1
