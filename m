From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: "Setting old previous keyboard state failed" error on Dell E7270
Date: Thu, 17 Nov 2016 13:19:16 +0100
Message-ID: <201611171319.22434@pali>
References: <s5htwb6wdlm.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5271983.Znkyzlp7Ts";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:37932 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933208AbcKQSHY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2016 13:07:24 -0500
In-Reply-To: <s5htwb6wdlm.wl-tiwai@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, gabriele.mzt@gmail.com

--nextPart5271983.Znkyzlp7Ts
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 17 November 2016 12:27:33 Takashi Iwai wrote:
> Hi,
>=20
> I noticed that a new machine I got yesterday, Dell Latitude E7270,
> always shows the error at boot time:
> 	dell_laptop: Setting old previous keyboard state failed
>=20
>  From what I read from the code, it seems non-fatal.  But is it a way
> to "fix" it?
>=20
> Or shouldn't we simply lower the printk level?
>=20
>=20
> thanks,
>=20
> Takashi

Hi! Month ago I got private email about same problem reported by user.=20
Looks like that Dell changed SMBIOS interface for keyboards and have not=20
notified about it... User wrote that will do some research and write=20
info to mailing list.

So in this case it is not non-fatal warning, but warning which telling=20
us: "you are doing some operation which we do not know what is doing=20
now...".

Masking this warning is not a good idea. There are only two good=20
options:

1) Fix the code so it will work with that changed SMBIOS interface

2) Disable that code on problematic machines.

Anyway, keyboard backlight control in kernel is implemented from program=20
smbios-keyboard-ctl provided and supported by Dell. I do not see any=20
update to that program in upstream git repository.

http://github.com/dell/libsmbios/blob/master/src/bin/smbios-keyboard-ctl

So there are two options what could happen:

1) smbios-keyboard-ctl is working and kernel code not -- in this case=20
bug in kernel, please provide debug logs from both smbios-keyboard-ctl=20
and kernel and I could try to look at it

2) smbios-keyboard-ctl is not working too -- in this case please report=20
bug to that libsmbios project and Dell needs to fix it

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart5271983.Znkyzlp7Ts
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlgtoEoACgkQi/DJPQPkQ1LKjACgilDSdR+NbNUgmKgNSx/o/SrG
DcoAoIq1qYvczYdyupDojEGW0DcMrQnU
=xXyz
-----END PGP SIGNATURE-----

--nextPart5271983.Znkyzlp7Ts--
