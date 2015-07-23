From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 4/4] toshiba_acpi: Bump driver version to 0.23
Date: Wed, 22 Jul 2015 19:37:54 -0600
Message-ID: <1437615474-27936-9-git-send-email-coproscefalo@gmail.com>
References: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:33482 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753604AbbGWBiP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jul 2015 21:38:15 -0400
In-Reply-To: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Given that some features were added (/dev/toshiba_acpi device), some
clean-ups and minor changes, bump the driver version to 0.23.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index c099137..ea1bd6d 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -31,7 +31,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#define TOSHIBA_ACPI_VERSION	"0.22"
+#define TOSHIBA_ACPI_VERSION	"0.23"
 #define PROC_INTERFACE_VERSION	1
 
 #include <linux/kernel.h>
-- 
2.4.5
