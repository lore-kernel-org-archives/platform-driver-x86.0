From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] Sony-laptop: Use common error handling code in
 sony_nc_setup_rfkill()
Date: Mon, 30 Oct 2017 21:15:21 +0100
Message-ID: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:51485 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752062AbdJ3UP6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Oct 2017 16:15:58 -0400
Content-Language: en-GB
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Mattia Dongili <malattia@linux.it>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 21:10:49 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/platform/x86/sony-laptop.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index a16cea2be9c3..3ab6e41a8ed6 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1660,18 +1660,16 @@ static int sony_nc_setup_rfkill(struct acpi_device *device,
 	if (!rfk)
 		return -ENOMEM;
 
-	if (sony_call_snc_handle(sony_rfkill_handle, 0x200, &result) < 0) {
-		rfkill_destroy(rfk);
-		return -1;
-	}
+	if (sony_call_snc_handle(sony_rfkill_handle, 0x200, &result) < 0)
+		goto destroy_rfk;
+
 	hwblock = !(result & 0x1);
 
 	if (sony_call_snc_handle(sony_rfkill_handle,
-				sony_rfkill_address[nc_type],
-				&result) < 0) {
-		rfkill_destroy(rfk);
-		return -1;
-	}
+				 sony_rfkill_address[nc_type],
+				 &result) < 0)
+		goto destroy_rfk;
+
 	swblock = !(result & 0x2);
 
 	rfkill_init_sw_state(rfk, swblock);
@@ -1684,6 +1682,10 @@ static int sony_nc_setup_rfkill(struct acpi_device *device,
 	}
 	sony_rfkill_devices[nc_type] = rfk;
 	return err;
+
+destroy_rfk:
+	rfkill_destroy(rfk);
+	return -1;
 }
 
 static void sony_nc_rfkill_update(void)
-- 
2.14.3
