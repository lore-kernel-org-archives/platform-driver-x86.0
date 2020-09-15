From: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Subject: [PATCH] platform/x86: fix kconfig dependency warning for LG_LAPTOP
Date: Tue, 15 Sep 2020 12:09:23 +0300
Message-ID: <20200915090922.16423-1-fazilyildiran@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org
Cc: matan@svgalib.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, paul@pgazz.com, jeho@cs.utexas.edu, Necip Fazil Yildiran <fazilyildiran@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

When LG_LAPTOP is enabled and NEW_LEDS is disabled, it results in the
following Kbuild warning:

WARNING: unmet direct dependencies detected for LEDS_CLASS
  Depends on [n]: NEW_LEDS [=n]
  Selected by [y]:
  - LG_LAPTOP [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y] && ACPI_WMI [=y] && INPUT [=y]

The reason is that LG_LAPTOP selects LEDS_CLASS without depending on or
selecting NEW_LEDS while LEDS_CLASS is subordinate to NEW_LEDS.

Honor the kconfig menu hierarchy to remove kconfig dependency warnings.

Fixes: dbf0c5a6b1f8 ("platform/x86: Add LG Gram laptop special features driver")
Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 40219bba6801..81f6079d08e6 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1112,6 +1112,7 @@ config LG_LAPTOP
 	depends on ACPI_WMI
 	depends on INPUT
 	select INPUT_SPARSEKMAP
+	select NEW_LEDS
 	select LEDS_CLASS
 	help
 	 This driver adds support for hotkeys as well as control of keyboard
-- 
2.25.1
