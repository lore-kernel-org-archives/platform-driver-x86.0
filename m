From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] platform/x86: dell-laptop: Handle return error form dell_get_intensity.
Date: Wed,  8 Mar 2017 17:52:27 +0530
Message-ID: <1488975747-32184-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Here, dell_get_intensity can return an error. So we can assgine
props.brightness as max_brightness.

This change is done using Coccinelle.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/dell-laptop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f57dd28..0891de3 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -2053,6 +2053,9 @@ static int __init dell_init(void)
 
 		dell_backlight_device->props.brightness =
 			dell_get_intensity(dell_backlight_device);
+		if (dell_backlight_device->props.brightness < 0) {
+			dell_backlight_device->props.brightness = props.max_brightness;
+		}
 		backlight_update_status(dell_backlight_device);
 	}
 
-- 
1.9.1
