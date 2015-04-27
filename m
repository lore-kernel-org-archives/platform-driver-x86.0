From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/2] platform/x86: Remove RFKILL dependency from toshiba_acpi
Date: Mon, 27 Apr 2015 14:30:54 -0600
Message-ID: <1430166654-15010-3-git-send-email-coproscefalo@gmail.com>
References: <1430166654-15010-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430166654-15010-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch removes the dependency on rfkill for toshiba_acpi from
KConfig, as a previous patch removed all the code related to it.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9752761..35319f8 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -612,7 +612,6 @@ config ACPI_TOSHIBA
 	select NEW_LEDS
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
-	depends on RFKILL || RFKILL = n
 	depends on SERIO_I8042 || SERIO_I8042 = n
 	select INPUT_POLLDEV
 	select INPUT_SPARSEKMAP
-- 
2.3.5
