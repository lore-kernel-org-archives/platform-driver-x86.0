From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH] dell-wmi: add module param to control Dell Instant Launch hotkey processing
Date: Thu, 26 Nov 2015 15:18:32 +0100
Message-ID: <1f6ac54784b39ebb6ce02a9fb9e944c840fddb7b.1448547341.git.kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On some laptop models (e.g. Dell Vostro V131), pressing the Dell Instan=
t
Launch hotkey does not raise an i8042 interrupt - only WMI event 0xe025
is generated.  As there is no flawless way to determine whether a given
machine is capable of simulating a keypress when this hotkey is pressed=
,
a new module parameter is added so that the user can decide whether the
WMI event should be processed or ignored.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
As my last message [1] in the rather lengthy thread failed to elicit an=
y
response, I guess I might just as well post the proposed patch so that
we have something specific to discuss.

[1] http://www.spinics.net/lists/platform-driver-x86/msg07679.html

 drivers/platform/x86/dell-wmi.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index 8cb0f57..e68ce3b 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -44,6 +44,10 @@ MODULE_LICENSE("GPL");
 #define DELL_EVENT_GUID "9DBB5994-A997-11DA-B012-B622A1EF5492"
=20
 static int acpi_video;
+static bool process_dil;
+
+module_param(process_dil, bool, 0644);
+MODULE_PARM_DESC(process_dil, "Generate an input event when the WMI ev=
ent for Dell Instant Launch hotkey is received");
=20
 MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
=20
@@ -87,7 +91,7 @@ static const struct key_entry dell_wmi_legacy_keymap[=
] __initconst =3D {
 	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
=20
 	/* Shortcut and audio panel keys */
-	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
+	{ KE_KEY, 0xe025, { KEY_PROG4 } },
 	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
=20
 	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
@@ -183,6 +187,9 @@ static void dell_wmi_process_key(int reported_key)
 	     key->keycode =3D=3D KEY_BRIGHTNESSDOWN) && acpi_video)
 		return;
=20
+	if (key->keycode =3D=3D KEY_PROG4 && !process_dil)
+		return;
+
 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
 }
=20
--=20
1.7.10.4
