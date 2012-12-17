From: Laurent Navet <laurent.navet@gmail.com>
Subject: [PATCH] driver thinkpad acpi : semantic patch (bool usage)
Date: Mon, 17 Dec 2012 13:35:13 +0100
Message-ID: <1355747714-2843-1-git-send-email-laurent.navet@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:50560 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752403Ab2LQMeg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Dec 2012 07:34:36 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br
Cc: mjg@redhat.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Navet <laurent.navet@gmail.com>

Bool initializations should use true and false.  Bool tests don't need
comparisons.  Based on contributions from Joe Perches, Rusty Russell
and Bruce W Allan.

The semantic patch that makes this output is available
in scripts/coccinelle/misc/boolinit.cocci.

More information about semantic patching is available at
http://coccinelle.lip6.fr/

Signed-off-by: Laurent Navet <laurent.navet@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 75dd651..cb46b6a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3728,7 +3728,7 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 			if (tp_features.hotkey_wlsw &&
 					hkey == TP_HKEY_EV_RFKILL_CHANGED) {
 				tpacpi_send_radiosw_update();
-				send_acpi_ev = 0;
+				send_acpi_ev = false;
 				known_ev = true;
 				break;
 			}
-- 
1.7.10.4
