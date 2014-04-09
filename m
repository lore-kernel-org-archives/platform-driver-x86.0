From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2] thinkpad_acpi: Add mappings for F9 - F12 hotkeys on X240 / T440 / T540
Date: Wed,  9 Apr 2014 11:46:46 +0200
Message-ID: <1397036806-31106-2-git-send-email-hdegoede@redhat.com>
References: <1397036806-31106-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:53903 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932759AbaDIJqw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Apr 2014 05:46:52 -0400
In-Reply-To: <1397036806-31106-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

The T440s user guide says that when Fn-lock is not active, the *40s' F9=
 - F12
keys should be mapped to: control-panel,=C2=A0search, show-all-windows =
and Computer.

These keys generate the sofar unused 28 - 31 hotkey scancodes.

=46or the first 2 this nicely matches the icons on the keys, for the la=
tter 2
the icons are somewhat creative, which is why I ended up looking them u=
p in
the user manual.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x8=
6/thinkpad_acpi.c
index defb6af..8789a26 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3167,8 +3167,10 @@ static int __init hotkey_init(struct ibm_init_st=
ruct *iibm)
 		KEY_MICMUTE,	/* 0x1a: Mic mute (since ?400 or so) */
=20
 		/* (assignments unknown, please report if found) */
-		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 		KEY_UNKNOWN,
+
+		/* Extra keys in use since the X240 / T440 / T540 */
+		KEY_CONFIG, KEY_SEARCH, KEY_SCALE, KEY_COMPUTER,
 		},
 	};
=20
--=20
1.9.0
