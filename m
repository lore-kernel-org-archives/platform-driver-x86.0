From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v3 5/5] dell-wmi: support Dell Inspiron M5110
Date: Tue, 16 Feb 2016 15:50:30 +0100
Message-ID: <1455634230-1487-6-git-send-email-kernel@kempniu.pl>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:33347 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755264AbcBPOvB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Feb 2016 09:51:01 -0500
Received: by mail-lb0-f173.google.com with SMTP id x4so97364774lbm.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Feb 2016 06:51:00 -0800 (PST)
In-Reply-To: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
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
---
 drivers/platform/x86/dell-wmi.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index ad7504d..650ca45 100644
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
@@ -113,6 +121,7 @@ static const struct key_entry dell_wmi_legacy_keyma=
p[] __initconst =3D {
 	/* Shortcut and audio panel keys */
 	{ KE_KEY, 0xe025, { KEY_PROG4 } },
 	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
+	{ KE_KEY, 0xe029, { KEY_PROG4 } },
=20
 	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
 	{ KE_IGNORE, 0xe030, { KEY_VOLUMEUP } },
--=20
1.7.10.4
