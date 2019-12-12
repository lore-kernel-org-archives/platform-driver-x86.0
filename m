From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH] platform/x86: pcengines-apu2: fix simswap gpio assignment
Date: Thu, 12 Dec 2019 12:15:07 +0100
Message-ID: <20191212111507.14365-1-info@metux.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: info@metux.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The mapping entry has to hold the gpio line index instead of
controller's register number.

Fixes: 5037d4ddda31c2dbbb018109655f61054b1756dc

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/platform/x86/pcengines-apuv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index 48b112b4f0b0..c32daf087640 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -95,7 +95,7 @@ static struct gpiod_lookup_table gpios_led_table = {
 				NULL, 1, GPIO_ACTIVE_LOW),
 		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_LED3,
 				NULL, 2, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_REG_SIMSWAP,
+		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_SIMSWAP,
 				NULL, 3, GPIO_ACTIVE_LOW),
 	}
 };
-- 
2.11.0
