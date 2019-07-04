From: Florian Eckert <fe@dev.tdt.de>
Subject: [PATCH 2/3] platform/x86/pcengines-apuv2: add legacy leds gpio definitions
Date: Thu,  4 Jul 2019 11:02:04 +0200
Message-ID: <20190704090205.19400-3-fe@dev.tdt.de>
References: <20190704090205.19400-1-fe@dev.tdt.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704090205.19400-1-fe@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Eckert <fe@dev.tdt.de>
List-Id: platform-driver-x86.vger.kernel.org

Extend the apu2_leds definition to make the leds exportable via the
legacy gpio subsystem. Without this change the leds are not visible
under "/sys/class/leds" and could not be configured.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 drivers/platform/x86/pcengines-apuv2.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index f6d8ed100cab..d50a50e9d34c 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -75,9 +75,24 @@ static const struct amd_fch_gpio_pdata board_apu2 = {
 /* gpio leds device */
 
 static const struct gpio_led apu2_leds[] = {
-	{ .name = "apu:green:1" },
-	{ .name = "apu:green:2" },
-	{ .name = "apu:green:3" }
+	{
+		.name            = "apu:green:1",
+		.gpio            = 505,
+		.default_trigger = "default-off",
+		.active_low      = 1,
+	},
+	{
+		.name            = "apu:green:2",
+		.gpio            = 506,
+		.default_trigger = "default-off",
+		.active_low      = 1,
+	},
+	{
+		.name            = "apu:green:3",
+		.gpio            = 507,
+		.default_trigger = "default-off",
+		.active_low      = 1,
+	}
 };
 
 static const struct gpio_led_platform_data apu2_leds_pdata = {
-- 
2.11.0
