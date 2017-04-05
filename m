From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 05/11] platform/x86: fujitsu-laptop: sync brightness in set_lcd_level()
Date: Wed,  5 Apr 2017 08:49:04 +0200
Message-ID: <20170405064910.3162-6-kernel@kempniu.pl>
References: <20170405064910.3162-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34905 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754251AbdDEGtT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Apr 2017 02:49:19 -0400
Received: by mail-lf0-f67.google.com with SMTP id v2so355245lfi.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Apr 2017 23:49:18 -0700 (PDT)
In-Reply-To: <20170405064910.3162-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

When using brightness keys and backlight device's sysfs interface
alternately, an incorrect input event might be generated for a
brightness key press.  Consider the following sequence of events:

 1. Set backlight brightness to 6 using brightness keys.
 2. Write 4 to /sys/class/backlight/fujitsu-laptop/brightness.
 3. Press the "brightness up" key.

The input event generated in this scenario would be KEY_BRIGHTNESSDOWN,
because before step 3 brightness_level would still be at 6.  As the new
brightness level is established using GBLL, it would evaluate to 5
(SBLL/SBL2 sets it to 4 in step 2 and pressing the "brightness up" key
increases it by 1).  This in turn would cause acpi_fujitsu_bl_notify()
to observe a 6 -> 5 change, i.e. a decrease in brightness, while screen
brightness would in fact be increased.

Fix this by updating brightness_level in set_lcd_level.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 6d4a2a36716b..b019060d6dc4 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -384,6 +384,8 @@ static int set_lcd_level(int level)
 		return -ENODEV;
 	}
 
+	fujitsu_bl->brightness_level = level;
+
 	return 0;
 }
 
-- 
2.12.2
