From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 4/5] toshiba_acpi: Remove TOS_FAILURE check from some functions
Date: Wed,  6 May 2015 09:35:12 -0600
Message-ID: <1430926513-6264-5-git-send-email-coproscefalo@gmail.com>
References: <1430926513-6264-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430926513-6264-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch removes the check for TOS_FAILURE whenever we are using
the tci_raw function call, as that code is only returned by the
{hci, sci}_{read, write} functions and never by the tci_raw, and
thus making that check irrelevant.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 8a9dacc..2667192 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -366,7 +366,7 @@ static int sci_open(struct toshiba_acpi_dev *dev)
 	acpi_status status;
 
 	status = tci_raw(dev, in, out);
-	if  (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if  (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to open SCI failed\n");
 		return 0;
 	}
@@ -404,7 +404,7 @@ static void sci_close(struct toshiba_acpi_dev *dev)
 	acpi_status status;
 
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to close SCI failed\n");
 		return;
 	}
@@ -452,7 +452,7 @@ static int toshiba_illumination_available(struct toshiba_acpi_dev *dev)
 
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to query Illumination support failed\n");
 		return 0;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
@@ -674,7 +674,7 @@ static int toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 	u32 out[TCI_WORDS];
 
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get ECO led failed\n");
 	} else if (out[0] == TOS_NOT_INSTALLED) {
 		pr_info("ECO led not installed");
@@ -796,7 +796,7 @@ static void toshiba_usb_sleep_charge_available(struct toshiba_acpi_dev *dev)
 		return;
 
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Sleep and Charge mode failed\n");
 		sci_close(dev);
 		return;
@@ -810,7 +810,7 @@ static void toshiba_usb_sleep_charge_available(struct toshiba_acpi_dev *dev)
 
 	in[5] = SCI_USB_CHARGE_BAT_LVL;
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Sleep and Charge mode failed\n");
 		sci_close(dev);
 		return;
@@ -890,7 +890,7 @@ static int toshiba_sleep_functions_status_get(struct toshiba_acpi_dev *dev,
 	in[5] = SCI_USB_CHARGE_BAT_LVL;
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB S&C battery level failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
@@ -919,7 +919,7 @@ static int toshiba_sleep_functions_status_set(struct toshiba_acpi_dev *dev,
 	in[5] = SCI_USB_CHARGE_BAT_LVL;
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to set USB S&C battery level failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
@@ -945,7 +945,7 @@ static int toshiba_usb_rapid_charge_get(struct toshiba_acpi_dev *dev,
 	in[5] = SCI_USB_CHARGE_RAPID_DSP;
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Rapid Charge failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED ||
@@ -973,7 +973,7 @@ static int toshiba_usb_rapid_charge_set(struct toshiba_acpi_dev *dev,
 	in[5] = SCI_USB_CHARGE_RAPID_DSP;
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to set USB Rapid Charge failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-- 
2.3.6
