From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] ideapad: fix software rfkill setting
Date: Sat, 13 Jun 2015 15:23:33 +0200
Message-ID: <5498848.9yV42J8a1L@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:62090 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753319AbbFMNXk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 13 Jun 2015 09:23:40 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@linux.intel.com>, Matthew Garrett <mjg59@srcf.ucam.org>

This fixes a several year old regression that I found while trying
to get the Yoga 3 11 to work. The ideapad_rfk_set function is meant
to send a command to the embedded controller through ACPI, but
as of c1f73658ed, it sends the index of the rfkill device instead
of the command, and ignores the opcode field.

This changes it back to the original behavior, which indeed
flips the rfkill state as seen in the debugfs interface.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: c1f73658ed ("ideapad: pass ideapad_priv as argument (part 2)")
Cc: stable@vger.kernel.org # v2.6.38+

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 6e825201f09a..cb7cd8d79329 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -464,8 +464,9 @@ static const struct ideapad_rfk_data ideapad_rfk_data[] = {
 static int ideapad_rfk_set(void *data, bool blocked)
 {
 	struct ideapad_rfk_priv *priv = data;
+	int opcode = ideapad_rfk_data[priv->dev].opcode;
 
-	return write_ec_cmd(priv->priv->adev->handle, priv->dev, !blocked);
+	return write_ec_cmd(priv->priv->adev->handle, opcode, !blocked);
 }
 
 static struct rfkill_ops ideapad_rfk_ops = {
