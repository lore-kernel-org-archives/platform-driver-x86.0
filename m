From: Daniel Drake <dsd@laptop.org>
Subject: [PATCH] xo1-rfkill: only act when blocked state is changed
Date: Wed, 18 Apr 2012 18:08:21 +0100 (BST)
Message-ID: <20120418170821.520159D401E@zog.reactivated.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mtaout02-winn.ispmail.ntl.com ([81.103.221.48]:56368 "EHLO
	mtaout02-winn.ispmail.ntl.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751064Ab2DRRIZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 18 Apr 2012 13:08:25 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, pgf@laptop.org, dilinger@queued.net

The XO-1 rfkill driver should only send EC commands when changing
between blocked/unblocked state.

The rfkill switch is asked to be unblocked on every resume (even when
the card was never blocked before) and sending a EC_WLAN_LEAVE_RESET
command here upsets the resume sequence of the libertas driver. Adding
the check to avoid the spurious EC_WLAN_LEAVE_RESET fixes the wifi resume
behaviour.

The rfkill state is maintained by the hardware over suspend/resume
so no extra consideration is needed here.

Signed-off-by: Daniel Drake <dsd@laptop.org>
---
 drivers/platform/x86/xo1-rfkill.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/xo1-rfkill.c b/drivers/platform/x86/xo1-rfkill.c
index 41781ed..b57ad86 100644
--- a/drivers/platform/x86/xo1-rfkill.c
+++ b/drivers/platform/x86/xo1-rfkill.c
@@ -15,15 +15,26 @@
 
 #include <asm/olpc.h>
 
+static bool card_blocked;
+
 static int rfkill_set_block(void *data, bool blocked)
 {
 	unsigned char cmd;
+	int r;
+
+	if (blocked == card_blocked)
+		return 0;
+
 	if (blocked)
 		cmd = EC_WLAN_ENTER_RESET;
 	else
 		cmd = EC_WLAN_LEAVE_RESET;
 
-	return olpc_ec_cmd(cmd, NULL, 0, NULL, 0);
+	r = olpc_ec_cmd(cmd, NULL, 0, NULL, 0);
+	if (r == 0)
+		card_blocked = blocked;
+
+	return r;
 }
 
 static const struct rfkill_ops rfkill_ops = {
-- 
1.7.7.6
