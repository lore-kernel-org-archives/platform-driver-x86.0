From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] platform/x86: fujitsu-laptop: add NULL check on
 devm_kzalloc() return value
Date: Thu, 6 Jul 2017 17:19:02 -0500
Message-ID: <20170706221902.GA29514@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>
List-Id: platform-driver-x86.vger.kernel.org

Check return value from call to devm_kzalloc()
in order to prevent a NULL pointer dereference.

This issue was detected using Coccinelle and the following semantic patch:

@@
expression x;
identifier fld;
@@

* x = devm_kzalloc(...);
  ... when != x == NULL
  x->fld

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/platform/x86/fujitsu-laptop.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index c1a8528..593a350 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -695,6 +695,9 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	if (call_fext_func(device,
 			   FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
 		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
+		if (!led)
+			return -ENOMEM;
+
 		led->name = "fujitsu::logolamp";
 		led->brightness_set_blocking = logolamp_set;
 		led->brightness_get = logolamp_get;
@@ -707,6 +710,9 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 			    FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
 	    (call_fext_func(device, FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
 		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
+		if (!led)
+			return -ENOMEM;
+
 		led->name = "fujitsu::kblamps";
 		led->brightness_set_blocking = kblamps_set;
 		led->brightness_get = kblamps_get;
@@ -723,6 +729,9 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	 */
 	if (call_fext_func(device, FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
 		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
+		if (!led)
+			return -ENOMEM;
+
 		led->name = "fujitsu::radio_led";
 		led->brightness_set_blocking = radio_led_set;
 		led->brightness_get = radio_led_get;
@@ -741,6 +750,9 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	    (call_fext_func(device,
 			    FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
 		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
+		if (!led)
+			return -ENOMEM;
+
 		led->name = "fujitsu::eco_led";
 		led->brightness_set_blocking = eco_led_set;
 		led->brightness_get = eco_led_get;
-- 
2.5.0
