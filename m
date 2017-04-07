From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 2/6] platform/x86: fujitsu-laptop: refactor LED registration
Date: Fri,  7 Apr 2017 15:07:09 +0200
Message-ID: <20170407130713.8417-3-kernel@kempniu.pl>
References: <20170407130713.8417-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36475 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756108AbdDGNHT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2017 09:07:19 -0400
Received: by mail-lf0-f66.google.com with SMTP id n78so6094770lfi.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Apr 2017 06:07:18 -0700 (PDT)
In-Reply-To: <20170407130713.8417-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Move a long section of code responsible for registering LEDs out of
acpi_fujitsu_laptop_add() to improve readability and ensure proper
cleanup of platform device and kfifo e.g. when two supported LEDs are
detected, the first one gets registered successfully but the second one
does not.  This makes the result variable in acpi_fujitsu_laptop_add()
redundant, so remove it.  Adjust whitespace to make checkpatch happy.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 128 +++++++++++++++++++---------------
 1 file changed, 70 insertions(+), 58 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 555de246b994..4d13cc03d3b1 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -754,9 +754,72 @@ static void fujitsu_laptop_platform_remove(void)
 	platform_device_unregister(fujitsu_laptop->pf_device);
 }
 
-static int acpi_fujitsu_laptop_add(struct acpi_device *device)
+static int acpi_fujitsu_laptop_leds_register(void)
 {
 	int result = 0;
+
+	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
+		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
+					       &logolamp_led);
+		if (result == 0) {
+			fujitsu_laptop->logolamp_registered = 1;
+		} else {
+			pr_err("Could not register LED handler for logo lamp, error %i\n",
+			       result);
+		}
+	}
+
+	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
+	    (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
+		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
+					       &kblamps_led);
+		if (result == 0) {
+			fujitsu_laptop->kblamps_registered = 1;
+		} else {
+			pr_err("Could not register LED handler for keyboard lamps, error %i\n",
+			       result);
+		}
+	}
+
+	/*
+	 * BTNI bit 24 seems to indicate the presence of a radio toggle
+	 * button in place of a slide switch, and all such machines appear
+	 * to also have an RF LED.  Therefore use bit 24 as an indicator
+	 * that an RF LED is present.
+	 */
+	if (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
+		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
+					       &radio_led);
+		if (result == 0) {
+			fujitsu_laptop->radio_led_registered = 1;
+		} else {
+			pr_err("Could not register LED handler for radio LED, error %i\n",
+			       result);
+		}
+	}
+
+	/* Support for eco led is not always signaled in bit corresponding
+	 * to the bit used to control the led. According to the DSDT table,
+	 * bit 14 seems to indicate presence of said led as well.
+	 * Confirm by testing the status.
+	 */
+	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
+	    (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
+		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
+					       &eco_led);
+		if (result == 0) {
+			fujitsu_laptop->eco_led_registered = 1;
+		} else {
+			pr_err("Could not register LED handler for eco LED, error %i\n",
+			       result);
+		}
+	}
+
+	return result;
+}
+
+static int acpi_fujitsu_laptop_add(struct acpi_device *device)
+{
 	int state = 0;
 	int error;
 	int i;
@@ -837,65 +900,14 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	if (error)
 		goto err_free_fifo;
 
-	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
-		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
-						&logolamp_led);
-		if (result == 0) {
-			fujitsu_laptop->logolamp_registered = 1;
-		} else {
-			pr_err("Could not register LED handler for logo lamp, error %i\n",
-			       result);
-		}
-	}
-
-	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
-	   (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
-		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
-						&kblamps_led);
-		if (result == 0) {
-			fujitsu_laptop->kblamps_registered = 1;
-		} else {
-			pr_err("Could not register LED handler for keyboard lamps, error %i\n",
-			       result);
-		}
-	}
-
-	/*
-	 * BTNI bit 24 seems to indicate the presence of a radio toggle
-	 * button in place of a slide switch, and all such machines appear
-	 * to also have an RF LED.  Therefore use bit 24 as an indicator
-	 * that an RF LED is present.
-	 */
-	if (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
-		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
-						&radio_led);
-		if (result == 0) {
-			fujitsu_laptop->radio_led_registered = 1;
-		} else {
-			pr_err("Could not register LED handler for radio LED, error %i\n",
-			       result);
-		}
-	}
-
-	/* Support for eco led is not always signaled in bit corresponding
-	 * to the bit used to control the led. According to the DSDT table,
-	 * bit 14 seems to indicate presence of said led as well.
-	 * Confirm by testing the status.
-	*/
-	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
-	   (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
-		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
-						&eco_led);
-		if (result == 0) {
-			fujitsu_laptop->eco_led_registered = 1;
-		} else {
-			pr_err("Could not register LED handler for eco LED, error %i\n",
-			       result);
-		}
-	}
+	error = acpi_fujitsu_laptop_leds_register();
+	if (error)
+		goto err_remove_platform_device;
 
-	return result;
+	return 0;
 
+err_remove_platform_device:
+	fujitsu_laptop_platform_remove();
 err_free_fifo:
 	kfifo_free(&fujitsu_laptop->fifo);
 err_stop:
-- 
2.12.2
