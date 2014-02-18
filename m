From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] thinkpad_acpi: Add mappings for F9 - F12 hotkeys on T440s
Date: Tue, 18 Feb 2014 13:36:39 +0100
Message-ID: <1392726999-30382-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:28301 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754545AbaBRMg5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 Feb 2014 07:36:57 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <matthew.garrett@nebula.com>
Cc: Benjamin Tissoires <btissoir@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

The T440s user guide says that when Fn-lock is not active, the T440s' F=
9 - F12
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
index defb6af..ecb4bc2 100644
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
+		/* Extra keys found on the T440(s) */
+		KEY_CONFIG, KEY_SEARCH, KEY_SCALE, KEY_COMPUTER,
 		},
 	};
=20
--=20
1.8.5.3
