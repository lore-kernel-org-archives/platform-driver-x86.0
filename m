From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 48/65] platform/x86: Fix unmet dependency warning for ACPI_CMPC
Date: Sat, 23 Feb 2019 16:06:23 -0500
Message-ID: <20190223210640.200911-48-sashal@kernel.org>
References: <20190223210640.200911-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190223210640.200911-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sinan Kaya <okaya@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Sinan Kaya <okaya@kernel.org>

[ Upstream commit d58bf90a32a33becec78c3034e781735049fcd25 ]

Add BACKLIGHT_LCD_SUPPORT for ACPI_CMPC to fix the
warning: unmet direct dependencies detected for BACKLIGHT_CLASS_DEVICE.

ACPI_CMPC selects BACKLIGHT_CLASS_DEVICE but BACKLIGHT_CLASS_DEVICE
depends on BACKLIGHT_LCD_SUPPORT.

Copy BACKLIGHT_LCD_SUPPORT dependency into ACPI_CMPC to fix

WARNING: unmet direct dependencies detected for BACKLIGHT_CLASS_DEVICE
  Depends on [n]: HAS_IOMEM [=y] && BACKLIGHT_LCD_SUPPORT [=n]
  Selected by [y]:
  - ACPI_CMPC [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y] && INPUT [=y] && (RFKILL [=n] || RFKILL [=n]=n)

Signed-off-by: Sinan Kaya <okaya@kernel.org>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0c1aa6c314f50..96afca4648d54 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -856,6 +856,7 @@ config TOSHIBA_WMI
 config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
 	depends on ACPI && INPUT
+	depends on BACKLIGHT_LCD_SUPPORT
 	depends on RFKILL || RFKILL=n
 	select BACKLIGHT_CLASS_DEVICE
 	help
-- 
2.19.1
