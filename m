From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 10/14] thinkpad-acpi: acpi_evalf fixes
Date: Wed, 19 May 2010 00:26:20 -0300
Message-ID: <1274239584-17743-11-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:52571 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756165Ab0ESD0g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:36 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Use acpi_format_exception() in acpi_evalf() instead of logging numeric
errors.

Also, when ACPICA returns an error, we should not be touching the return
object, as it is invalid.  In debug mode, acpi_evalf() callers would
printk the returned crap (but fortunately, not use it).

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 877a780..da3a70b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -605,9 +605,10 @@ static int acpi_evalf(acpi_handle handle,
 
 	switch (res_type) {
 	case 'd':		/* int */
-		if (res)
+		success = (status == AE_OK &&
+			   out_obj.type == ACPI_TYPE_INTEGER);
+		if (success && res)
 			*(int *)res = out_obj.integer.value;
-		success = status == AE_OK && out_obj.type == ACPI_TYPE_INTEGER;
 		break;
 	case 'v':		/* void */
 		success = status == AE_OK;
@@ -620,8 +621,8 @@ static int acpi_evalf(acpi_handle handle,
 	}
 
 	if (!success && !quiet)
-		printk(TPACPI_ERR "acpi_evalf(%s, %s, ...) failed: %d\n",
-		       method, fmt0, status);
+		printk(TPACPI_ERR "acpi_evalf(%s, %s, ...) failed: %s\n",
+		       method, fmt0, acpi_format_exception(status));
 
 	return success;
 }
-- 
1.7.1

