From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v3 4/5] dell-wmi: properly process Dell Instant Launch hotkey
Date: Tue, 16 Feb 2016 15:50:29 +0100
Message-ID: <1455634230-1487-5-git-send-email-kernel@kempniu.pl>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On models on which an SMBIOS request needs to be issued in order for WM=
I
events to be generated, pressing the Dell Instant Launch hotkey does no=
t
raise an i8042 interrupt - only a WMI event is generated (0xe025 on Del=
l
Vostro V131).  Thus, the 0xe025 event should only be ignored on machine=
s
which do not require an SMBIOS request for enabling WMI.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-wmi.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index ca8233a..ad7504d 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -111,7 +111,7 @@ static const struct key_entry dell_wmi_legacy_keyma=
p[] __initconst =3D {
 	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
=20
 	/* Shortcut and audio panel keys */
-	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
+	{ KE_KEY, 0xe025, { KEY_PROG4 } },
 	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
=20
 	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
@@ -208,6 +208,9 @@ static void dell_wmi_process_key(int reported_key)
 	    acpi_video_handles_brightness_key_presses())
 		return;
=20
+	if (key->keycode =3D=3D KEY_PROG4 && !wmi_requires_smbios_request)
+		return;
+
 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
 }
=20
--=20
1.7.10.4
