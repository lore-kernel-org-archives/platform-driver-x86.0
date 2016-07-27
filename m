From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] dell-wmi: Ignore WMI event 0xe00e
Date: Wed, 27 Jul 2016 09:34:42 +0200
Message-ID: <1469604882-22169-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36178 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751289AbcG0Hg0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jul 2016 03:36:26 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario_Limonciello@Dell.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

WMI event 0xe00e is received when battery was removed or inserted.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-wmi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index d2bc092..da2fe18 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -110,8 +110,8 @@ static const struct key_entry dell_wmi_keymap_type_=
0000[] __initconst =3D {
 	/* BIOS error detected */
 	{ KE_IGNORE, 0xe00d, { KEY_RESERVED } },
=20
-	/* Unknown, defined in ACPI DSDT */
-	/* { KE_IGNORE, 0xe00e, { KEY_RESERVED } }, */
+	/* Battery was removed or inserted */
+	{ KE_IGNORE, 0xe00e, { KEY_RESERVED } },
=20
 	/* Wifi Catcher */
 	{ KE_KEY,    0xe011, { KEY_PROG2 } },
--=20
1.7.10.4
