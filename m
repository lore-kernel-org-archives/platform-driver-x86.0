From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 3/4] dell-wmi: Add information about other WMI event codes
Date: Sun, 22 May 2016 13:36:22 +0200
Message-ID: <1463916983-12562-4-git-send-email-pali.rohar@gmail.com>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

ACPI DSDT tables have defined other WMI codes, but does not contain any
description when those codes are emitted. Some other codes can be found=
 in
logs on internet. In this patch are all which I saw, but lot of them ar=
e
not tested properly (e.g. for duplicate events with AT keyboard). Now w=
e
have all WMI event codes at one place and in future after proper testin=
g
those codes can be correctly enabled or disabled...

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-wmi.c |   32 +++++++++++++++++++++++++++++++=
+
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index 363d927..7aac1dc 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -110,6 +110,9 @@ static const struct key_entry dell_wmi_legacy_keyma=
p[] __initconst =3D {
 	/* BIOS error detected */
 	{ KE_IGNORE, 0xe00d, { KEY_RESERVED } },
=20
+	/* Unknown, defined in ACPI DSDT */
+	/* { KE_IGNORE, 0xe00e, { KEY_RESERVED } }, */
+
 	/* Wifi Catcher */
 	{ KE_KEY,    0xe011, { KEY_PROG2 } },
=20
@@ -118,21 +121,45 @@ static const struct key_entry dell_wmi_legacy_key=
map[] __initconst =3D {
=20
 	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
=20
+	/* Unknown, defined in ACPI DSDT */
+	/* { KE_IGNORE, 0xe023, { KEY_RESERVED } }, */
+
+	/* Untested, Dell Instant Launch key on Inspiron 7520 */
+	/* { KE_IGNORE, 0xe024, { KEY_RESERVED } }, */
+
 	/* Dell Instant Launch key */
 	{ KE_KEY,    0xe025, { KEY_PROG4 } },
=20
 	/* Audio panel key */
 	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
=20
+	/* Untested, Multimedia key on Dell Vostro 3560 */
+	/* { KE_IGNORE, 0xe028, { KEY_RESERVED } }, */
+
 	/* Dell Instant Launch key */
 	{ KE_KEY,    0xe029, { KEY_PROG4 } },
=20
+	/* Untested, Windows Mobility Center button on Inspiron 7520 */
+	/* { KE_IGNORE, 0xe02a, { KEY_RESERVED } }, */
+
+	/* Unknown, defined in ACPI DSDT */
+	/* { KE_IGNORE, 0xe02b, { KEY_RESERVED } }, */
+
+	/* Untested, Dell Audio With Preset Switch button on Inspiron 7520 */
+	/* { KE_IGNORE, 0xe02c, { KEY_RESERVED } }, */
+
 	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
 	{ KE_IGNORE, 0xe030, { KEY_VOLUMEUP } },
 	{ KE_IGNORE, 0xe033, { KEY_KBDILLUMUP } },
 	{ KE_IGNORE, 0xe034, { KEY_KBDILLUMDOWN } },
 	{ KE_IGNORE, 0xe03a, { KEY_CAPSLOCK } },
=20
+	/* NIC Link is Up */
+	{ KE_IGNORE, 0xe043, { KEY_RESERVED } },
+
+	/* NIC Link is Down */
+	{ KE_IGNORE, 0xe044, { KEY_RESERVED } },
+
 	/*
 	 * This entry is very suspicious!
 	 * Originally Matthew Garrett created this dell-wmi driver specially =
for
@@ -145,7 +172,12 @@ static const struct key_entry dell_wmi_legacy_keym=
ap[] __initconst =3D {
 	 */
 	{ KE_IGNORE, 0xe045, { KEY_NUMLOCK } },
=20
+	/* Scroll lock and also going to tablet mode on portable devices */
 	{ KE_IGNORE, 0xe046, { KEY_SCROLLLOCK } },
+
+	/* Untested, going from tablet mode on portable devices */
+	/* { KE_IGNORE, 0xe047, { KEY_RESERVED } }, */
+
 	{ KE_IGNORE, 0xe0f7, { KEY_MUTE } },
 	{ KE_IGNORE, 0xe0f8, { KEY_VOLUMEDOWN } },
 	{ KE_IGNORE, 0xe0f9, { KEY_VOLUMEUP } },
--=20
1.7.9.5
