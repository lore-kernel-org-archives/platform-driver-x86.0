From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 2/3] platform/x86: dell-smbios: Rename dell-smbios source to dell-smbios-base
Date: Tue, 27 Feb 2018 09:56:53 -0600
Message-ID: <1519747014-17561-2-git-send-email-mario.limonciello@dell.com>
References: <1519747014-17561-1-git-send-email-mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519747014-17561-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: pali.rohar@gmail.com, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

This is being done to faciliate a later change to link all the dell-smbios
drivers together.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/Makefile                              | 1 +
 drivers/platform/x86/{dell-smbios.c => dell-smbios-base.c} | 0
 2 files changed, 1 insertion(+)
 rename drivers/platform/x86/{dell-smbios.c => dell-smbios-base.c} (100%)

diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index c388608..940b118 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
 obj-$(CONFIG_ACPI_CMPC)		+= classmate-laptop.o
 obj-$(CONFIG_COMPAL_LAPTOP)	+= compal-laptop.o
 obj-$(CONFIG_DELL_SMBIOS)	+= dell-smbios.o
+dell-smbios-objs		:= dell-smbios-base.o
 obj-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
 obj-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
 obj-$(CONFIG_DELL_LAPTOP)	+= dell-laptop.o
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios-base.c
similarity index 100%
rename from drivers/platform/x86/dell-smbios.c
rename to drivers/platform/x86/dell-smbios-base.c
-- 
2.7.4
