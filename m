From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2] toshiba_acpi: Make toshiba_eco_mode_available more robust
Date: Mon,  9 Feb 2015 20:55:02 -0700
Message-ID: <1423540502-3214-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:43838 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758615AbbBJDzU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Feb 2015 22:55:20 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Some Toshiba laptops do not come with the ECO led installed, however,
the driver is registering support for it when it should not.

This patch makes the toshiba_eco_mode_available function more robust
in detecting ECO led capabilities, not registering the led on laptops
that do not support it and registering the led when it really does.

The ECO led function now returns 0x8e00 (Not Installed) by querying
with in[3] = 0, whenever theres no physical LED installed, and
returning 0x8300 (Input Data Error) when it is, however, there are
some BIOSes that have stub function calls not returning anything and
and the LED device was being registered too, hence the change of the
default return value from 1 to 0.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
Changes since v1:
- Removed the comment block from the TOS_NOT_INSTALLED check, the
  error code as well as the pr_info message is self explanatory.
- Expanded the comment block from the TOS_INPUT_DATA_ERROR check.
- Expanded the commit log a bit explaining some of the changes made
  in this patch

 drivers/platform/x86/toshiba_acpi.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 8b4a78b..278b4bb 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -108,6 +108,7 @@ MODULE_LICENSE("GPL");
 #define TOS_FIFO_EMPTY			0x8c00
 #define TOS_DATA_NOT_AVAILABLE		0x8d20
 #define TOS_NOT_INITIALIZED		0x8d50
+#define TOS_NOT_INSTALLED		0x8e00
 
 /* registers */
 #define HCI_FAN				0x0004
@@ -701,16 +702,32 @@ static int toshiba_touchpad_get(struct toshiba_acpi_dev *dev, u32 *state)
 static int toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 {
 	acpi_status status;
-	u32 in[TCI_WORDS] = { HCI_GET, HCI_ECO_MODE, 0, 1, 0, 0 };
+	u32 in[TCI_WORDS] = { HCI_GET, HCI_ECO_MODE, 0, 0, 0, 0 };
 	u32 out[TCI_WORDS];
 
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR) {
-		pr_info("ACPI call to get ECO led failed\n");
-		return 0;
+	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+		pr_err("ACPI call to get ECO led failed\n");
+	} else if (out[0] == TOS_NOT_INSTALLED) {
+		pr_info("ECO led not installed");
+	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
+		/* If we receive 0x8300 (Input Data Error), it means that the
+		 * LED device is present, but that we just screwed the input
+		 * parameters.
+		 * 
+		 * Let's query the status of the LED to see if we really have a
+		 * success response, indicating the truly presense of the LED,
+		 * bail out otherwise.
+		 */
+		in[3] = 1;
+		status = tci_raw(dev, in, out);
+		if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE)
+			pr_err("ACPI call to get ECO led failed\n");
+		else if (out[0] == TOS_SUCCESS)
+			return 1;
 	}
 
-	return 1;
+	return 0;
 }
 
 static enum led_brightness toshiba_eco_mode_get_status(struct led_classdev *cdev)
-- 
2.2.2
