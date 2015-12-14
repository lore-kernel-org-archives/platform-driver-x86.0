From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] platform/x86: Add rfkill dependency to ACPI_TOSHIBA entry
Date: Mon, 14 Dec 2015 13:00:59 -0700
Message-ID: <1450123259-2638-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:33814 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751317AbbLNUBJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Dec 2015 15:01:09 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Commit 2fdde83443aa ("toshiba_acpi: Add WWAN RFKill support") added
WWAN rfkill support to the driver, but the KConfig entry was not
updated to add the RFKill dependency, causing a broken build if
RFKill is not selected.

This patch adds the RFKILL dependency to the KConfig entry, fixing
the build issue.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1089eaa..25a02f9 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -641,6 +641,7 @@ config ACPI_TOSHIBA
 	depends on INPUT
 	depends on SERIO_I8042 || SERIO_I8042 = n
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on RFKILL || RFKILL = n
 	select INPUT_POLLDEV
 	select INPUT_SPARSEKMAP
 	---help---
-- 
2.6.3
