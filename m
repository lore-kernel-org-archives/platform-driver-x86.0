From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 5/5] toshiba_acpi: Bump driver version to 0.22
Date: Wed,  6 May 2015 09:35:13 -0600
Message-ID: <1430926513-6264-6-git-send-email-coproscefalo@gmail.com>
References: <1430926513-6264-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430926513-6264-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch simply bumps the driver version to 0.22, as significant
changes were made to the driver, such as cleanups, updated events,
keymap handling, fixes and the bluetooth rfkill code removal.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 2667192..58d6119 100644
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
