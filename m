From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] thinkpad_acpi: Fix warning
Date: Mon, 27 Apr 2015 09:45:06 +0200
Message-ID: <20150427094506.0aacec22@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60550 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932161AbbD0HpK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Apr 2015 03:45:10 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi-devel@lists.sourceforge.net
Cc: platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>

Fix the following warning:

warning: "static" is not at beginning of declaration
 void static hotkey_mask_warn_incomplete_mask(void)
 ^

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: Darren Hart <dvhart@infradead.org>
---
 drivers/platform/x86/thinkpad_acpi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-4.1-rc0.orig/drivers/platform/x86/thinkpad_acpi.c	2015-04-26 22:49:27.587460658 +0200
+++ linux-4.1-rc0/drivers/platform/x86/thinkpad_acpi.c	2015-04-27 09:39:10.628031136 +0200
@@ -2093,7 +2093,7 @@ static int hotkey_mask_get(void)
 	return 0;
 }
 
-void static hotkey_mask_warn_incomplete_mask(void)
+static void hotkey_mask_warn_incomplete_mask(void)
 {
 	/* log only what the user can fix... */
 	const u32 wantedmask = hotkey_driver_mask &


-- 
Jean Delvare
SUSE L3 Support
