From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH][v2] dell-wmi: add a WMI event code for display on/off
Date: Fri, 17 Jun 2016 11:44:27 +0800
Message-ID: <1466135067-28566-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:60908 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755124AbcFQDok (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 16 Jun 2016 23:44:40 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com

Some new Dell AIO systems have a button that generates WMI evnet
that is to be used to turn LCD on/off.

Acked-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/dell-wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index b8ad055..8e6c357 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -133,6 +133,9 @@ static const struct key_entry dell_wmi_keymap_type_=
0000[] __initconst =3D {
 	/* Audio panel key */
 	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
=20
+	/* Monitor On/Off Control key */
+	{ KE_KEY, 0xe027, { KEY_DISPLAYTOGGLE } },
+
 	/* Untested, Multimedia key on Dell Vostro 3560 */
 	/* { KE_IGNORE, 0xe028, { KEY_RESERVED } }, */
=20
--=20
2.7.4
