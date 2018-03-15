From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] platform/x86: dell: avoid link error with modular ACPI_SMI
Date: Thu, 15 Mar 2018 16:39:07 +0100
Message-ID: <20180315153934.3844276-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mario Limonciello <mario.limonciello@dell.com>, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The new DELL_LAPTOP dependencies allowed one configuration that should not
have been possible, with DELL_SMBIOS_WMI built-in, but ACPI_SMI as a
module:

drivers/platform/x86/dell-smbios-wmi.o: In function `run_smbios_call':
dell-smbios-wmi.c:(.text+0x47): undefined reference to `wmidev_evaluate_method'
drivers/platform/x86/dell-smbios-wmi.o: In function `dell_smbios_wmi_probe':
dell-smbios-wmi.c:(.text+0x5d0): undefined reference to `dell_wmi_get_descriptor_valid'
dell-smbios-wmi.c:(.text+0x60f): undefined reference to `dell_wmi_get_size'
dell-smbios-wmi.c:(.text+0x61f): undefined reference to `dell_wmi_get_hotfix'
dell-smbios-wmi.c:(.text+0x644): undefined reference to `set_required_buffer_size'
drivers/platform/x86/dell-smbios-wmi.o: In function `exit_dell_smbios_wmi':
dell-smbios-wmi.c:(.text+0x78e): undefined reference to `wmi_driver_unregister'

This adds an extra dependency to avoid that case.

Fixes: 41e36f2f85af ("platform/x86: dell-smbios: Link all dell-smbios-* modules together")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I think the plan was to drop the change that caused it. For completeness,
this patch is the last thing that I needed to make randconfig work
reliably again.
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 8383806c360f..0cced065e298 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -122,6 +122,7 @@ config DELL_SMBIOS_WMI
 	bool "Dell SMBIOS driver WMI backend"
 	default y
 	depends on ACPI_WMI
+	depends on ACPI_WMI=y || DELL_SMBIOS=m
 	select DELL_WMI_DESCRIPTOR
 	depends on DELL_SMBIOS
 	---help---
-- 
2.9.0
