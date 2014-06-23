From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] thinkpad_acpi: Update mapping for F12 hotkey on *40 models to KEY_FILE
Date: Mon, 23 Jun 2014 13:38:23 +0200
Message-ID: <1403523503-4266-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:7222 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752443AbaFWLiu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Jun 2014 07:38:50 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <matthew.garrett@nebula.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Jamie Lentin <jm@lentin.co.uk>

The new keyboard found on the *40 models is also being sold as a standalone
keyboard (with trackpoint):
http://shop.lenovo.com/us/en/itemdetails/0B47189/460/60AC6A0372B14F5BA7B12F1FF88E33C7

This uses a standard HUT code for the F12 key with the 6 square boxes on it,
which gets mapped to KEY_FILE by the kernel. Change the mapping done of
identical laptop key done by thinkpad_acpi to also send KEY_FILE for
consistency.

Cc: Jamie Lentin <jm@lentin.co.uk>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index d82f196..0fefb24 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3174,7 +3174,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_UNKNOWN,
 
 		/* Extra keys in use since the X240 / T440 / T540 */
-		KEY_CONFIG, KEY_SEARCH, KEY_SCALE, KEY_COMPUTER,
+		KEY_CONFIG, KEY_SEARCH, KEY_SCALE, KEY_FILE,
 		},
 	};
 
-- 
2.0.0
