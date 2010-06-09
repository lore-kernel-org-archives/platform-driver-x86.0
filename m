From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: [PATCH] classmate-laptop: should check for NULL as retval for rfkill_alloc
Date: Wed,  9 Jun 2010 16:48:39 -0300
Message-ID: <1276112919-3119-1-git-send-email-cascardo@holoscopio.com>
References: <1276112777.14580.24.camel@jlt3.sipsolutions.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade2.minaslivre.org ([74.50.53.203]:37865 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752496Ab0FITss (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jun 2010 15:48:48 -0400
In-Reply-To: <1276112777.14580.24.camel@jlt3.sipsolutions.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alan-jenkins@tuffmail.co.uk
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Johannes Berg <johannes@sipsolutions.net>, platform-driver-x86@vger.kernel.org, mjg@redhat.com, don@syst.com.br, rpurdie@rpsys.net

rfkill_alloc returns NULL when it fails if RFKILL is enabled. When RFKILL is
disabled, its return value of ERR_PTR(-ENODEV) is OK to use as all rfkill
functions will work with it, as they are simply empty stubs.

Reported-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: platform-driver-x86@vger.kernel.org
Cc: mjg@redhat.com
Cc: don@syst.com.br
Cc: rpurdie@rpsys.net
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
---
 drivers/platform/x86/classmate-laptop.c |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
index 3bf399f..73ea76e 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -573,16 +573,17 @@ static int cmpc_ipml_add(struct acpi_device *acpi)
 
 	ipml->rf = rfkill_alloc("cmpc_rfkill", &acpi->dev, RFKILL_TYPE_WLAN,
 				&cmpc_rfkill_ops, acpi->handle);
-	/* rfkill_alloc may fail if RFKILL is disabled. We should still work
-	 * anyway. */
-	if (!IS_ERR(ipml->rf)) {
+	/*
+	 * If RFKILL is disabled, rfkill_alloc will return ERR_PTR(-ENODEV).
+	 * This is OK, however, since all other uses of the device will not
+	 * derefence it.
+	 */
+	if (ipml->rf) {
 		retval = rfkill_register(ipml->rf);
 		if (retval) {
 			rfkill_destroy(ipml->rf);
 			ipml->rf = NULL;
 		}
-	} else {
-		ipml->rf = NULL;
 	}
 
 	dev_set_drvdata(&acpi->dev, ipml);
-- 
1.7.1

