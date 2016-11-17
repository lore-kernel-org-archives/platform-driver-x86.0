From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: "Setting old previous keyboard state failed" error on Dell E7270
Date: Thu, 17 Nov 2016 15:20:25 +0100
Message-ID: <201611171520.26866@pali>
References: <s5htwb6wdlm.wl-tiwai@suse.de> <s5hlgwiw8bw.wl-tiwai@suse.de> <s5heg2aw5w8.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3839890.tfXPiRF4cS";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:36848 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750714AbcKQO2S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2016 09:28:18 -0500
In-Reply-To: <s5heg2aw5w8.wl-tiwai@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, gabriele.mzt@gmail.com

--nextPart3839890.tfXPiRF4cS
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 17 November 2016 15:13:59 Takashi Iwai wrote:
> On Thu, 17 Nov 2016 14:21:23 +0100,
>=20
> Takashi Iwai wrote:
> > On Thu, 17 Nov 2016 13:19:16 +0100,
> >=20
> > Pali Roh=C3=A1r wrote:
> > > Anyway, keyboard backlight control in kernel is implemented from
> > > program smbios-keyboard-ctl provided and supported by Dell. I do
> > > not see any update to that program in upstream git repository.
> > >=20
> > > http://github.com/dell/libsmbios/blob/master/src/bin/smbios-keybo
> > > ard-ctl
> >=20
> > I'll give it a try shortly later.
>=20
> Tried the latest git version now, and it didn't work.
> At setting the mode via smbios-keyboard-ctl --set-mode, it always
> return an error like:
>=20
>   Set Trigger Failed. Failed to write config
> 	 Error Return Code : cbRES1: 0x-2 cbRES2: 0xA000000 cbRES3: 0x0
>=20
> The error code is same no matter which mode is to set.
=2E..
> > > 2) smbios-keyboard-ctl is not working too -- in this case please
> > > report bug to that libsmbios project and Dell needs to fix it
>=20
> So the latter case.
> I'm going to ping smbios maintainer.

Ok. Ideally also open public bug report on github tracker so other=20
people can find some information about it...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3839890.tfXPiRF4cS
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlgtvKoACgkQi/DJPQPkQ1Jq2QCgzYOEhcxzPn4XG+mOXcQQWAAJ
80AAn29SAZShW0pc4J5UigKEB59W+o9S
=p2XC
-----END PGP SIGNATURE-----

--nextPart3839890.tfXPiRF4cS--
