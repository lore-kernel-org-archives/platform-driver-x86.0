From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] platform/x86: Add IIO dependency to ACPI_TOSHIBA
Date: Tue, 28 Jun 2016 13:58:55 -0600
Message-ID: <20160628195855.22199-1-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:36147 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752524AbcF1T67 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 15:58:59 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Jonathan Cameron <jic23@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

The toshiba_acpi driver added support to the accelerometer axis
via the IIO subsystem, but failed to add the dependency to the
Kconfig file, making the driver fail to compile if the IIO
subsystem is not selected.

This patch adds a depedency to the IIO subsystem to the
ACPI_TOSHIBA entry in Kconfig to avoid such build failure.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
Darren, Jonathan:
 I just received a few mails from the kbuild test robot informing
 the build failure, as a fix for this I just added a hard dependency
 to IIO, but maybe Jonathan can weigh in and provide me with a better
 alternative (perhaps some ifdefs) as to the hard IIO dependency.

 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index c06bb85..633fc5c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -669,6 +669,7 @@ config ACPI_TOSHIBA
 	depends on SERIO_I8042 || SERIO_I8042 = n
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on RFKILL || RFKILL = n
+	depends on IIO
 	select INPUT_POLLDEV
 	select INPUT_SPARSEKMAP
 	---help---
-- 
2.8.4
