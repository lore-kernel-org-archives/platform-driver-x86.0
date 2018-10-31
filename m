From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V4 1/5]  pvpanic: move pvpanic to misc as common driver
Date: Wed, 31 Oct 2018 21:37:17 +0800
Message-ID: <1540993041-25611-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

move pvpanic.c from drivers/platform/x86 to drivers/misc.
following patches will use pvpanic device in arm64.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/Kconfig                     | 7 +++++++
 drivers/misc/Makefile                    | 1 +
 drivers/{platform/x86 => misc}/pvpanic.c | 0
 drivers/platform/Kconfig                 | 3 +++
 drivers/platform/Makefile                | 1 +
 drivers/platform/x86/Kconfig             | 8 --------
 drivers/platform/x86/Makefile            | 1 -
 7 files changed, 12 insertions(+), 9 deletions(-)
 rename drivers/{platform/x86 => misc}/pvpanic.c (100%)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 5d71300..ca55c94 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -499,6 +499,13 @@ config MISC_RTSX
 	tristate
 	default MISC_RTSX_PCI || MISC_RTSX_USB
 
+config PVPANIC
+	tristate "pvpanic device support"
+	help
+          This driver provides support for the pvpanic device.  pvpanic is
+          a paravirtualized device provided by QEMU; it lets a virtual machine
+          (guest) communicate panic events to the host.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 20be70c..39dc005 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -57,3 +57,4 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
 obj-$(CONFIG_PCI_ENDPOINT_TEST)	+= pci_endpoint_test.o
 obj-$(CONFIG_OCXL)		+= ocxl/
 obj-$(CONFIG_MISC_RTSX)		+= cardreader/
+obj-$(CONFIG_PVPANIC)  		+= pvpanic.o
diff --git a/drivers/platform/x86/pvpanic.c b/drivers/misc/pvpanic.c
similarity index 100%
rename from drivers/platform/x86/pvpanic.c
rename to drivers/misc/pvpanic.c
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index d4c2e42..8b64b78 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -1,3 +1,6 @@
+if ARM64
+source "drivers/platform/arm/Kconfig"
+endif
 if X86
 source "drivers/platform/x86/Kconfig"
 endif
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index 4b2ce58..232231c 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -3,6 +3,7 @@
 # Makefile for linux/drivers/platform
 #
 
+obj-$(CONFIG_ARM64)               += arm/
 obj-$(CONFIG_X86)		+= x86/
 obj-$(CONFIG_MELLANOX_PLATFORM)	+= mellanox/
 obj-$(CONFIG_MIPS)		+= mips/
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index ef016e4..a6b412e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1119,14 +1119,6 @@ config INTEL_SMARTCONNECT
 	  This driver checks to determine whether the device has Intel Smart
 	  Connect enabled, and if so disables it.
 
-config PVPANIC
-	tristate "pvpanic device support"
-	depends on ACPI
-	---help---
-	  This driver provides support for the pvpanic device.  pvpanic is
-	  a paravirtualized device provided by QEMU; it lets a virtual machine
-	  (guest) communicate panic events to the host.
-
 config INTEL_PMC_IPC
 	tristate "Intel PMC IPC Driver"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 2ba6cb7..a4ec299 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -75,7 +75,6 @@ obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
 obj-$(CONFIG_INTEL_RST)		+= intel-rst.o
 obj-$(CONFIG_INTEL_SMARTCONNECT)	+= intel-smartconnect.o
 
-obj-$(CONFIG_PVPANIC)           += pvpanic.o
 obj-$(CONFIG_ALIENWARE_WMI)	+= alienware-wmi.o
 obj-$(CONFIG_INTEL_PMC_IPC)	+= intel_pmc_ipc.o
 obj-$(CONFIG_SILEAD_DMI)	+= silead_dmi.o
-- 
1.8.3.1
