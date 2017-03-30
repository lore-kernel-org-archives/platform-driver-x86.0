From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 05/11] platform/x86: fujitsu-laptop: sync brightness in set_lcd_level()
Date: Thu, 30 Mar 2017 12:35:03 +0200
Message-ID: <20170330103509.32509-6-kernel@kempniu.pl>
References: <20170330103509.32509-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170330103509.32509-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

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
index b888ba190fb2..9981988f82d2 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -383,6 +383,8 @@ static int set_lcd_level(int level)
 		return -ENODEV;
 	}
 
+	fujitsu_bl->brightness_level = level;
+
 	return 0;
 }
 
-- 
2.12.1
