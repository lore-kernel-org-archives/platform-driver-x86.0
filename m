From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] dell-laptop: touchpad LED should persist its status after S3
Date: Tue, 17 Jan 2012 16:18:06 +0800
Message-ID: <1326788286-14531-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:34432 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751939Ab2AQISM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 17 Jan 2012 03:18:12 -0500
Received: by ggdk6 with SMTP id k6so3009142ggd.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jan 2012 00:18:11 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

Touchpad LED will not turn on after S3, it will make the touchpad status
doesn't consist with the LED.
By adding one flag to let the LED device restore it's status.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/dell-laptop.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 7621ac2..92e42d4 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -642,6 +642,7 @@ static void touchpad_led_set(struct led_classdev *led_cdev,
 static struct led_classdev touchpad_led = {
 	.name = "dell-laptop::touchpad",
 	.brightness_set = touchpad_led_set,
+	.flags = LED_CORE_SUSPENDRESUME,
 };
 
 static int __devinit touchpad_led_init(struct device *dev)
-- 
1.7.8.3
