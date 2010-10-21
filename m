From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH 1/2] panasonic-laptop: Handle errors properly if they happen
Date: Thu, 21 Oct 2010 11:48:47 +0200
Message-ID: <201010211148.47902.jdelvare@suse.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:60721 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753737Ab0JUJsw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Oct 2010 05:48:52 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Harald Welte <laforge@gnumonks.org>, platform-driver-x86@vger.kernel.org
Cc: Bruno Premont <bonbons@linux-vserver.org>

acpi_pcc_retrieve_biosdata() returns success instead of error if
HKEY.SINF is invalid. Fix this.

Furthermore, if acpi_pcc_retrieve_biosdata() returns an error
during device addition, initialization is properly reverted but value
0 is returned, which means success. This would cause a crash when
later using or removing the device, so fix this too.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Harald Welte <laforge@gnumonks.org>
Cc: Bruno Premont <bonbons@linux-vserver.org>
---
Note: bugs found by code inspection, I don't have the hardware so I
can't test.

Harald, I am not sure what to do in the "Invalid HKEY.SINF data" case
in acpi_pcc_retrieve_biosdata(). For now the driver is ignoring the
case and going on as if nothing happened, but this means some values
in pcc->sinf have undefined values. Shouldn't we return with error in
this case?

Also, I am curious why you are using ACPI_DEBUG_PRINT() for all error
messages? ACPI_DEBUG_PRINT() resolves to nothing by default (I'm not
even sure if it is possible to get it to resolve to actual error
messages without tinkering deep into ACPI header files). Shouldn't we
use ACPI_ERROR(()) instead?

 drivers/platform/x86/panasonic-laptop.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-2.6.36.orig/drivers/platform/x86/panasonic-laptop.c	2010-10-21 10:01:13.000000000 +0200
+++ linux-2.6.36/drivers/platform/x86/panasonic-laptop.c	2010-10-21 11:18:23.000000000 +0200
@@ -285,6 +285,7 @@ static int acpi_pcc_retrieve_biosdata(st
 	hkey = buffer.pointer;
 	if (!hkey || (hkey->type != ACPI_TYPE_PACKAGE)) {
 		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "Invalid HKEY.SINF\n"));
+		status = AE_ERROR;
 		goto end;
 	}
 
@@ -642,6 +643,7 @@ static int acpi_pcc_hotkey_add(struct ac
 	if (!acpi_pcc_retrieve_biosdata(pcc, pcc->sinf)) {
 		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
 				 "Couldn't retrieve BIOS data\n"));
+		result = -EIO;
 		goto out_input;
 	}
 	/* initialize backlight */

-- 
Jean Delvare
Suse L3
