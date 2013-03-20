From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH] Add support for fan button on Ideapad Z580
Date: Wed, 20 Mar 2013 12:34:17 +0200
Message-ID: <5434364.XvFO6bLzbd@ideapad>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f48.google.com ([209.85.214.48]:56490 "EHLO
	mail-bk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750835Ab3CTKeW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 Mar 2013 06:34:22 -0400
Received: by mail-bk0-f48.google.com with SMTP id jf20so713408bkc.35
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Mar 2013 03:34:21 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>
Cc: Ivan Vojtko <nekroman.sk@gmail.com>

From: Maxim Mikityanskiy <maxtram95@gmail.com>

The patch adds support for fan control button on Ideapad Z580. This is
the same button as on Z570, but it raises different bit in
VPCCMD_R_SPECIAL_BUTTONS. Also add message to dmesg when unknown button
press detected, it will help adding support for new special buttons.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Tested-by: Ivan Vojtko <nekroman.sk@gmail.com>
---
--- ideapad-laptop.c
+++ ideapad-laptop.c
@@ -640,7 +640,8 @@
 	for (bit = 0; bit < 16; bit++) {
 		if (test_bit(bit, &value)) {
 			switch (bit) {
-			case 6:
+			case 0:	/* Z580 */
+			case 6:	/* Z570 */
 				/* Thermal Management button */
 				ideapad_input_report(priv, 65);
 				break;
@@ -648,6 +649,9 @@
 				/* OneKey Theater button */
 				ideapad_input_report(priv, 64);
 				break;
+			default:
+				pr_info("Unknown special button: %lu\n", bit);
+				break;
 			}
 		}
 	}
