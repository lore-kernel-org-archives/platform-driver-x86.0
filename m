From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 5/6] platform/x86: fujitsu-laptop: do not log LED registration failures
Date: Fri,  7 Apr 2017 15:07:12 +0200
Message-ID: <20170407130713.8417-6-kernel@kempniu.pl>
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

If acpi_fujitsu_laptop_leds_register() returns an error, the latter will
become the return value of acpi_fujitsu_laptop_add(), which in turn will
be reported by driver core.  Simplify code by replacing pr_err() calls
with return statements.  Return 0 instead of result when no errors occur
in order to make the code easier to read.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index ce658789e748..177b9b57ac2f 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -739,22 +739,20 @@ static struct led_classdev eco_led = {
 
 static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 {
-	int result = 0;
+	int result;
 
 	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
 		result = devm_led_classdev_register(&device->dev,
 						    &logolamp_led);
 		if (result)
-			pr_err("Could not register LED handler for logo lamp, error %i\n",
-			       result);
+			return result;
 	}
 
 	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
 	    (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
 		result = devm_led_classdev_register(&device->dev, &kblamps_led);
 		if (result)
-			pr_err("Could not register LED handler for keyboard lamps, error %i\n",
-			       result);
+			return result;
 	}
 
 	/*
@@ -766,8 +764,7 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	if (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
 		result = devm_led_classdev_register(&device->dev, &radio_led);
 		if (result)
-			pr_err("Could not register LED handler for radio LED, error %i\n",
-			       result);
+			return result;
 	}
 
 	/* Support for eco led is not always signaled in bit corresponding
@@ -779,11 +776,10 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	    (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
 		result = devm_led_classdev_register(&device->dev, &eco_led);
 		if (result)
-			pr_err("Could not register LED handler for eco LED, error %i\n",
-			       result);
+			return result;
 	}
 
-	return result;
+	return 0;
 }
 
 static int acpi_fujitsu_laptop_add(struct acpi_device *device)
-- 
2.12.2
