From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] platform/x86: toshiba_acpi: do not select INPUT_POLLDEV
Date: Wed, 2 Oct 2019 10:40:52 -0700
Message-ID: <20191002174052.GA37723@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Azael Avalos <coproscefalo@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The driver does not use polling mode of input devices, and this config
option is going away, so let's not reference it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 8690e311f407..9ecb02226be8 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -830,7 +830,6 @@ config ACPI_TOSHIBA
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on RFKILL || RFKILL = n
 	depends on IIO
-	select INPUT_POLLDEV
 	select INPUT_SPARSEKMAP
 	---help---
 	  This driver adds support for access to certain system settings
-- 
2.23.0.444.g18eeb5a265-goog


-- 
Dmitry
