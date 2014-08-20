From: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>
Subject: [PATCH] toshiba_acpi.c - fix busted keyboard backlight logic
Date: Wed, 20 Aug 2014 14:56:43 -0400
Message-ID: <17794.1408561003@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from omr1.cc.vt.edu ([198.82.141.52]:48486 "EHLO omr1.cc.vt.edu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750734AbaHTS44 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 Aug 2014 14:56:56 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, Ari Sundholm <asundhol@cs.hut.fi>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

Both the original and the first attempted patch managed to get the logic wrong.
So we fix it so we only continue if sscanf returns exactly one value, and it
has to be either 1 or 2.  Apparently, programmers are getting out and hacking
code without remembering de Morgan's Laws...

Patch is against the file that results from Ari's revert of the previous
patch.

Signed-Off-By: Valdis Kletnieks <valdis.kletnieks@vt.edu>

--
--- drivers/platform/x86/toshiba_acpi.c.orig	2014-08-20 14:45:52.159898938 -0400
+++ drivers/platform/x86/toshiba_acpi.c	2014-08-20 14:47:55.102444985 -0400
@@ -1258,7 +1258,7 @@ static ssize_t toshiba_kbd_bl_mode_store
 	int mode = -1;
 	int time = -1;
 
-	if (sscanf(buf, "%i", &mode) != 1 && (mode != 2 || mode != 1))
+	if (sscanf(buf, "%i", &mode) != 1 || !(mode == 2 || mode == 1))
 		return -EINVAL;
 
 	/* Set the Keyboard Backlight Mode where:
