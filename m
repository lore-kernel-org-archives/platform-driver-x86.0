From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH] dell-wmi-led: Adjust instance of all wmi_evaluate_method calls to 0
Date: Fri, 23 Jun 2017 09:35:21 -0500
Message-ID: <1498228521-2796-1-git-send-email-mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>, Louis Davis <louis.davis@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Pali recently noticed that WMI instances are zero indexed.

The only reason that these calls all worked properly is because the ASL
didn't verify the instance number.

Signed-off-by: Louis Davis <louis.davis@dell.com>
Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-wmi-led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi-led.c b/drivers/platform/x86/dell-wmi-led.c
index a0c7e99..5bedaf7 100644
--- a/drivers/platform/x86/dell-wmi-led.c
+++ b/drivers/platform/x86/dell-wmi-led.c
@@ -68,7 +68,7 @@ static int dell_led_perform_fn(u8 length, u8 result_code, u8 device_id,
 	input.length = sizeof(struct bios_args);
 	input.pointer = &args;
 
-	status = wmi_evaluate_method(DELL_LED_BIOS_GUID, 1, 1, &input, &output);
+	status = wmi_evaluate_method(DELL_LED_BIOS_GUID, 0, 1, &input, &output);
 	if (ACPI_FAILURE(status))
 		return status;
 
-- 
2.7.4
