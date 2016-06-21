From: Matej Groma <matejgroma@gmail.com>
Subject: [PATCH] fujitsu-laptop: Add support for eco LED
Date: Tue, 21 Jun 2016 10:09:21 +0200
Message-ID: <20160621080918.GA3333@Matej-PC.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f195.google.com ([209.85.217.195]:36622 "EHLO
	mail-lb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753007AbcFUIJb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Jun 2016 04:09:31 -0400
Received: by mail-lb0-f195.google.com with SMTP id ur4so878913lbc.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jun 2016 01:09:24 -0700 (PDT)
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jwoithe@just42.net
Cc: platform-driver-x86@vger.kernel.org

There is an indicator LED signaling activated power saving mode
on certain Fujitsu laptop models. This has currently no use on Linux.
Export it to userspace.

Signed-off-by: Matej Groma <matejgroma@gmail.com>
---

Notes:
    Tested on Lifebook E756

 drivers/platform/x86/fujitsu-laptop.c | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index ce41bc3..66e12a2 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -108,6 +108,8 @@
 #define LOGOLAMP_POWERON 0x2000
 #define LOGOLAMP_ALWAYS  0x4000
 #define RADIO_LED_ON	0x20
+#define ECO_LED	0x10000
+#define ECO_LED_ON	0x80000
 #endif

 /* Hotkey details */
@@ -176,6 +178,7 @@ struct fujitsu_hotkey_t {
 	int logolamp_registered;
 	int kblamps_registered;
 	int radio_led_registered;
+	int eco_led_registered;
 };

 static struct fujitsu_hotkey_t *fujitsu_hotkey;
@@ -212,6 +215,17 @@ static struct led_classdev radio_led = {
  .brightness_get = radio_led_get,
  .brightness_set = radio_led_set
 };
+
+static enum led_brightness eco_led_get(struct led_classdev *cdev);
+static void eco_led_set(struct led_classdev *cdev,
+			       enum led_brightness brightness);
+
+static struct led_classdev eco_led = {
+ .name = "fujitsu::eco_led",
+ .max_brightness = 1,
+ .brightness_get = eco_led_get,
+ .brightness_set = eco_led_set
+};
 #endif

 #ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
@@ -296,6 +310,18 @@ static void radio_led_set(struct led_classdev *cdev,
 		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, 0x0);
 }

+static void eco_led_set(struct led_classdev *cdev,
+				enum led_brightness brightness)
+{
+	int curr;
+
+	curr = call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0);
+	if (brightness)
+		call_fext_func(FUNC_LEDS, 0x1, ECO_LED, curr | ECO_LED_ON);
+	else
+		call_fext_func(FUNC_LEDS, 0x1, ECO_LED, curr & ~ECO_LED_ON);
+}
+
 static enum led_brightness logolamp_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness = LED_OFF;
@@ -330,6 +356,16 @@ static enum led_brightness radio_led_get(struct led_classdev *cdev)

 	return brightness;
 }
+
+static enum led_brightness eco_led_get(struct led_classdev *cdev)
+{
+	enum led_brightness brightness = LED_OFF;
+
+	if (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
+		brightness = cdev->max_brightness;
+
+	return brightness;
+}
 #endif

 /* Hardware access for LCD brightness control */
@@ -943,6 +979,23 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 			       result);
 		}
 	}
+
+	/* Support for eco led is not always signaled in bit corresponding
+	 * to the bit used to control the led. According to the DSDT table,
+	 * bit 14 seems to indicate presence of said led as well.
+	 * Confirm by testing the status.
+	*/
+	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
+	   (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
+		result = led_classdev_register(&fujitsu->pf_device->dev,
+						&eco_led);
+		if (result == 0) {
+			fujitsu_hotkey->eco_led_registered = 1;
+		} else {
+			pr_err("Could not register LED handler for eco LED, error %i\n",
+			       result);
+		}
+	}
 #endif

 	return result;
@@ -972,6 +1025,9 @@ static int acpi_fujitsu_hotkey_remove(struct acpi_device *device)

 	if (fujitsu_hotkey->radio_led_registered)
 		led_classdev_unregister(&radio_led);
+
+	if (fujitsu_hotkey->eco_led_registered)
+		led_classdev_unregister(&eco_led);
 #endif

 	input_unregister_device(input);
