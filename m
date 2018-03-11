From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH] platform/x86: dell_smbios: Resolve dependency error on
 ACPI_WMI
Date: Sat, 10 Mar 2018 16:28:59 -0800
Message-ID: <7eb3f317a876a6255aeb0abfd0137894ef8b5166.1520727789.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mario Limonciello <mario.limonciello@dell.com>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: platform-driver-x86.vger.kernel.org

Similarly to DCDBAS for DELL_SMBIOS_SMM, if DELL_SMBIOS_WMI is enabled,
DELL_SMBIOS becomes dependent on ACPI_WMI. Update the depends line to
prevent a configuration where DELL_SMBIOS=y and either backend
dependency =m. Update the comment accordingly.

Cc: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---

Linus, just a heads up on this. Unlikely you would encounter this in
your builds, but just in case, I wanted you to know we (0-day) caught it
and are verifying the fix.

 drivers/platform/x86/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index e55b008..eef5eef 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -106,13 +106,13 @@ config ASUS_LAPTOP
 	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
 
 #
-# If the DELL_SMBIOS_SMM feature is enabled, the DELL_SMBIOS driver
-# becomes dependent on the DCDBAS driver. The "depends" line prevents a
-# configuration where DELL_SMBIOS=y while DCDBAS=m.
+# The DELL_SMBIOS driver depends on ACPI_WMI and/or DCDBAS if those
+# backends are selected. The "depends" line prevents a configuration
+# where DELL_SMBIOS=y while either of those dependencies =m.
 #
 config DELL_SMBIOS
 	tristate "Dell SMBIOS driver"
-	depends on DCDBAS || DCDBAS=n
+	depends on (DCDBAS || DCDBAS=n) && (ACPI_WMI || ACPI_WMI=n)
 	---help---
 	This provides support for the Dell SMBIOS calling interface.
 	If you have a Dell computer you should enable this option.
-- 
2.9.3


-- 
Darren Hart
VMware Open Source Technology Center
