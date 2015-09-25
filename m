From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] platform: x86: PMC IPC depends on ACPI
Date: Fri, 25 Sep 2015 17:38:43 +0100
Message-ID: <1443199123-13979-1-git-send-email-lee.jones@linaro.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:33008 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756344AbbIYQiv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Sep 2015 12:38:51 -0400
Received: by pacex6 with SMTP id ex6so110148055pac.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2015 09:38:50 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: rdunlap@infradead.org, qipeng.zha@intel.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, Lee Jones <lee.jones@linaro.org>

This patch solves:

on x86_64:

when CONFIG_ACPI is not enabled:

../drivers/mfd/intel_soc_pmic_bxtwc.c: In function 'bxtwc_probe':
../drivers/mfd/intel_soc_pmic_bxtwc.c:342:2:
    error: implicit declaration of function 'acpi_evaluate_integer' [-Werror=implicit-function-declaration]
        status = acpi_evaluate_integer(handle, "_HRV", NULL, &hrv);
        ^

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index c69bb70..744cb80 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -914,6 +914,7 @@ config PVPANIC
 
 config INTEL_PMC_IPC
 	tristate "Intel PMC IPC Driver"
+	depends on ACPI
 	---help---
 	This driver provides support for PMC control on some Intel platforms.
 	The PMC is an ARC processor which defines IPC commands for communication
-- 
1.9.1
