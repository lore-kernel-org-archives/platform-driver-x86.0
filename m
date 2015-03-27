From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/3] toshiba_acpi: Fix typos in pr_* messages from USB Fleep Functions
Date: Fri, 27 Mar 2015 15:09:25 -0600
Message-ID: <1427490565-6363-3-git-send-email-coproscefalo@gmail.com>
References: <1427490565-6363-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427490565-6363-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch fixes typos in the pr_* messages from the USB Sleep
Functions.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 595f12c..3bb456c 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -955,11 +955,11 @@ static int toshiba_usb_rapid_charge_get(struct toshiba_acpi_dev *dev,
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
 	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
-		pr_err("ACPI call to get USB S&C battery level failed\n");
+		pr_err("ACPI call to get USB Rapid Charge failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED ||
 		   out[0] == TOS_INPUT_DATA_ERROR) {
-		pr_info("USB Sleep and Charge not supported\n");
+		pr_info("USB Rapid Charge not supported\n");
 		return -ENODEV;
 	}
 
@@ -983,10 +983,10 @@ static int toshiba_usb_rapid_charge_set(struct toshiba_acpi_dev *dev,
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
 	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
-		pr_err("ACPI call to set USB S&C battery level failed\n");
+		pr_err("ACPI call to set USB Rapid Charge failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
+		pr_info("USB Rapid Charge not supported\n");
 		return -ENODEV;
 	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1005,10 +1005,10 @@ static int toshiba_usb_sleep_music_get(struct toshiba_acpi_dev *dev, u32 *state)
 	result = sci_read(dev, SCI_USB_SLEEP_MUSIC, state);
 	sci_close(dev);
 	if (result == TOS_FAILURE) {
-		pr_err("ACPI call to set USB S&C mode failed\n");
+		pr_err("ACPI call to set Sleep and Music mode failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
+		pr_info("Sleep and Music not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1027,10 +1027,10 @@ static int toshiba_usb_sleep_music_set(struct toshiba_acpi_dev *dev, u32 state)
 	result = sci_write(dev, SCI_USB_SLEEP_MUSIC, state);
 	sci_close(dev);
 	if (result == TOS_FAILURE) {
-		pr_err("ACPI call to set USB S&C mode failed\n");
+		pr_err("ACPI call to set Sleep and Music mode failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
+		pr_info("Sleep and Music not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
-- 
2.2.2
