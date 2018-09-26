From: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v2 3/5] firmware: dell_rbu: Move dell_rbu to drivers/platform/x86
Date: Wed, 26 Sep 2018 16:50:19 -0500
Message-ID: <20180926215021.30471-4-stuart.w.hayes@gmail.com>
References: <20180926215021.30471-1-stuart.w.hayes@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926215021.30471-1-stuart.w.hayes@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Doug Warzecha <Douglas_Warzecha@dell.com>, Stuart Hayes <stuart.w.hayes@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Move dell_rbu to the more appropriate directory drivers/platform/x86.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
v2 changes:
 - add commit message

 drivers/firmware/Kconfig                      | 12 ------------
 drivers/firmware/Makefile                     |  1 -
 drivers/platform/x86/Kconfig                  | 12 ++++++++++++
 drivers/platform/x86/Makefile                 |  1 +
 drivers/{firmware => platform/x86}/dell_rbu.c |  0
 5 files changed, 13 insertions(+), 13 deletions(-)
 rename drivers/{firmware => platform/x86}/dell_rbu.c (100%)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 6e83880046d7..02f39d20efce 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -145,18 +145,6 @@ config EFI_PCDP
 	  See DIG64_HCDPv20_042804.pdf available from
 	  <http://www.dig64.org/specifications/> 
 
-config DELL_RBU
-	tristate "BIOS update support for DELL systems via sysfs"
-	depends on X86
-	select FW_LOADER
-	select FW_LOADER_USER_HELPER
-	help
-	 Say m if you want to have the option of updating the BIOS for your
-	 DELL system. Note you need a Dell OpenManage or Dell Update package (DUP)
-	 supporting application to communicate with the BIOS regarding the new
-	 image for the image update to take effect.
-	 See <file:Documentation/dell_rbu.txt> for more details on the driver.
-
 config DCDBAS
 	tristate "Dell Systems Management Base Driver"
 	depends on X86
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index e18a041cfc53..61887ba9df1d 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -11,7 +11,6 @@ obj-$(CONFIG_DMI)		+= dmi_scan.o
 obj-$(CONFIG_DMI_SYSFS)		+= dmi-sysfs.o
 obj-$(CONFIG_EDD)		+= edd.o
 obj-$(CONFIG_EFI_PCDP)		+= pcdp.o
-obj-$(CONFIG_DELL_RBU)          += dell_rbu.o
 obj-$(CONFIG_DCDBAS)		+= dcdbas.o
 obj-$(CONFIG_DMIID)		+= dmi-id.o
 obj-$(CONFIG_ISCSI_IBFT_FIND)	+= iscsi_ibft_find.o
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0c1aa6c314f5..cb037da32107 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -227,6 +227,18 @@ config DELL_RBTN
 	  To compile this driver as a module, choose M here: the module will
 	  be called dell-rbtn.
 
+config DELL_RBU
+	tristate "BIOS update support for DELL systems via sysfs"
+	depends on X86
+	select FW_LOADER
+	select FW_LOADER_USER_HELPER
+	help
+	 Say m if you want to have the option of updating the BIOS for your
+	 DELL system. Note you need a Dell OpenManage or Dell Update package (DUP)
+	 supporting application to communicate with the BIOS regarding the new
+	 image for the image update to take effect.
+	 See <file:Documentation/dell_rbu.txt> for more details on the driver.
+
 
 config FUJITSU_LAPTOP
 	tristate "Fujitsu Laptop Extras"
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e6d1becf81ce..8843f8e22127 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DELL_WMI_AIO)	+= dell-wmi-aio.o
 obj-$(CONFIG_DELL_WMI_LED)	+= dell-wmi-led.o
 obj-$(CONFIG_DELL_SMO8800)	+= dell-smo8800.o
 obj-$(CONFIG_DELL_RBTN)		+= dell-rbtn.o
+obj-$(CONFIG_DELL_RBU)          += dell_rbu.o
 obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
 obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
diff --git a/drivers/firmware/dell_rbu.c b/drivers/platform/x86/dell_rbu.c
similarity index 100%
rename from drivers/firmware/dell_rbu.c
rename to drivers/platform/x86/dell_rbu.c
-- 
2.19.0
