From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] platform/x86: (sony-laptop): Remove unused variables
Date: Wed, 25 May 2011 23:54:07 -0700
Message-ID: <1306392847-5993-1-git-send-email-linux@roeck-us.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.195]:64529 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751307Ab1EZHAk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 May 2011 03:00:40 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>, Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

Remove unused variable 'handle' from functions sony_nc_get_brightness_ng()
and sony_nc_update_status_ng().

This commit fixes the following build warnings:

drivers/platform/x86/sony-laptop.c: In function sony_nc_get_brightness_ng:
drivers/platform/x86/sony-laptop.c:964: warning: unused variable handle
drivers/platform/x86/sony-laptop.c: In function sony_nc_update_status_ng:
drivers/platform/x86/sony-laptop.c:976: warning: unused variable handle

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/platform/x86/sony-laptop.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 6fe8cd6..9a2c319 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -961,7 +961,6 @@ static int sony_backlight_get_brightness(struct backlight_device *bd)
 static int sony_nc_get_brightness_ng(struct backlight_device *bd)
 {
 	int result;
-	int *handle = (int *)bl_get_data(bd);
 	struct sony_backlight_props *sdev =
 		(struct sony_backlight_props *)bl_get_data(bd);
 
@@ -973,7 +972,6 @@ static int sony_nc_get_brightness_ng(struct backlight_device *bd)
 static int sony_nc_update_status_ng(struct backlight_device *bd)
 {
 	int value, result;
-	int *handle = (int *)bl_get_data(bd);
 	struct sony_backlight_props *sdev =
 		(struct sony_backlight_props *)bl_get_data(bd);
 
-- 
1.7.1
