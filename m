From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 11 Jan 2016 21:03:01 +0100
Message-ID: <201601112103.01145@pali>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com> <20160111190411.GE10643@malice.jf.intel.com> <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1953989.BUkrITcQSi";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:38581 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934638AbcAKUDE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 15:03:04 -0500
In-Reply-To: <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Darren Hart <dvhart@infradead.org>, Pavel Machek <pavel@ucw.cz>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

--nextPart1953989.BUkrITcQSi
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 11 January 2016 20:28:00 Henrique de Moraes Holschuh wrote
> The two features are not the same (and are handled differently by the
> firmware, for whatever reason), although they do serve the same
> purpose. I don't think a thinkpad will ever have both features at
> the same time, so I have no idea why they changed the firmware
> interface.

Maybe we should decide if ::kbd_backlight LED suffix could be used also=20
for other LED devices and not only for those which are physically under=20
the keyboard.

At least I understand "keyboard backlight" as light which is under the=20
keyboard...

And more important, I was told that ThinkPad x230 comes in variant with=20
both ThinkLight (that LED upper the display) and keyboard backlight=20
(under they keyboard).

So I'm against merging ThinkLight and keyboard backlight to one sysfs=20
path...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1953989.BUkrITcQSi
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaUCnUACgkQi/DJPQPkQ1KdngCcCdNG7RIcdOiSBPDyrQluTfzF
tnUAnjts7lfUt4uYuJ+dn1JY1Bczfg7O
=i71w
-----END PGP SIGNATURE-----

--nextPart1953989.BUkrITcQSi--
