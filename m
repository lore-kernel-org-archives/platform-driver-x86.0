From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH linux-3.1.y] ideapad: Check if acpi already handle backlight
 power to avoid a page fault
Date: Tue, 10 Jan 2012 18:42:56 -0600
Message-ID: <20120111004256.GS22184@burratino>
References: <CAFVLVSOp750X4L+qgR16Qc53V+jOKsxA-ujskx3K0BX9kQOzTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:36551 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756710Ab2AKAh7 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 Jan 2012 19:37:59 -0500
Content-Disposition: inline
In-Reply-To: <CAFVLVSOp750X4L+qgR16Qc53V+jOKsxA-ujskx3K0BX9kQOzTw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: stable@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Artem X <artem.brz@gmail.com>, Rene Bolldorf <xsecute@googlemail.com>, Matthew Garrett <mjg@redhat.com>, Ike Panhc <ike.pan@canonical.com>, Corentin Chary <corentin.chary@gmail.com>

=46rom: Ren=C3=A9 Bollford <xsecute@googlemail.com>
Date: Sun, 23 Oct 2011 09:56:42 +0200

commit d4afc7754a60b885b63ef23fd194984e2d53a4e6 upstream.

This patch avoid a page fault in the ideapad-laptop extras when
turning the backlight power on or off.

Signed-off-by: Rene Bolldorf <xsecute@googlemail.com>
Signed-off-by: Matthew Garrett <mjg@redhat.com>
Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
Tested-by: Artem X <artem.brz@gmail.com>
---
Artem X wrote:

> I've compiled vanilla 3.1.6 with that patch and turning off blackligh=
t
> was working.

This fixes an oops reported by a few people in the new ideapad-laptop
backlight driver.  See:

 - http://thread.gmane.org/gmane.linux.kernel/1205259
 - http://thread.gmane.org/gmane.linux.drivers.platform.x86.devel/2405
 - http://bugs.debian.org/655377

Luckily the ideapad-laptop backlight driver was introduced in
v3.1-rc1~14^2~29, so older kernels do not have this bug.  Fix is
already included in v3.2.

 drivers/platform/x86/ideapad-laptop.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x=
86/ideapad-laptop.c
index 0c595410e788..0d94eec00f4d 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -493,6 +493,8 @@ static void ideapad_backlight_notify_power(struct i=
deapad_private *priv)
 	unsigned long power;
 	struct backlight_device *blightdev =3D priv->blightdev;
=20
+	if (!blightdev)
+		return;
 	if (read_ec_data(ideapad_handle, 0x18, &power))
 		return;
 	blightdev->props.power =3D power ? FB_BLANK_UNBLANK : FB_BLANK_POWERD=
OWN;
--=20
1.7.8.3
