From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH] platform/x86: fujitsu-laptop: Fix radio LED detection
Date: Wed, 25 Oct 2017 06:29:46 +0200
Message-ID: <20171025042946.13225-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:48915 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750763AbdJYEaE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Oct 2017 00:30:04 -0400
Received: by mail-lf0-f68.google.com with SMTP id a69so26323535lfe.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Oct 2017 21:30:04 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Harvey <harv@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Radio LED detection method implemented in commit 4f62568c1fcf
("fujitsu-laptop: Support radio LED") turned out to be incorrect as it
causes a radio LED to be erroneously detected on a Fujitsu Lifebook E751
which has a slide switch (and thus no radio LED).  Use bit 17 of
flags_supported (the value returned by method S000 of ACPI device
FUJ02E3) to determine whether a radio LED is present as it seems to be a
more reliable indicator, based on comparing DSDT tables of four Fujitsu
Lifebook models (E744, E751, S7110, S8420).

Reported-by: Heinrich Siebmanns <harv@gmx.de>
Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
I do not have a Fujitsu laptop with a radio LED for testing, so I was
only able to check that this patch still does not cause a radio LED to
be detected on a Lifebook S7020.

Harvey, could you please try this patch on your Lifebook E751 and see
whether the log messages you reported disappear?  I will be happy to
assist you off-list in case you need help with it.

 drivers/platform/x86/fujitsu-laptop.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 56a8195096a2..2cfbd3fa5136 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -691,6 +691,7 @@ static enum led_brightness eco_led_get(struct led_classdev *cdev)
 
 static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 {
+	struct fujitsu_laptop *priv = acpi_driver_data(device);
 	struct led_classdev *led;
 	int result;
 
@@ -724,12 +725,15 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	}
 
 	/*
-	 * BTNI bit 24 seems to indicate the presence of a radio toggle
-	 * button in place of a slide switch, and all such machines appear
-	 * to also have an RF LED.  Therefore use bit 24 as an indicator
-	 * that an RF LED is present.
+	 * Some Fujitsu laptops have a radio toggle button in place of a slide
+	 * switch and all such machines appear to also have an RF LED.  Based on
+	 * comparing DSDT tables of four Fujitsu Lifebook models (E744, E751,
+	 * S7110, S8420; the first one has a radio toggle button, the other
+	 * three have slide switches), bit 17 of flags_supported (the value
+	 * returned by method S000 of ACPI device FUJ02E3) seems to indicate
+	 * whether given model has a radio toggle button.
 	 */
-	if (call_fext_func(device, FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
+	if (priv->flags_supported & BIT(17)) {
 		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
 		if (!led)
 			return -ENOMEM;
-- 
2.14.2
