From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v4 14/14] platform/x86: Kconfig: Set default for dell-smbios to ACPI_WMI
Date: Wed,  4 Oct 2017 17:48:40 -0500
Message-ID: <cb45a7a7cd3d1b4722d89629e5d54f6ad2e0bc6a.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:47543 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751278AbdJDWsv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2017 18:48:51 -0400
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>

The dell-smbios driver no longer depends on dcdbas, and it should
now be offered with the preferred WMI backend when the WMI bus is
enabled.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index ef597f440d2e..cd9399572156 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -94,6 +94,7 @@ config ASUS_LAPTOP
 config DELL_SMBIOS
 	tristate "Dell SMBIOS calling interface"
 	depends on DELL_SMBIOS_WMI || DELL_SMBIOS_SMM
+	default ACPI_WMI
 	---help---
 	This module provides common functions for kernel modules using
 	Dell SMBIOS.
-- 
2.14.1
