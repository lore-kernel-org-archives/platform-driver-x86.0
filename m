From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] platform/x86: Consistently select LEDS Kconfig options
Date: Mon, 10 Jan 2011 14:37:02 +0000
Message-ID: <1294670222-25526-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: platform-driver-x86.vger.kernel.org

Currently the x86 platform devices are not consistent about selecting
or depending on the LEDs Kconfig variables, and this inconsistency
leads to Kconfig getting upset and refusing to offer LEDs (even on
non-x86 platforms):

drivers/platform/x86/Kconfig:422:error: recursive dependency detected!
drivers/platform/x86/Kconfig:422:       symbol EEEPC_WMI depends on ACPI_WMI
drivers/platform/x86/Kconfig:438:       symbol ACPI_WMI is selected by ACER_WMI
drivers/platform/x86/Kconfig:18:        symbol ACER_WMI depends on LEDS_CLASS
drivers/leds/Kconfig:10:        symbol LEDS_CLASS is selected by EEEPC_WMI

Fix this by always selecting rather than depending on the symbols as
slightly more drivers use this approach already and it seems more
user friendly.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 drivers/platform/x86/Kconfig |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index a122a0d..d163bc2 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -18,8 +18,8 @@ if X86_PLATFORM_DEVICES
 config ACER_WMI
 	tristate "Acer WMI Laptop Extras"
 	depends on ACPI
-	depends on LEDS_CLASS
-	depends on NEW_LEDS
+	select LEDS_CLASS
+	select NEW_LEDS
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on SERIO_I8042
 	depends on INPUT
@@ -516,8 +516,8 @@ config TOPSTAR_LAPTOP
 config ACPI_TOSHIBA
 	tristate "Toshiba Laptop Extras"
 	depends on ACPI
-	depends on LEDS_CLASS
-	depends on NEW_LEDS
+	select LEDS_CLASS
+	select NEW_LEDS
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
 	depends on RFKILL || RFKILL = n
-- 
1.7.2.3
