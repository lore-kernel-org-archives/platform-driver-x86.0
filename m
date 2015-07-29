From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <stlman@poczta.fm>
Subject: [PATCH v2] asus-laptop: Add key found on Asus F3M
Date: Wed, 29 Jul 2015 21:31:23 +0200
Message-ID: <1438198283-2180-1-git-send-email-stlman@poczta.fm>
References: <20150729044329.GA80946@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtpo.poczta.interia.pl ([217.74.65.205]:51353 "EHLO
	smtpo.poczta.interia.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752429AbbG2TcF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jul 2015 15:32:05 -0400
In-Reply-To: <20150729044329.GA80946@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?=C5=81ukasz=20Stelmach?= <stlman@poczta.fm>

Asus F3M has two keys labeled with an icon of a touchpad. The first,
reported as 0x6B is next to the power key and the second, reported as
0x6A, is F9 combined with Fn button. When I was pressing the latter, I =
was
getting "Unknown key 6a pressed" message before applying this patch.

Asus F3M does not support WMI so the commit does not update key mapping=
s
in the asus-nb-wmi.c file.

I have not tested this mapping on any other Asus laptop.

Signed-off-by: =C5=81ukasz Stelmach <stlman@poczta.fm>
---
 drivers/platform/x86/asus-laptop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/=
asus-laptop.c
index 58d29c4..f2b5d0a 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -332,6 +332,7 @@ static const struct key_entry asus_keymap[] =3D {
 	{KE_KEY, 0x65, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV */
 	{KE_KEY, 0x66, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV */
 	{KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
+	{KE_KEY, 0x6A, { KEY_TOUCHPAD_TOGGLE } }, /* Lock Touchpad Fn + F9 */
 	{KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } }, /* Lock Touchpad */
 	{KE_KEY, 0x6C, { KEY_SLEEP } }, /* Suspend */
 	{KE_KEY, 0x6D, { KEY_SLEEP } }, /* Hibernate */
--=20
2.1.4
