From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 1/6] platform/x86: fujitsu-laptop: select LEDS_CLASS
Date: Fri,  7 Apr 2017 15:07:08 +0200
Message-ID: <20170407130713.8417-2-kernel@kempniu.pl>
References: <20170407130713.8417-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35487 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755546AbdDGNHT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2017 09:07:19 -0400
Received: by mail-lf0-f66.google.com with SMTP id v2so6096208lfi.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Apr 2017 06:07:18 -0700 (PDT)
In-Reply-To: <20170407130713.8417-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Follow common subsystem practice of selecting LEDS_CLASS instead of
riddling module code with #ifdefs.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/Kconfig          |  2 +-
 drivers/platform/x86/fujitsu-laptop.c | 14 +-------------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 5602bdfcad65..d18acb1105a5 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -182,8 +182,8 @@ config FUJITSU_LAPTOP
 	depends on INPUT
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
-	depends on LEDS_CLASS || LEDS_CLASS=n
 	select INPUT_SPARSEKMAP
+	select LEDS_CLASS
 	---help---
 	  This is a driver for laptops built by Fujitsu:
 
diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 9fd5b98aeef8..555de246b994 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -59,11 +59,9 @@
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/kfifo.h>
+#include <linux/leds.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#if IS_ENABLED(CONFIG_LEDS_CLASS)
-#include <linux/leds.h>
-#endif
 #include <acpi/video.h>
 
 #define FUJITSU_DRIVER_VERSION "0.6.0"
@@ -94,7 +92,6 @@
 #define FLAG_LID	0x100
 #define FLAG_DOCK	0x200
 
-#if IS_ENABLED(CONFIG_LEDS_CLASS)
 /* FUNC interface - LED control */
 #define FUNC_LED_OFF	0x1
 #define FUNC_LED_ON	0x30001
@@ -104,7 +101,6 @@
 #define RADIO_LED_ON	0x20
 #define ECO_LED	0x10000
 #define ECO_LED_ON	0x80000
-#endif
 
 /* Hotkey details */
 #define KEY1_CODE	0x410	/* codes for the keys in the GIRB register */
@@ -165,7 +161,6 @@ struct fujitsu_laptop {
 
 static struct fujitsu_laptop *fujitsu_laptop;
 
-#if IS_ENABLED(CONFIG_LEDS_CLASS)
 static enum led_brightness logolamp_get(struct led_classdev *cdev);
 static int logolamp_set(struct led_classdev *cdev,
 			       enum led_brightness brightness);
@@ -206,7 +201,6 @@ static struct led_classdev eco_led = {
  .brightness_get = eco_led_get,
  .brightness_set_blocking = eco_led_set
 };
-#endif
 
 #ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
 static u32 dbg_level = 0x03;
@@ -253,7 +247,6 @@ static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
 	return value;
 }
 
-#if IS_ENABLED(CONFIG_LEDS_CLASS)
 /* LED class callbacks */
 
 static int logolamp_set(struct led_classdev *cdev,
@@ -349,7 +342,6 @@ static enum led_brightness eco_led_get(struct led_classdev *cdev)
 
 	return brightness;
 }
-#endif
 
 /* Hardware access for LCD brightness control */
 
@@ -845,7 +837,6 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	if (error)
 		goto err_free_fifo;
 
-#if IS_ENABLED(CONFIG_LEDS_CLASS)
 	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
 		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
 						&logolamp_led);
@@ -902,7 +893,6 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 			       result);
 		}
 	}
-#endif
 
 	return result;
 
@@ -916,7 +906,6 @@ static int acpi_fujitsu_laptop_remove(struct acpi_device *device)
 {
 	struct fujitsu_laptop *fujitsu_laptop = acpi_driver_data(device);
 
-#if IS_ENABLED(CONFIG_LEDS_CLASS)
 	if (fujitsu_laptop->logolamp_registered)
 		led_classdev_unregister(&logolamp_led);
 
@@ -928,7 +917,6 @@ static int acpi_fujitsu_laptop_remove(struct acpi_device *device)
 
 	if (fujitsu_laptop->eco_led_registered)
 		led_classdev_unregister(&eco_led);
-#endif
 
 	fujitsu_laptop_platform_remove();
 
-- 
2.12.2
