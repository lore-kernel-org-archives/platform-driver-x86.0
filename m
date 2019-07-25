From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH v2] platform/x86/pcengines-apuv2: use KEY_RESTART for front button
Date: Thu, 25 Jul 2019 21:06:03 +0200
Message-ID: <1564081563-28322-1-git-send-email-info@metux.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: info@metux.net, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Enrico Weigelt <info@metux.net>

The keycode KEY_RESTART is more appropriate for the front button,
as most people use it for things like restart or factory reset.

Signed-off-by: Enrico Weigelt <info@metux.net>
Fixes: f8eb0235f65989fc5521c40c78d1261e7f25cdbe ("x86: pcengines apuv2 gpio/leds/keys platform driver")
---
 drivers/platform/x86/pcengines-apuv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index b0d3110..4138007c 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -93,7 +93,7 @@
 
 static struct gpio_keys_button apu2_keys_buttons[] = {
 	{
-		.code			= KEY_SETUP,
+		.code			= KEY_RESTART,
 		.active_low		= 1,
 		.desc			= "front button",
 		.type			= EV_KEY,
-- 
1.9.1
