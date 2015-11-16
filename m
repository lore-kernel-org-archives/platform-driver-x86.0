From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_bluetooth: Add missing newline in toshiba_bluetooth_present function
Date: Sun, 15 Nov 2015 20:33:47 -0700
Message-ID: <1447644827-404-2-git-send-email-coproscefalo@gmail.com>
References: <1447644827-404-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:33887 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752908AbbKPDeC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 15 Nov 2015 22:34:02 -0500
In-Reply-To: <1447644827-404-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch simply adds a missing newline in the error string printed
by the toshiba_bluetooth_present function.

This is just a cosmetic change, no functionality was changed.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index c5e4508..5db495d 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -78,7 +78,7 @@ static int toshiba_bluetooth_present(acpi_handle handle)
 	 */
 	result = acpi_evaluate_integer(handle, "_STA", NULL, &bt_present);
 	if (ACPI_FAILURE(result)) {
-		pr_err("ACPI call to query Bluetooth presence failed");
+		pr_err("ACPI call to query Bluetooth presence failed\n");
 		return -ENXIO;
 	} else if (!bt_present) {
 		pr_info("Bluetooth device not present\n");
-- 
2.6.2
