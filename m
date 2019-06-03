From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] platform/x86: Remove left-over BACKLIGHT_LCD_SUPPORT
Date: Mon,  3 Jun 2019 21:23:38 +0200
Message-ID: <20190603192338.30836-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, Alexander Shiyan <shc_work@mail.ru>, Sinan Kaya <okaya@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

The CONFIG_BACKLIGHT_LCD_SUPPORT was removed in commit 8c5dc8d9f19c
("video: backlight: Remove useless BACKLIGHT_LCD_SUPPORT kernel
symbol"). Options protected by CONFIG_BACKLIGHT_LCD_SUPPORT are now
available directly.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/platform/x86/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 5d5cc6111081..bd15b47abcb4 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -906,7 +906,6 @@ config TOSHIBA_WMI
 config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
 	depends on ACPI && INPUT
-	depends on BACKLIGHT_LCD_SUPPORT
 	depends on RFKILL || RFKILL=n
 	select BACKLIGHT_CLASS_DEVICE
 	help
@@ -1130,7 +1129,6 @@ config INTEL_OAKTRAIL
 config SAMSUNG_Q10
 	tristate "Samsung Q10 Extras"
 	depends on ACPI
-	depends on BACKLIGHT_LCD_SUPPORT
 	select BACKLIGHT_CLASS_DEVICE
 	---help---
 	  This driver provides support for backlight control on Samsung Q10
-- 
2.17.1
