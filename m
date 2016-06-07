From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2 1/4] dell-wmi: Ignore WMI event code 0xe045
Date: Wed,  8 Jun 2016 01:32:24 +0200
Message-ID: <1465342347-20635-2-git-send-email-pali.rohar@gmail.com>
References: <1465342347-20635-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33129 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932371AbcFGXcq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2016 19:32:46 -0400
In-Reply-To: <1465342347-20635-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg@redhat.com>

=46rom Dell we know that WMI event code 0xe045 is for Num Lock key, but=
 it is
unclear due to message in commit 0b3f6109f0c9 ("dell-wmi: new driver fo=
r
hotkey control").

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Tested-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Mario Limonciello <mario_limonciello@dell.com>
Link: https://lkml.org/lkml/2015/7/7/830
---
 drivers/platform/x86/dell-wmi.c |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index 15c6f11..4d23c91 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -88,7 +88,6 @@ static const struct dmi_system_id dell_wmi_smbios_lis=
t[] __initconst =3D {
 static const struct key_entry dell_wmi_legacy_keymap[] __initconst =3D=
 {
 	{ KE_IGNORE, 0x003a, { KEY_CAPSLOCK } },
=20
-	{ KE_KEY, 0xe045, { KEY_PROG1 } },
 	{ KE_KEY, 0xe009, { KEY_EJECTCD } },
=20
 	/* These also contain the brightness level at offset 6 */
@@ -130,7 +129,19 @@ static const struct key_entry dell_wmi_legacy_keym=
ap[] __initconst =3D {
 	{ KE_IGNORE, 0xe033, { KEY_KBDILLUMUP } },
 	{ KE_IGNORE, 0xe034, { KEY_KBDILLUMDOWN } },
 	{ KE_IGNORE, 0xe03a, { KEY_CAPSLOCK } },
+
+	/*
+	 * This entry is very suspicious!
+	 * Originally Matthew Garrett created this dell-wmi driver specially =
for
+	 * "button with a picture of a battery" which has event code 0xe045.
+	 * Later Mario Limonciello from Dell told us that event code 0xe045 i=
s
+	 * reported by Num Lock and should be ignored because key is send als=
o
+	 * by keyboard controller.
+	 * So for now we will ignore this event to prevent potential double
+	 * Num Lock key press.
+	 */
 	{ KE_IGNORE, 0xe045, { KEY_NUMLOCK } },
+
 	{ KE_IGNORE, 0xe046, { KEY_SCROLLLOCK } },
 	{ KE_IGNORE, 0xe0f7, { KEY_MUTE } },
 	{ KE_IGNORE, 0xe0f8, { KEY_VOLUMEDOWN } },
--=20
1.7.9.5
