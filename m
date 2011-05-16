From: Weiping Pan <panweiping3@gmail.com>
Subject: [PATCH] platform/x86:delete two unused variables
Date: Mon, 16 May 2011 14:49:47 +0800
Message-ID: <1305528587-19686-1-git-send-email-panweiping3@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:47383 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751321Ab1EPGtN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 May 2011 02:49:13 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
Cc: Weiping Pan <panweiping3@gmail.com>, Mattia Dongili <malattia@linux.it>, Matthew Garrett <mjg@redhat.com>, "open list:SONY VAIO CONTROL..." <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

variable handle is not used in these two functions,
just delete them.

Signed-off-by: Weiping Pan <panweiping3@gmail.com>
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
1.7.4.4
