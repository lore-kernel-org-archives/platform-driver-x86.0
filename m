From: Bjarke Istrup Pedersen <gurligebis@gentoo.org>
Subject: [PATCH] NET5501: Change active_low to 0 for LED driver.
Date: Sat, 14 Apr 2012 17:42:17 +0000
Message-ID: <1334425337-24343-1-git-send-email-gurligebis@gentoo.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:51278 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753440Ab2DNRnZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Apr 2012 13:43:25 -0400
Received: by wibhj6 with SMTP id hj6so7426359wib.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Apr 2012 10:43:24 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Bjarke Istrup Pedersen <gurligebis@gentoo.org>

It seems that there was an error with the active_low = 1 for the
LED, since it should be set to 0 (meaning that active is high,
since 0 is false, hence the confusion.

The wiki article about it confuses it, since it contradicts
itself, regarding what turns on the LED.

I have tested 3.4-rc2 on my net5501 with this patch, and it
makes the LED behave correctly, where "none" turns it off, and
"default-on" turns it on, when echoed onto the trigger "file"
in /sys/class/leds.

Signed-off-by: Bjarke Istrup Pedersen <gurligebis@gentoo.org>
---
 arch/x86/platform/geode/net5501.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/platform/geode/net5501.c b/arch/x86/platform/geode/net5501.c
index 66d377e..646e3b5 100644
--- a/arch/x86/platform/geode/net5501.c
+++ b/arch/x86/platform/geode/net5501.c
@@ -63,7 +63,7 @@ static struct gpio_led net5501_leds[] = {
 		.name = "net5501:1",
 		.gpio = 6,
 		.default_trigger = "default-on",
-		.active_low = 1,
+		.active_low = 0,
 	},
 };
 
-- 
1.7.8.5
