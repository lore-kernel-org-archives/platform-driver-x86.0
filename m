From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 1/5] toshiba_acpi: Remove no longer needed hci_{read, write}2 functions
Date: Wed,  6 May 2015 09:35:09 -0600
Message-ID: <1430926513-6264-2-git-send-email-coproscefalo@gmail.com>
References: <1430926513-6264-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430926513-6264-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch removes the hci_{read, write}2 functions from the driver,
and the toshiba_hotkey_event_type_get function was adapted to use the
tci_raw function.

The hci_write2 function was only used by the bluetooth rfkill code,
but since its removal, it was causing build warnings, and the
hci_read2 function was only used by the toshiba_hotkey_event_type_get
function.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 39 +++++++------------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 8ee7c24..e593762 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -355,31 +355,6 @@ static u32 hci_read1(struct toshiba_acpi_dev *dev, u32 reg, u32 *out1)
 	return out[0];
 }
 
-static u32 hci_write2(struct toshiba_acpi_dev *dev, u32 reg, u32 in1, u32 in2)
-{
-	u32 in[TCI_WORDS] = { HCI_SET, reg, in1, in2, 0, 0 };
-	u32 out[TCI_WORDS];
-	acpi_status status = tci_raw(dev, in, out);
-
-	return ACPI_SUCCESS(status) ? out[0] : TOS_FAILURE;
-}
-
-static u32 hci_read2(struct toshiba_acpi_dev *dev,
-		     u32 reg, u32 *out1, u32 *out2)
-{
-	u32 in[TCI_WORDS] = { HCI_GET, reg, *out1, *out2, 0, 0 };
-	u32 out[TCI_WORDS];
-	acpi_status status = tci_raw(dev, in, out);
-
-	if (ACPI_FAILURE(status))
-		return TOS_FAILURE;
-
-	*out1 = out[2];
-	*out2 = out[3];
-
-	return out[0];
-}
-
 /*
  * Common sci tasks
  */
@@ -1190,20 +1165,20 @@ static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
 static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
 					 u32 *type)
 {
-	u32 val1 = 0x03;
-	u32 val2 = 0;
-	u32 result;
+	u32 in[TCI_WORDS] = { HCI_GET, HCI_SYSTEM_INFO, 0x03, 0, 0, 0 };
+	u32 out[TCI_WORDS];
+	acpi_status status;
 
-	result = hci_read2(dev, HCI_SYSTEM_INFO, &val1, &val2);
-	if (result == TOS_FAILURE) {
+	status = tci_raw(dev, in, out);
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get System type failed\n");
 		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	} else if (out[0] == TOS_NOT_SUPPORTED) {
 		pr_info("System type not supported\n");
 		return -ENODEV;
 	}
 
-	*type = val2;
+	*type = out[3];
 
 	return 0;
 }
-- 
2.3.6
