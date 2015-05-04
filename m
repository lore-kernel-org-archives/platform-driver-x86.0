From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 4/5] toshiba_acpi: Remove TOS_FAILURE check from some functions
Date: Mon,  4 May 2015 11:15:57 -0600
Message-ID: <1430759758-4026-5-git-send-email-coproscefalo@gmail.com>
References: <1430759758-4026-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34508 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750899AbbEDRQO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 May 2015 13:16:14 -0400
In-Reply-To: <1430759758-4026-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch removes the check for TOS_FAILURE whenever we are using
the tci_raw function call, as that code is only returned by the
{hci, sci}_{read, write} functions and never by the tci_raw, and
thus making that check irrelevant.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index dca3dd2..dc38204 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -361,7 +361,7 @@ static int sci_open(struct toshiba_acpi_dev *dev)
 	acpi_status status;
 
 	status = tci_raw(dev, in, out);
-	if  (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if  (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to open SCI failed\n");
 		return 0;
 	}
@@ -399,7 +399,7 @@ static void sci_close(struct toshiba_acpi_dev *dev)
 	acpi_status status;
 
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to close SCI failed\n");
 		return;
 	}
@@ -447,7 +447,7 @@ static int toshiba_illumination_available(struct toshiba_acpi_dev *dev)
 
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to query Illumination support failed\n");
 		return 0;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
@@ -669,7 +669,7 @@ static int toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 	u32 out[TCI_WORDS];
 
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get ECO led failed\n");
 	} else if (out[0] == TOS_NOT_INSTALLED) {
 		pr_info("ECO led not installed");
@@ -791,7 +791,7 @@ static void toshiba_usb_sleep_charge_available(struct toshiba_acpi_dev *dev)
 		return;
 
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Sleep and Charge mode failed\n");
 		sci_close(dev);
 		return;
@@ -805,7 +805,7 @@ static void toshiba_usb_sleep_charge_available(struct toshiba_acpi_dev *dev)
 
 	in[5] = SCI_USB_CHARGE_BAT_LVL;
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Sleep and Charge mode failed\n");
 		sci_close(dev);
 		return;
@@ -885,7 +885,7 @@ static int toshiba_sleep_functions_status_get(struct toshiba_acpi_dev *dev,
 	in[5] = SCI_USB_CHARGE_BAT_LVL;
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB S&C battery level failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
@@ -914,7 +914,7 @@ static int toshiba_sleep_functions_status_set(struct toshiba_acpi_dev *dev,
 	in[5] = SCI_USB_CHARGE_BAT_LVL;
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to set USB S&C battery level failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
@@ -940,7 +940,7 @@ static int toshiba_usb_rapid_charge_get(struct toshiba_acpi_dev *dev,
 	in[5] = SCI_USB_CHARGE_RAPID_DSP;
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Rapid Charge failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED ||
@@ -968,7 +968,7 @@ static int toshiba_usb_rapid_charge_set(struct toshiba_acpi_dev *dev,
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
