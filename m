From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.2 08/59] platform/x86: pcengines-apuv2: Fix softdep statement
Date: Tue,  6 Aug 2019 17:32:28 -0400
Message-ID: <20190806213319.19203-8-sashal@kernel.org>
References: <20190806213319.19203-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190806213319.19203-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Jean Delvare <jdelvare@suse.de>

[ Upstream commit edbfe83def34153a05439ecb3352ae0bb65024de ]

Only first MODULE_SOFTDEP statement is handled per module.
Multiple dependencies must be expressed in a single statement.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
[andy: massaged commit message]
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/pcengines-apuv2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index c1ca931e1fab8..7a8cbfb5d2135 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -255,6 +255,4 @@ MODULE_DESCRIPTION("PC Engines APUv2/APUv3 board GPIO/LED/keys driver");
 MODULE_LICENSE("GPL");
 MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
 MODULE_ALIAS("platform:pcengines-apuv2");
-MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME);
-MODULE_SOFTDEP("pre: platform:leds-gpio");
-MODULE_SOFTDEP("pre: platform:gpio_keys_polled");
+MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME " platform:leds-gpio platform:gpio_keys_polled");
-- 
2.20.1
