From: Florian Eckert <fe@dev.tdt.de>
Subject: [PATCH 1/1] platform/x86: revert pcengines-apuv2 wire up simswitch gpio as led
Date: Mon, 13 Jul 2020 10:50:10 +0200
Message-ID: <20200713085010.26394-1-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: info@metux.net, vhart@infradead.org, andy@infradead.org, Eckert.Florian@googlemail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Eckert <fe@dev.tdt.de>
List-Id: platform-driver-x86.vger.kernel.org

This reverts commit 5037d4ddda31c2dbbb018109655f61054b1756dc.

Explanation why this does not work:
This change connects the simswap to the LED subsystem of the kernel.
From my point of view, it's nonsense. If we do it this way, then this
can be switched relatively easily via the LED subsystem (trigger:
none/default-on) and that is dangerous! If this is used, it would be
unfavorable, since there is also another trigger (trigger:
heartbeat/netdev).

Therefore, this simswap GPIO should remain in the GPIO
subsystem and be switched via it and not be connected to the LED
subsystem. To avoid the problems mentioned above. The LED subsystem is
not made for this and it is not a good compromise, but rather dangerous.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 drivers/platform/x86/pcengines-apuv2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index 9b11ef1a401f..6aff6cf41414 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -78,7 +78,6 @@ static const struct gpio_led apu2_leds[] = {
 	{ .name = "apu:green:1" },
 	{ .name = "apu:green:2" },
 	{ .name = "apu:green:3" },
-	{ .name = "apu:simswap" },
 };
 
 static const struct gpio_led_platform_data apu2_leds_pdata = {
@@ -95,8 +94,6 @@ static struct gpiod_lookup_table gpios_led_table = {
 				NULL, 1, GPIO_ACTIVE_LOW),
 		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_LED3,
 				NULL, 2, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_SIMSWAP,
-				NULL, 3, GPIO_ACTIVE_LOW),
 	}
 };
 
-- 
2.20.1
