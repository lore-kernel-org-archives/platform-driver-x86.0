From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] platform/x86: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:36:50 +0800
Message-ID: <20191120133650.11770-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/platform/x86/Kconfig | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 27d5b40fb717..ef49c8258ce6 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -28,7 +28,7 @@ config ACER_WMI
 	depends on ACPI_WMI
 	select INPUT_SPARSEKMAP
 	# Acer WMI depends on ACPI_VIDEO when ACPI is enabled
-        select ACPI_VIDEO if ACPI
+	select ACPI_VIDEO if ACPI
 	---help---
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
 	  wireless radio and bluetooth control, and on some laptops,
@@ -38,18 +38,18 @@ config ACER_WMI
 	  here.
 
 config ACER_WIRELESS
-        tristate "Acer Wireless Radio Control Driver"
-        depends on ACPI
-        depends on INPUT
-        ---help---
-          The Acer Wireless Radio Control handles the airplane mode hotkey
-          present on new Acer laptops.
+	tristate "Acer Wireless Radio Control Driver"
+	depends on ACPI
+	depends on INPUT
+	---help---
+	  The Acer Wireless Radio Control handles the airplane mode hotkey
+	  present on new Acer laptops.
 
-          Say Y or M here if you have an Acer notebook with an airplane mode
-          hotkey.
+	  Say Y or M here if you have an Acer notebook with an airplane mode
+	  hotkey.
 
-          If you choose to compile this driver as a module the module will be
-          called acer-wireless.
+	  If you choose to compile this driver as a module the module will be
+	  called acer-wireless.
 
 config ACERHDF
 	tristate "Acer Aspire One temperature and fan driver"
@@ -285,17 +285,17 @@ config FUJITSU_TABLET
        depends on ACPI
        depends on INPUT
        ---help---
-         This is a driver for tablets built by Fujitsu:
+	 This is a driver for tablets built by Fujitsu:
 
-           * Lifebook P1510/P1610/P1620/Txxxx
-           * Stylistic ST5xxx
-           * Possibly other Fujitsu tablet models
+	   * Lifebook P1510/P1610/P1620/Txxxx
+	   * Stylistic ST5xxx
+	   * Possibly other Fujitsu tablet models
 
-         It adds support for the panel buttons, docking station detection,
-         tablet/notebook mode detection for convertible and
-         orientation detection for docked slates.
+	 It adds support for the panel buttons, docking station detection,
+	 tablet/notebook mode detection for convertible and
+	 orientation detection for docked slates.
 
-         If you have a Fujitsu convertible or slate, say Y or M here.
+	 If you have a Fujitsu convertible or slate, say Y or M here.
 
 config AMILO_RFKILL
 	tristate "Fujitsu-Siemens Amilo rfkill support"
@@ -1015,8 +1015,8 @@ config INTEL_MFLD_THERMAL
        tristate "Thermal driver for Intel Medfield platform"
        depends on MFD_INTEL_MSIC && THERMAL
        help
-         Say Y here to enable thermal driver support for the  Intel Medfield
-         platform.
+	 Say Y here to enable thermal driver support for the  Intel Medfield
+	 platform.
 
 config INTEL_IPS
 	tristate "Intel Intelligent Power Sharing"
@@ -1123,7 +1123,7 @@ config MXM_WMI
        tristate "WMI support for MXM Laptop Graphics"
        depends on ACPI_WMI
        ---help---
-          MXM is a standard for laptop graphics cards, the WMI interface
+	  MXM is a standard for laptop graphics cards, the WMI interface
 	  is required for switchable nvidia graphics machines
 
 config INTEL_OAKTRAIL
@@ -1158,7 +1158,7 @@ config APPLE_GMUX
 	  control is supported by the driver.
 
 config INTEL_RST
-        tristate "Intel Rapid Start Technology Driver"
+	tristate "Intel Rapid Start Technology Driver"
 	depends on ACPI
 	---help---
 	  This driver provides support for modifying paramaters on systems
@@ -1170,7 +1170,7 @@ config INTEL_RST
 	  as usual.
 
 config INTEL_SMARTCONNECT
-        tristate "Intel Smart Connect disabling driver"
+	tristate "Intel Smart Connect disabling driver"
 	depends on ACPI
 	---help---
 	  Intel Smart Connect is a technology intended to permit devices to
-- 
2.17.1
