From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 4/6] platform/x86: fujitsu-laptop: switch to managed LED class devices
Date: Fri,  7 Apr 2017 15:07:11 +0200
Message-ID: <20170407130713.8417-5-kernel@kempniu.pl>
References: <20170407130713.8417-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170407130713.8417-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Use devm_led_classdev_register() for registering LED class devices in
order to simplify cleanup and remove LED-related fields with the
"_registered" suffix from struct fujitsu_laptop.  This also fixes a
cleanup bug: with non-managed LED class devices, if e.g. two supported
LEDs are detected, the first one gets registered successfully but the
second one does not, acpi_fujitsu_laptop_add() will return an error, but
the successfully registered LED will never get unregistered.

Change the parent device for LED class devices to the FUJ02E3 ACPI
device due to this being the logically correct relationship as LED class
devices do not depend on any facility provided by the platform device
registered by fujitsu-laptop, which was their parent until now.

Each managed LED class device is automatically unregistered when the
last reference to its parent device is dropped.  Taking the parent
change described above into account, LED class devices registered by
fujitsu-laptop will be unregistered after acpi_fujitsu_laptop_remove()
is called.  During unregistration, LED brightness is reset to LED_OFF by
LED core, so do not set the acpi_handle field of struct fujitsu_laptop
to NULL inside acpi_fujitsu_laptop_remove() to prevent call_fext_func()
from generating errors upon module removal.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 55 +++++++----------------------------
 1 file changed, 11 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index da0bd556b0bb..ce658789e748 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -153,10 +153,6 @@ struct fujitsu_laptop {
 	spinlock_t fifo_lock;
 	int flags_supported;
 	int flags_state;
-	int logolamp_registered;
-	int kblamps_registered;
-	int radio_led_registered;
-	int eco_led_registered;
 };
 
 static struct fujitsu_laptop *fujitsu_laptop;
@@ -741,31 +737,24 @@ static struct led_classdev eco_led = {
 	.brightness_get = eco_led_get
 };
 
-static int acpi_fujitsu_laptop_leds_register(void)
+static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 {
 	int result = 0;
 
 	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
-		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
-					       &logolamp_led);
-		if (result == 0) {
-			fujitsu_laptop->logolamp_registered = 1;
-		} else {
+		result = devm_led_classdev_register(&device->dev,
+						    &logolamp_led);
+		if (result)
 			pr_err("Could not register LED handler for logo lamp, error %i\n",
 			       result);
-		}
 	}
 
 	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
 	    (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
-		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
-					       &kblamps_led);
-		if (result == 0) {
-			fujitsu_laptop->kblamps_registered = 1;
-		} else {
+		result = devm_led_classdev_register(&device->dev, &kblamps_led);
+		if (result)
 			pr_err("Could not register LED handler for keyboard lamps, error %i\n",
 			       result);
-		}
 	}
 
 	/*
@@ -775,14 +764,10 @@ static int acpi_fujitsu_laptop_leds_register(void)
 	 * that an RF LED is present.
 	 */
 	if (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
-		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
-					       &radio_led);
-		if (result == 0) {
-			fujitsu_laptop->radio_led_registered = 1;
-		} else {
+		result = devm_led_classdev_register(&device->dev, &radio_led);
+		if (result)
 			pr_err("Could not register LED handler for radio LED, error %i\n",
 			       result);
-		}
 	}
 
 	/* Support for eco led is not always signaled in bit corresponding
@@ -792,14 +777,10 @@ static int acpi_fujitsu_laptop_leds_register(void)
 	 */
 	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
 	    (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
-		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
-					       &eco_led);
-		if (result == 0) {
-			fujitsu_laptop->eco_led_registered = 1;
-		} else {
+		result = devm_led_classdev_register(&device->dev, &eco_led);
+		if (result)
 			pr_err("Could not register LED handler for eco LED, error %i\n",
 			       result);
-		}
 	}
 
 	return result;
@@ -887,7 +868,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	if (error)
 		goto err_free_fifo;
 
-	error = acpi_fujitsu_laptop_leds_register();
+	error = acpi_fujitsu_laptop_leds_register(device);
 	if (error)
 		goto err_remove_platform_device;
 
@@ -905,24 +886,10 @@ static int acpi_fujitsu_laptop_remove(struct acpi_device *device)
 {
 	struct fujitsu_laptop *fujitsu_laptop = acpi_driver_data(device);
 
-	if (fujitsu_laptop->logolamp_registered)
-		led_classdev_unregister(&logolamp_led);
-
-	if (fujitsu_laptop->kblamps_registered)
-		led_classdev_unregister(&kblamps_led);
-
-	if (fujitsu_laptop->radio_led_registered)
-		led_classdev_unregister(&radio_led);
-
-	if (fujitsu_laptop->eco_led_registered)
-		led_classdev_unregister(&eco_led);
-
 	fujitsu_laptop_platform_remove();
 
 	kfifo_free(&fujitsu_laptop->fifo);
 
-	fujitsu_laptop->acpi_handle = NULL;
-
 	return 0;
 }
 
-- 
2.12.2
