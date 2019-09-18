From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] platform/x86: asus-wmi: add ACPI_BATTERY dependency
Date: Wed, 18 Sep 2019 21:56:33 +0200
Message-ID: <20190918195652.2137765-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kristian Klausen <kristian@klausen.dk>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Without this dependency, we can run into a link failure:

drivers/platform/x86/asus-wmi.o: In function `asus_wmi_remove':
asus-wmi.c:(.text+0x430): undefined reference to `battery_hook_unregister'
drivers/platform/x86/asus-wmi.o: In function `asus_wmi_probe':
asus-wmi.c:(.text+0x2c6f): undefined reference to `battery_hook_register'

Fixes: 7973353e92ee ("platform/x86: asus-wmi: Refactor charge threshold to use the battery hooking API")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1b67bb578f9f..d81de3f4f72e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -680,6 +680,7 @@ config ASUS_WMI
 	depends on RFKILL || RFKILL = n
 	depends on HOTPLUG_PCI
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on ACPI_BATTERY
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
-- 
2.20.0
