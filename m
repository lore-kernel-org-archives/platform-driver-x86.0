From: Bastien Nocera <hadess@hadess.net>
Subject: [PATCH] thinkpad_acpi: support HKEY interface version 0x200
Date: Tue, 19 Apr 2016 13:11:34 +0200
Message-ID: <1461064294-2879-1-git-send-email-hadess@hadess.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow1-d.mail.gandi.net ([217.70.178.86]:34763 "EHLO
	slow1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752373AbcDSLQR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Apr 2016 07:16:17 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id 98CE047AFC4
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Apr 2016 13:11:40 +0200 (CEST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Shuduo Sang <shuduo.sang@canonical.com>, Bruce Ma <bruce.ma@canonical.com>

From: Shuduo Sang <shuduo.sang@canonical.com>

The Thinkpad X1 Carbon 2nd generation (2014) ships with BIOS that will
return HKEY interface version 0x200. It needs thinkpad-acpi support
otherwise it will be routed to wrong branch and the hotkey mask will
be wrong.

https://bugzilla.kernel.org/show_bug.cgi?id=114731

Signed-off-by: Bruce Ma <bruce.ma@canonical.com>
Signed-off-by: Shuduo Sang <shuduo.sang@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index dad2984..c177936 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3357,11 +3357,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	   A30, R30, R31, T20-22, X20-21, X22-24.  Detected by checking
 	   for HKEY interface version 0x100 */
 	if (acpi_evalf(hkey_handle, &hkeyv, "MHKV", "qd")) {
-		if ((hkeyv >> 8) != 1) {
-			pr_err("unknown version of the HKEY interface: 0x%x\n",
-			       hkeyv);
-			pr_err("please report this to %s\n", TPACPI_MAIL);
-		} else {
+		switch (hkeyv >> 8) {
+		case 1:
 			/*
 			 * MHKV 0x100 in A31, R40, R40e,
 			 * T4x, X31, and later
@@ -3381,6 +3378,34 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 			} else {
 				tp_features.hotkey_mask = 1;
 			}
+			break;
+
+		case 2:
+			/*
+			 * MHKV 0x200 in X1
+			 */
+			vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
+				"firmware HKEY interface version: 0x%x\n",
+				hkeyv);
+
+			/* Paranoia check AND init hotkey_all_mask */
+			if (!acpi_evalf(hkey_handle, &hotkey_all_mask,
+					"MHKA", "dd", 1)) {
+				pr_err("missing MHKA handler, "
+					"please report this to %s\n",
+					TPACPI_MAIL);
+				/* Fallback: pre-init for FN+F3,F4,F12 */
+				hotkey_all_mask = 0x080cU;
+			} else {
+				tp_features.hotkey_mask = 1;
+			}
+			break;
+
+		default:
+			pr_err("unknown version of the HKEY interface: 0x%x\n",
+			       hkeyv);
+			pr_err("please report this to %s\n", TPACPI_MAIL);
+			break;
 		}
 	}
 
-- 
2.7.3
