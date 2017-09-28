From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v3 7/8] platform/x86: Kconfig: Change the default settings for dell-wmi-smbios
Date: Wed, 27 Sep 2017 23:02:19 -0500
Message-ID: <1b6211a89b5ab38701b871088997c81496d02a23.1506571188.git.mario.limonciello@dell.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The dell-wmi-smbios driver should be enabled by default when ACPI_WMI
is enabled (like many other WMI drivers).

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 415886d7a857..a83c275019a4 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -94,6 +94,7 @@ config ASUS_LAPTOP
 config DELL_SMBIOS
 	tristate "Dell SMBIOS calling interface"
 	depends on ACPI_WMI
+	default ACPI_WMI
 	---help---
 	This module provides common functions for kernel modules and
         userspace using Dell SMBIOS.
-- 
2.14.1
