From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] platform/x86: pcengines-apu2 needs gpiolib
Date: Fri, 12 Jul 2019 10:54:16 +0200
Message-ID: <20190712085437.4007720-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

I ran into another build issue in randconfig testing for this driver,
when CONFIG_GPIOLIB is not set:

WARNING: unmet direct dependencies detected for GPIO_AMD_FCH
  Depends on [n]: GPIOLIB [=n] && HAS_IOMEM [=y]
  Selected by [y]:
  - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]

WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
  Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=y] && GPIOLIB [=n]
  Selected by [y]:
  - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && INPUT [=y] && INPUT_KEYBOARD [=y] && LEDS_CLASS [=y]

Make the 'select' statements conditional on that so we don't have to
introduce another 'select'.

Fixes: f8eb0235f659 ("x86: pcengines apuv2 gpio/leds/keys platform driver")
Fixes: a422bf11bdb4 ("platform/x86: fix PCENGINES_APU2 Kconfig warning")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index e869a5c760b6..cf48b9068843 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1324,8 +1324,8 @@ config PCENGINES_APU2
 	tristate "PC Engines APUv2/3 front button and LEDs driver"
 	depends on INPUT && INPUT_KEYBOARD
 	depends on LEDS_CLASS
-	select GPIO_AMD_FCH
-	select KEYBOARD_GPIO_POLLED
+	select GPIO_AMD_FCH if GPIOLIB
+	select KEYBOARD_GPIO_POLLED if GPIOLIB
 	select LEDS_GPIO
 	help
 	  This driver provides support for the front button and LEDs on
-- 
2.20.0
