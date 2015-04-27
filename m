From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 3/6] toshiba_bluetooth: Clean toshiba_bluetooth_enable function
Date: Mon, 27 Apr 2015 14:32:47 -0600
Message-ID: <1430166770-15060-4-git-send-email-coproscefalo@gmail.com>
References: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:32966 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965285AbbD0UdB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Apr 2015 16:33:01 -0400
In-Reply-To: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch removes unneeded code from the toshiba_bluetooth_enable
function as propper rfkill code as been added now.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index a3b2d38..875ff6c 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -107,33 +107,6 @@ static int toshiba_bluetooth_status(acpi_handle handle)
 static int toshiba_bluetooth_enable(acpi_handle handle)
 {
 	acpi_status result;
-	bool killswitch;
-	bool powered;
-	bool plugged;
-	int status;
-
-	/*
-	 * Query ACPI to verify RFKill switch is set to 'on'.
-	 * If not, we return silently, no need to report it as
-	 * an error.
-	 */
-	status = toshiba_bluetooth_status(handle);
-	if (status < 0)
-		return status;
-
-	killswitch = (status & BT_KILLSWITCH_MASK) ? true : false;
-	powered = (status & BT_POWER_MASK) ? true : false;
-	plugged = (status & BT_PLUGGED_MASK) ? true : false;
-
-	if (!killswitch)
-		return 0;
-	/*
-	 * This check ensures to only enable the device if it is powered
-	 * off or detached, as some recent devices somehow pass the killswitch
-	 * test, causing a loop enabling/disabling the device, see bug 93911.
-	 */
-	if (powered || plugged)
-		return 0;
 
 	result = acpi_evaluate_object(handle, "AUSB", NULL, NULL);
 	if (ACPI_FAILURE(result)) {
-- 
2.3.5
