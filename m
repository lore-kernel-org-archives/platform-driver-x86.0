From: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v2 4/5] firmware: dcdbas: Move dcdbas to drivers/platform/x86
Date: Wed, 26 Sep 2018 16:50:20 -0500
Message-ID: <20180926215021.30471-5-stuart.w.hayes@gmail.com>
References: <20180926215021.30471-1-stuart.w.hayes@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926215021.30471-1-stuart.w.hayes@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Doug Warzecha <Douglas_Warzecha@dell.com>, Stuart Hayes <stuart.w.hayes@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Move dcdbas to the more appropriate directory drivers/platform/x86.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
v2 changes:
 - add commit message

 drivers/firmware/Kconfig                    | 16 ----------------
 drivers/firmware/Makefile                   |  1 -
 drivers/platform/x86/Kconfig                | 16 ++++++++++++++++
 drivers/platform/x86/Makefile               |  1 +
 drivers/{firmware => platform/x86}/dcdbas.c |  0
 drivers/{firmware => platform/x86}/dcdbas.h |  0
 drivers/platform/x86/dell-smbios-smm.c      |  2 +-
 7 files changed, 18 insertions(+), 18 deletions(-)
 rename drivers/{firmware => platform/x86}/dcdbas.c (100%)
 rename drivers/{firmware => platform/x86}/dcdbas.h (100%)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 02f39d20efce..6d0c28fd3bad 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -145,22 +145,6 @@ config EFI_PCDP
 	  See DIG64_HCDPv20_042804.pdf available from
 	  <http://www.dig64.org/specifications/> 
 
-config DCDBAS
-	tristate "Dell Systems Management Base Driver"
-	depends on X86
-	help
-	  The Dell Systems Management Base Driver provides a sysfs interface
-	  for systems management software to perform System Management
-	  Interrupts (SMIs) and Host Control Actions (system power cycle or
-	  power off after OS shutdown) on certain Dell systems.
-
-	  See <file:Documentation/dcdbas.txt> for more details on the driver
-	  and the Dell systems on which Dell systems management software makes
-	  use of this driver.
-
-	  Say Y or M here to enable the driver for use by Dell systems
-	  management software such as Dell OpenManage.
-
 config DMIID
     bool "Export DMI identification via sysfs to userspace"
     depends on DMI
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 61887ba9df1d..edda4206d8fc 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -11,7 +11,6 @@ obj-$(CONFIG_DMI)		+= dmi_scan.o
 obj-$(CONFIG_DMI_SYSFS)		+= dmi-sysfs.o
 obj-$(CONFIG_EDD)		+= edd.o
 obj-$(CONFIG_EFI_PCDP)		+= pcdp.o
-obj-$(CONFIG_DCDBAS)		+= dcdbas.o
 obj-$(CONFIG_DMIID)		+= dmi-id.o
 obj-$(CONFIG_ISCSI_IBFT_FIND)	+= iscsi_ibft_find.o
 obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index cb037da32107..1c7e553c28ce 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -105,6 +105,22 @@ config ASUS_LAPTOP
 
 	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
 
+config DCDBAS
+	tristate "Dell Systems Management Base Driver"
+	depends on X86
+	help
+	  The Dell Systems Management Base Driver provides a sysfs interface
+	  for systems management software to perform System Management
+	  Interrupts (SMIs) and Host Control Actions (system power cycle or
+	  power off after OS shutdown) on certain Dell systems.
+
+	  See <file:Documentation/dcdbas.txt> for more details on the driver
+	  and the Dell systems on which Dell systems management software makes
+	  use of this driver.
+
+	  Say Y or M here to enable the driver for use by Dell systems
+	  management software such as Dell OpenManage.
+
 #
 # The DELL_SMBIOS driver depends on ACPI_WMI and/or DCDBAS if those
 # backends are selected. The "depends" line prevents a configuration
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 8843f8e22127..4e2712c9c0b0 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
 obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
 obj-$(CONFIG_ACPI_CMPC)		+= classmate-laptop.o
 obj-$(CONFIG_COMPAL_LAPTOP)	+= compal-laptop.o
+obj-$(CONFIG_DCDBAS)		+= dcdbas.o
 obj-$(CONFIG_DELL_SMBIOS)	+= dell-smbios.o
 dell-smbios-objs		:= dell-smbios-base.o
 dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
diff --git a/drivers/firmware/dcdbas.c b/drivers/platform/x86/dcdbas.c
similarity index 100%
rename from drivers/firmware/dcdbas.c
rename to drivers/platform/x86/dcdbas.c
diff --git a/drivers/firmware/dcdbas.h b/drivers/platform/x86/dcdbas.h
similarity index 100%
rename from drivers/firmware/dcdbas.h
rename to drivers/platform/x86/dcdbas.h
diff --git a/drivers/platform/x86/dell-smbios-smm.c b/drivers/platform/x86/dell-smbios-smm.c
index 97a90bebc360..ab9b822a6dfe 100644
--- a/drivers/platform/x86/dell-smbios-smm.c
+++ b/drivers/platform/x86/dell-smbios-smm.c
@@ -18,7 +18,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include "../../firmware/dcdbas.h"
+#include "dcdbas.h"
 #include "dell-smbios.h"
 
 static int da_command_address;
-- 
2.19.0
