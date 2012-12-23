From: Roland Stigge <stigge@antcom.de>
Subject: [PATCH] samsung-laptop: Set keyboard backlight initially
Date: Sun, 23 Dec 2012 18:21:18 +0100
Message-ID: <1356283278-5046-1-git-send-email-stigge@antcom.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.work-microwave.de ([62.245.205.51]:30475 "EHLO
	work-microwave.de" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751318Ab2LWRVk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 23 Dec 2012 12:21:40 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: gregkh@linuxfoundation.org, corentin.chary@gmail.com, mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Roland Stigge <stigge@antcom.de>

After boot, /sys/devices/platform/samsung/leds/samsung::kbd_backlight/brightness
shows the maximum value (8) by readout, but the led is off. I need to manually
set it to the respective value to have keyboard backlight.

Fixing via readout-write in samsung_leds_init().

Tested on Samsung NP900X3C.

Signed-off-by: Roland Stigge <stigge@antcom.de>
--

I'm encountering a similar issue after suspend/resume (led is off). Still
wondering if and by which technique I should add a respective .resume() because
the driver currently doesn't have pm support and also doesn't register as a
driver. Any hint appreciated.

Thanks in advance!

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index dd90d15..1d3292c 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1053,6 +1053,7 @@ static int __init samsung_leds_init(struct samsung_laptop *samsung)
 
 		ret = led_classdev_register(&samsung->platform_device->dev,
 					   &samsung->kbd_led);
+		kbd_led_set(&samsung->kbd_led, kbd_led_get(&samsung->kbd_led));
 	}
 
 	if (ret)
