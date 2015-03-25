From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 3/4] toshiba_bluetooth: Clean toshiba_bluetooth_enable function
Date: Wed, 25 Mar 2015 14:19:16 -0600
Message-ID: <1427314757-18232-4-git-send-email-coproscefalo@gmail.com>
References: <1427314757-18232-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:36861 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752164AbbCYUT2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Mar 2015 16:19:28 -0400
In-Reply-To: <1427314757-18232-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch cleans the toshiba_bluetooth_enable function, removing
some unneeded code and returning appropriate error values.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index b8404c7..0343d20 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -97,29 +97,21 @@ static int toshiba_bluetooth_status(acpi_handle handle)
 
 static int toshiba_bluetooth_enable(acpi_handle handle)
 {
-	acpi_status res1, res2;
-	u64 result;
-
-	/*
-	 * Query ACPI to verify RFKill switch is set to 'on'.
-	 * If not, we return silently, no need to report it as
-	 * an error.
-	 */
-	res1 = acpi_evaluate_integer(handle, "BTST", NULL, &result);
-	if (ACPI_FAILURE(res1))
-		return res1;
-	if (!(result & 0x01))
-		return 0;
+	acpi_status result;
 
-	pr_info("Re-enabling Toshiba Bluetooth\n");
-	res1 = acpi_evaluate_object(handle, "AUSB", NULL, NULL);
-	res2 = acpi_evaluate_object(handle, "BTPO", NULL, NULL);
-	if (!ACPI_FAILURE(res1) || !ACPI_FAILURE(res2))
-		return 0;
+	result = acpi_evaluate_object(handle, "AUSB", NULL, NULL);
+	if (ACPI_FAILURE(result)) {
+		pr_err("Could not attach USB Bluetooth device\n");
+		return -ENXIO;
+	}
 
-	pr_warn("Failed to re-enable Toshiba Bluetooth\n");
+	result = acpi_evaluate_object(handle, "BTPO", NULL, NULL);
+	if (ACPI_FAILURE(result)) {
+		pr_err("Could not power ON Bluetooth device\n");
+		return -ENXIO;
+	}
 
-	return -ENODEV;
+	return 0;
 }
 
 static int toshiba_bluetooth_disable(acpi_handle handle)
-- 
2.2.2
