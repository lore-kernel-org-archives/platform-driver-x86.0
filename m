From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 5/5] toshiba_acpi: Bump driver version to 0.22
Date: Mon,  4 May 2015 11:15:58 -0600
Message-ID: <1430759758-4026-6-git-send-email-coproscefalo@gmail.com>
References: <1430759758-4026-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36697 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751538AbbEDRQP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 May 2015 13:16:15 -0400
In-Reply-To: <1430759758-4026-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch simply bumps the driver version to 0.22, as significant
changeswere made to the driver, such as cleanups, updated events,
keymap handling, fixes and the bluetooth rfkill code removal.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index dc38204..d41cf5c 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -31,7 +31,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#define TOSHIBA_ACPI_VERSION	"0.21"
+#define TOSHIBA_ACPI_VERSION	"0.22"
 #define PROC_INTERFACE_VERSION	1
 
 #include <linux/kernel.h>
-- 
2.3.6
