From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] platform/x86: peaq-wmi: select INPUT_POLLDEV
Date: Thu, 20 Jul 2017 18:00:50 +0200
Message-ID: <20170720160114.3261176-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The new driver fails to build without INPUT_POLLDEV

drivers/platform/x86/peaq-wmi.o: In function `peaq_wmi_exit':
peaq-wmi.c:(.exit.text+0x1c): undefined reference to `input_unregister_polled_device'
drivers/platform/x86/peaq-wmi.o: In function `peaq_wmi_init':
peaq-wmi.c:(.init.text+0x23): undefined reference to `input_allocate_polled_device'
peaq-wmi.c:(.init.text+0x18e): undefined reference to `input_register_polled_device'

For some reason, all other drivers that need this use 'select'
here rather than 'depends on', so I'm doing the same.

Fixes: 13bb0fd5519d ("platform/x86: peaq-wmi: Add new peaq-wmi driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 2b209f5d42ff..d9238e9ff54a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -672,6 +672,7 @@ config PEAQ_WMI
 	tristate "PEAQ 2-in-1 WMI hotkey driver"
 	depends on ACPI_WMI
 	depends on INPUT
+	select INPUT_POLLDEV
 	help
 	 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
 
-- 
2.9.0
