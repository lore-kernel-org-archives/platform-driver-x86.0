From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 4/4] toshiba_acpi: Bump driver version to 0.23
Date: Mon, 27 Jul 2015 19:22:28 -0600
Message-ID: <1438046548-3081-6-git-send-email-coproscefalo@gmail.com>
References: <1438046548-3081-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438046548-3081-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Given that some features were added (/dev/toshiba_acpi device), some
clean-ups and minor changes, bump the driver version to 0.23.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 0034341..66954a0 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -31,7 +31,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#define TOSHIBA_ACPI_VERSION	"0.22"
+#define TOSHIBA_ACPI_VERSION	"0.23"
 #define PROC_INTERFACE_VERSION	1
 
 #include <linux/kernel.h>
-- 
2.4.6
