From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 6/6] platform/x86: Add RFKILL dependency to toshiba_bluetooth driver
Date: Mon, 27 Apr 2015 14:32:50 -0600
Message-ID: <1430166770-15060-7-git-send-email-coproscefalo@gmail.com>
References: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch simply adds the RFKILL dependency to Kconfig, as we are
now using rfkill code on the driver.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9752761..681b0c5 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -642,6 +642,7 @@ config ACPI_TOSHIBA
 config TOSHIBA_BT_RFKILL
 	tristate "Toshiba Bluetooth RFKill switch support"
 	depends on ACPI
+	depends on RFKILL || RFKILL = n
 	---help---
 	  This driver adds support for Bluetooth events for the RFKill
 	  switch on modern Toshiba laptops with full ACPI support and
-- 
2.3.5
