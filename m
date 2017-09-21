From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 12/12] platform/x86: Kconfig: Change the default settings for dell-wmi-smbios
Date: Thu, 21 Sep 2017 08:57:17 -0500
Message-ID: <d5dc0b3aad46caa8e253deb965231e7af0af4458.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The dell-wmi-smbios driver should be enabled by default when ACPI_WMI
is enabled (like many other WMI drivers).

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index a70bcd8caa72..4f9ca51b1968 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -94,6 +94,7 @@ config ASUS_LAPTOP
 config DELL_WMI_SMBIOS
 	tristate "Dell WMI SMBIOS calling interface"
 	depends on ACPI_WMI
+	default ACPI_WMI
 	---help---
 	This module provides common functions for kernel modules using
 	Dell SMBIOS over ACPI-WMI.
-- 
2.14.1
