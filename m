From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v5 5/5] dell-wmi: support Dell Inspiron M5110
Date: Fri,  4 Mar 2016 14:09:10 +0100
Message-ID: <1457096950-29838-6-git-send-email-kernel@kempniu.pl>
References: <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
 <1457096950-29838-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f195.google.com ([209.85.217.195]:34694 "EHLO
	mail-lb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754272AbcCDNIP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Mar 2016 08:08:15 -0500
Received: by mail-lb0-f195.google.com with SMTP id vk4so4885221lbb.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Mar 2016 05:08:14 -0800 (PST)
In-Reply-To: <1457096950-29838-1-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Similarly to Dell Vostro V131, Dell Inspiron M5110 also requires an
SMBIOS request to be issued in order for WMI events to be generated and
does not raise an i8042 interrupt when the Dell Instant Launch hotkey i=
s
pressed.  However, the event code for that hotkey on this machine is
0xe029, so add it to the legacy keymap.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
Tested-by: Darek Stojaczyk <darek.stojaczyk@gmail.com>
Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-wmi.c |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index 3ea959e..15c6f11 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -62,6 +62,14 @@ static int __init dmi_matched(const struct dmi_syste=
m_id *dmi)
 static const struct dmi_system_id dell_wmi_smbios_list[] __initconst =3D=
 {
 	{
 		.callback =3D dmi_matched,
+		.ident =3D "Dell Inspiron M5110",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron M5110"),
+		},
+	},
+	{
+		.callback =3D dmi_matched,
 		.ident =3D "Dell Vostro V131",
 		.matches =3D {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
@@ -110,8 +118,11 @@ static const struct key_entry dell_wmi_legacy_keym=
ap[] __initconst =3D {
=20
 	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
=20
-	/* Shortcut and audio panel keys */
+	/* Dell Instant Launch key */
 	{ KE_KEY, 0xe025, { KEY_PROG4 } },
+	{ KE_KEY, 0xe029, { KEY_PROG4 } },
+
+	/* Audio panel key */
 	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
=20
 	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
--=20
1.7.10.4
