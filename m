From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH] toshiba_acpi: Add dependency on SERIO_I8042
Date: Wed,  3 Jul 2013 08:14:16 -0500
Message-ID: <1372857256-9311-1-git-send-email-seth.forshee@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:41210 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774Ab3GCNO0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 3 Jul 2013 09:14:26 -0400
Received: by mail-ob0-f170.google.com with SMTP id ef5so109958obb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Jul 2013 06:14:25 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>, Azael Avalos <coproscefalo@gmail.com>

Configuring this option as a module with ACPI_TOSHIBA built-in
results in the following errors:

   drivers/built-in.o: In function `toshiba_acpi_remove':
>> toshiba_acpi.c:(.text+0x314bb0): undefined reference to `i8042_remove_filter'
   drivers/built-in.o: In function `toshiba_acpi_add':
>> toshiba_acpi.c:(.devinit.text+0xb822): undefined reference to `i8042_install_filter'
>> toshiba_acpi.c:(.devinit.text+0xb98b): undefined reference to `i8042_remove_filter'

Add a dependency to prevent ACPI_TOSHIBA from being built-in when
SERIO_I8042=m.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Cc: Azael Avalos <coproscefalo@gmail.com>
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 8577261..5b3490f 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -591,6 +591,7 @@ config ACPI_TOSHIBA
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
 	depends on RFKILL || RFKILL = n
+	depends on SERIO_I8042 || SERIO_I8042 = n
 	select INPUT_POLLDEV
 	select INPUT_SPARSEKMAP
 	---help---
-- 
1.8.1.2
