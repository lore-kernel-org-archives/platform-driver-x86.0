From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH RESEND] toshiba_acpi: Initialize hotkey_event_type variable
Date: Wed,  4 Nov 2015 09:28:26 -0700
Message-ID: <1446654506-3730-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Commit 23f8f4326a15 ("toshiba_acpi: Fix hotkeys registration on some
toshiba models") fixed an issue on some laptops regarding hotkeys
registration, however, if failed to address the initialization of the
hotkey_event_type variable, and thus, it can lead to potential
unwanted effects as the variable is being checked.

This patch initializes such variable to avoid such unwanted effects.

Cc: <stable@vger.kernel.org> # 4.1+
Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index beb709f..c013029 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2665,6 +2665,7 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = toshiba_function_keys_get(dev, &dev->special_functions);
 	dev->kbd_function_keys_supported = !ret;
 
+	dev->hotkey_event_type = 0;
 	if (toshiba_acpi_setup_keyboard(dev))
 		pr_info("Unable to activate hotkeys\n");
 
-- 
2.6.2
