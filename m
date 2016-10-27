From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v2 1/2] drivers/platform/x86: move module mlx-platform from arch/x86 to drivers/platform/x86
Date: Thu, 27 Oct 2016 19:53:19 +0000
Message-ID: <1477597999-4261-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:59849 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S936095AbcJ0Rza (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2016 13:55:30 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, fengguang.wu@intel.com
Cc: davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, andriy.shevchenko@linux.intel.com, Vadim Pasternak <vadimp@mellanox.com>

Move module mlx-platform.c from arch/x86/platform/mellanox/ to
drivers/platform/x86/.
Remove folder arch/x86/platform/mellanox/ and update relevant Makefile
and Kconfig.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
v1->v2:
 Comments pointed out by Andy:
  - Use -M -C -n option in git format-patch;
---
 MAINTAINERS                                                |  2 +-
 arch/x86/Kconfig                                           | 12 ------------
 arch/x86/platform/mellanox/Makefile                        |  1 -
 drivers/platform/x86/Kconfig                               | 14 +++++++++++++-
 drivers/platform/x86/Makefile                              |  1 +
 .../mellanox => drivers/platform/x86}/mlx-platform.c       |  2 +-
 6 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 arch/x86/platform/mellanox/Makefile
 rename {arch/x86/platform/mellanox => drivers/platform/x86}/mlx-platform.c (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e30399..960f364f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7879,7 +7879,7 @@ MELLANOX PLATFORM DRIVER
 M:      Vadim Pasternak <vadimp@mellanox.com>
 L:      platform-driver-x86@vger.kernel.org
 S:      Supported
-F:      arch/x86/platform/mellanox/mlx-platform.c
+F:      drivers/platform/x86/mlx-platform.c
 
 MELLANOX MLX CPLD HOTPLUG DRIVER
 M:	Vadim Pasternak <vadimp@mellanox.com>
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bada636..ccd5ff7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -550,18 +550,6 @@ config X86_INTEL_QUARK
 	  Say Y here if you have a Quark based system such as the Arduino
 	  compatible Intel Galileo.
 
-config MLX_PLATFORM
-	tristate "Mellanox Technologies platform support"
-	depends on X86_64
-	depends on X86_EXTENDED_PLATFORM
-	---help---
-	  This option enables system support for the Mellanox Technologies
-	  platform.
-
-	  Say Y here if you are building a kernel for Mellanox system.
-
-	  Otherwise, say N.
-
 config X86_INTEL_LPSS
 	bool "Intel Low Power Subsystem Support"
 	depends on X86 && ACPI
diff --git a/arch/x86/platform/mellanox/Makefile b/arch/x86/platform/mellanox/Makefile
deleted file mode 100644
index f43c931..0000000
--- a/arch/x86/platform/mellanox/Makefile
+++ /dev/null
@@ -1 +0,0 @@
-obj-$(CONFIG_MLX_PLATFORM)	+= mlx-platform.o
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1853769..78ed245 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1028,10 +1028,22 @@ config INTEL_TELEMETRY
 	  directly via debugfs files. Various tools may use
 	  this interface for SoC state monitoring.
 
+config MLX_PLATFORM
+	tristate "Mellanox Technologies platform support"
+	depends on X86_64
+	---help---
+	  This option enables system support for the Mellanox Technologies
+	  platform. The Mellanox systems provide data center networking
+	  solutions based on Virtual Protocol Interconnect (VPI) technology
+	  enable seamless connectivity to 56/100Gb/s InfiniBand or 10/40/56GbE
+	  connection.
+
+	  If you have a Mellanox system, say Y or M here.
+
 config MLX_CPLD_PLATFORM
 	tristate "Mellanox platform hotplug driver support"
 	default n
-	depends on MLX_PLATFORM
+	select MLX_PLATFORM
 	select HWMON
 	select I2C
 	---help---
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 1f06b63..2d6a587 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -71,4 +71,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)	+= intel_telemetry_core.o \
 				   intel_telemetry_pltdrv.o \
 				   intel_telemetry_debugfs.o
 obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
+obj-$(CONFIG_MLX_PLATFORM)	+= mlx-platform.o
 obj-$(CONFIG_MLX_CPLD_PLATFORM)	+= mlxcpld-hotplug.o
diff --git a/arch/x86/platform/mellanox/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
similarity index 99%
rename from arch/x86/platform/mellanox/mlx-platform.c
rename to drivers/platform/x86/mlx-platform.c
index 7dcfcca..86a1356 100644
--- a/arch/x86/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -1,5 +1,5 @@
 /*
- * arch/x86/platform/mellanox/mlx-platform.c
+ * drivers/platform/x86/mlx-platform.c
  * Copyright (c) 2016 Mellanox Technologies. All rights reserved.
  * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
  *
-- 
2.1.4
