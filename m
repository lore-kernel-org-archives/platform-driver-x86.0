From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-wmi: Add events created by Dell Rugged 2-in-1s
Date: Wed, 27 Jul 2016 18:05:57 +0200
Message-ID: <201607271805.57123@pali>
References: <1469217684-6643-1-git-send-email-mario_limonciello@dell.com> <20160727072350.GF29844@pali> <1469634909478.10239@Dell.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3541439.JCbx58AKLB";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35643 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756685AbcG0QGA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jul 2016 12:06:00 -0400
In-Reply-To: <1469634909478.10239@Dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario_Limonciello@dell.com
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

--nextPart3541439.JCbx58AKLB
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 27 July 2016 17:55:09 Mario_Limonciello@dell.com wrote:
> > Hi! I'm not sure if KEY_PROG1/2/3 are good names here as we already
> > use
> >
> >those for other actions (see bios_to_linux_keycode). Also there is:
> I had missed this, do you have some recommendations on what would be
> better codes to map this to?

Problem is that I do not know when those KEY_PROG keys from=20
bios_to_linux_keycode table are emitted. There are missing comments or=20
description.

Are you able to find out description for all those keys in that table?=20
Maybe now (when linux key constants are extended), there could be better=20
candidates...

> I'll double check what the things that "were" mapping to KEY_PROG1
> etc actually were.  This might be a case of an expected clash if the
> functions aren't in current generations.
>=20
> >/* Wifi Catcher */
> >
> > { KE_KEY,    0xe011, { KEY_PROG2 } },
>=20
> It's worth mentioning that Wifi Catcher hasn't been used for any Dell
> laptops for a handful generations.  The rugged 2in1's are current
> generation that have these programmable buttons and don't have wifi
> catcher.

Anyway, what is "Wifi Catcher"? HW switch buttton which enable/disable=20
wifi? Or something else?

> So there should be no "real" clash here.

Problem can be in future. This driver is unified for all Dell products=20
with wmi interface and so future product could do some nasty things...

> > But probably we do not have better names...
>=20
> In this particular case, I was thinking PROG1/2/3 were really the
> best option and would be most intuitive because the keys really are
> labels "P1" "P2" and "P3".

Probably yes, as I wrote I do not have in my mind better names for now.

> Here's the front of the tablet:
> http://shop-media.intel.com/api/v2/helperservice/getimage?url=3Dhttp://
> images.icecat.biz/img/norm/high/30031725-706.jpg&height=3D550&width=3D550
>=20
> > Another small cosmetic change: align WMI codes, so 0x157 and 0x850
> > are at some column (similar like are formatted other actions).
>=20
> OK.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3541439.JCbx58AKLB
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAleY2+UACgkQi/DJPQPkQ1IiyQCfTi3KvNRw9EfBjqnfLOpFzyrX
rG4AoLaAVler/rHaBgd34xaztyqKsfLT
=sDql
-----END PGP SIGNATURE-----

--nextPart3541439.JCbx58AKLB--
