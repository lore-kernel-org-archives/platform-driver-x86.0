From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] x86/platform/geode: Convert LED to GPIO machine descriptor
Date: Mon, 27 Jul 2020 10:00:19 +0200
Message-ID: <20200727080019.286172-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andres Salomon <dilinger@queued.net>, linux-geode@lists.infradead.org
List-Id: platform-driver-x86.vger.kernel.org

This makes the machine look up the LED from a GPIO machine
descriptor table. The Geode LEDs should be on the CS5535
companion chip.

Cc: linux-gpio@vger.kernel.org
Cc: Andres Salomon <dilinger@queued.net>
Cc: linux-geode@lists.infradead.org
Cc: Andy Shevchenko <andy@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/x86/platform/geode/net5501.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/geode/net5501.c b/arch/x86/platform/geode/net5501.c
index 163e1b545517..d4e6c57b9c87 100644
--- a/arch/x86/platform/geode/net5501.c
+++ b/arch/x86/platform/geode/net5501.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
 
 #include <asm/geode.h>
 
@@ -55,9 +56,7 @@ static struct platform_device net5501_buttons_dev = {
 static struct gpio_led net5501_leds[] = {
 	{
 		.name = "net5501:1",
-		.gpio = 6,
 		.default_trigger = "default-on",
-		.active_low = 0,
 	},
 };
 
@@ -66,6 +65,15 @@ static struct gpio_led_platform_data net5501_leds_data = {
 	.leds = net5501_leds,
 };
 
+static struct gpiod_lookup_table net5501_leds_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		/* The Geode GPIOs should be on the CS5535 companion chip */
+		GPIO_LOOKUP_IDX("cs5535-gpio", 6, NULL, 0, GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct platform_device net5501_leds_dev = {
 	.name = "leds-gpio",
 	.id = -1,
@@ -80,6 +88,7 @@ static struct platform_device *net5501_devs[] __initdata = {
 static void __init register_net5501(void)
 {
 	/* Setup LED control through leds-gpio driver */
+	gpiod_add_lookup_table(&net5501_leds_gpio_table);
 	platform_add_devices(net5501_devs, ARRAY_SIZE(net5501_devs));
 }
 
-- 
2.26.2
