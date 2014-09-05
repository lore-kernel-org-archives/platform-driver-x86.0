From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/5] toshiba_acpi: Fix illumination not available on certain models
Date: Fri,  5 Sep 2014 11:14:04 -0600
Message-ID: <1409937247-2525-3-git-send-email-coproscefalo@gmail.com>
References: <1409937247-2525-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409937247-2525-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <matthew.garrett@nebula.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Some Toshiba models with illumination support set a different
value on the returned codes, thus not allowing the illumination
LED to be registered, where it should be.

This patch removes a check from toshiba_illumination_available
function to allow such models to register the illumination LED.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index a149bc6..4803e7b 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -436,7 +436,7 @@ static int toshiba_illumination_available(struct toshiba_acpi_dev *dev)
 	if (ACPI_FAILURE(status) || out[0] == HCI_FAILURE) {
 		pr_err("ACPI call to query Illumination support failed\n");
 		return 0;
-	} else if (out[0] == HCI_NOT_SUPPORTED || out[1] != 1) {
+	} else if (out[0] == HCI_NOT_SUPPORTED) {
 		pr_info("Illumination device not available\n");
 		return 0;
 	}
-- 
2.0.0
