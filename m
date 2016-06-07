From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2 2/4] dell-wmi: Sort WMI event codes and update comments
Date: Wed,  8 Jun 2016 01:32:25 +0200
Message-ID: <1465342347-20635-3-git-send-email-pali.rohar@gmail.com>
References: <1465342347-20635-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465342347-20635-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Tested-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-wmi.c |   29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index 4d23c91..6750604 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -88,29 +88,29 @@ static const struct dmi_system_id dell_wmi_smbios_l=
ist[] __initconst =3D {
 static const struct key_entry dell_wmi_legacy_keymap[] __initconst =3D=
 {
 	{ KE_IGNORE, 0x003a, { KEY_CAPSLOCK } },
=20
-	{ KE_KEY, 0xe009, { KEY_EJECTCD } },
-
-	/* These also contain the brightness level at offset 6 */
-	{ KE_KEY, 0xe006, { KEY_BRIGHTNESSUP } },
-	{ KE_KEY, 0xe005, { KEY_BRIGHTNESSDOWN } },
+	/* Key code is followed by brightness level */
+	{ KE_KEY,    0xe005, { KEY_BRIGHTNESSDOWN } },
+	{ KE_KEY,    0xe006, { KEY_BRIGHTNESSUP } },
=20
 	/* Battery health status button */
-	{ KE_KEY, 0xe007, { KEY_BATTERY } },
+	{ KE_KEY,    0xe007, { KEY_BATTERY } },
=20
-	/* Radio devices state change */
+	/* Radio devices state change, key code is followed by additional inf=
ormation */
 	{ KE_IGNORE, 0xe008, { KEY_RFKILL } },
=20
-	/* The next device is at offset 6, the active devices are at
-	   offset 8 and the attached devices at offset 10 */
-	{ KE_KEY, 0xe00b, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY,    0xe009, { KEY_EJECTCD } },
+
+	/* Key code is followed by: next device, active devices, attached dev=
ices */
+	{ KE_KEY,    0xe00b, { KEY_SWITCHVIDEOMODE } },
=20
+	/* Key code is followed by keyboard illumination level */
 	{ KE_IGNORE, 0xe00c, { KEY_KBDILLUMTOGGLE } },
=20
 	/* BIOS error detected */
 	{ KE_IGNORE, 0xe00d, { KEY_RESERVED } },
=20
 	/* Wifi Catcher */
-	{ KE_KEY, 0xe011, {KEY_PROG2 } },
+	{ KE_KEY,    0xe011, { KEY_PROG2 } },
=20
 	/* Ambient light sensor toggle */
 	{ KE_IGNORE, 0xe013, { KEY_RESERVED } },
@@ -118,12 +118,14 @@ static const struct key_entry dell_wmi_legacy_key=
map[] __initconst =3D {
 	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
=20
 	/* Dell Instant Launch key */
-	{ KE_KEY, 0xe025, { KEY_PROG4 } },
-	{ KE_KEY, 0xe029, { KEY_PROG4 } },
+	{ KE_KEY,    0xe025, { KEY_PROG4 } },
=20
 	/* Audio panel key */
 	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
=20
+	/* Dell Instant Launch key */
+	{ KE_KEY,    0xe029, { KEY_PROG4 } },
+
 	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
 	{ KE_IGNORE, 0xe030, { KEY_VOLUMEUP } },
 	{ KE_IGNORE, 0xe033, { KEY_KBDILLUMUP } },
@@ -146,6 +148,7 @@ static const struct key_entry dell_wmi_legacy_keyma=
p[] __initconst =3D {
 	{ KE_IGNORE, 0xe0f7, { KEY_MUTE } },
 	{ KE_IGNORE, 0xe0f8, { KEY_VOLUMEDOWN } },
 	{ KE_IGNORE, 0xe0f9, { KEY_VOLUMEUP } },
+
 	{ KE_END, 0 }
 };
=20
--=20
1.7.9.5
