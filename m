From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 8/8] platform/x86: fujitsu-laptop: remove keycode fields from struct fujitsu_bl
Date: Mon, 20 Mar 2017 10:32:24 +0100
Message-ID: <20170320093224.18541-9-kernel@kempniu.pl>
References: <20170320093224.18541-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170320093224.18541-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Remove the keycode[1-5] fields from struct fujitsu_bl as they are not
needed any more as a result of the sparse keymap migration.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 1487eb2396c6..34c913e621b6 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -139,7 +139,6 @@ struct fujitsu_bl {
 	struct input_dev *input;
 	char phys[32];
 	struct backlight_device *bl_device;
-	int keycode1, keycode2, keycode3, keycode4, keycode5;
 
 	unsigned int max_brightness;
 	unsigned int brightness_changed;
@@ -1130,11 +1129,6 @@ static int __init fujitsu_init(void)
 	fujitsu_bl = kzalloc(sizeof(struct fujitsu_bl), GFP_KERNEL);
 	if (!fujitsu_bl)
 		return -ENOMEM;
-	fujitsu_bl->keycode1 = KEY_PROG1;
-	fujitsu_bl->keycode2 = KEY_PROG2;
-	fujitsu_bl->keycode3 = KEY_PROG3;
-	fujitsu_bl->keycode4 = KEY_PROG4;
-	fujitsu_bl->keycode5 = KEY_RFKILL;
 
 	ret = acpi_bus_register_driver(&acpi_fujitsu_bl_driver);
 	if (ret)
-- 
2.12.0
