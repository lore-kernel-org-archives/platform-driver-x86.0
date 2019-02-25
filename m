From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next & -mmotm] platform/x86: fix PCENGINES_APU2 Kconfig
 warning
Date: Mon, 25 Feb 2019 15:52:14 -0800
Message-ID: <0788056c-1a0b-6e0e-0034-72f40f309eab@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>
List-Id: platform-driver-x86.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix Kconfig warning for PCENGINES_APU2 symbol:

WARNING: unmet direct dependencies detected for KEYBOARD_GPIO_POLLED
  Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=n] && GPIOLIB [=y]
  Selected by [y]:
  - PCENGINES_APU2 [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y]

Add INPUT_KEYBOARD dependency for KEYBOARD_GPIO_POLLED.
Add LEDS_CLASS dependency for LEDS_GPIO.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/platform/x86/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

--- mmotm-2019-0225-1340.orig/drivers/platform/x86/Kconfig
+++ mmotm-2019-0225-1340/drivers/platform/x86/Kconfig
@@ -1305,6 +1305,8 @@ config HUAWEI_WMI
 
 config PCENGINES_APU2
 	tristate "PC Engines APUv2/3 front button and LEDs driver"
+	depends on INPUT_KEYBOARD
+	depends on LEDS_CLASS
 	select GPIO_AMD_FCH
 	select KEYBOARD_GPIO_POLLED
 	select LEDS_GPIO
