From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: [PATCH] classmate-laptop: should check for NULL as retval for rfkill_alloc
Date: Wed,  9 Jun 2010 16:39:28 -0300
Message-ID: <1276112368-3057-1-git-send-email-cascardo@holoscopio.com>
References: <20100609185803.GB2551@barata.holoscopio.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade2.minaslivre.org ([74.50.53.203]:50510 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932420Ab0FITkK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jun 2010 15:40:10 -0400
In-Reply-To: <20100609185803.GB2551@barata.holoscopio.com>
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
 drivers/platform/x86/classmate-laptop.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
index 3bf399f..a0aaf5b 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -573,9 +573,12 @@ static int cmpc_ipml_add(struct acpi_device *acpi)
 
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
+	if (!ipml->rf) {
 		retval = rfkill_register(ipml->rf);
 		if (retval) {
 			rfkill_destroy(ipml->rf);
-- 
1.7.1

