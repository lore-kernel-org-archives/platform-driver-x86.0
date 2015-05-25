From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: dell_rbtn - kernel panic at boot...
Date: Mon, 25 May 2015 08:03:42 +0200
Message-ID: <201505250803.42410@pali>
References: <5875.1432260403@turing-police.cc.vt.edu> <20150525044432.GA38428@fury.dvhart.com> <20150525050121.GA28810@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2011302.aRRUxd70EB";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:35927 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbbEYGDq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 May 2015 02:03:46 -0400
In-Reply-To: <20150525050121.GA28810@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Darren Hart <dvhart@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, lkml <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--nextPart2011302.aRRUxd70EB
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 25 May 2015 07:01:21 Matthew Garrett wrote:
> On Sun, May 24, 2015 at 09:44:32PM -0700, Darren Hart wrote:
> > Greg, Matthew, I'm tempted to recommend this 434 line driver be
> > rolled into dell-laptop.c. Any strong opinions?
>=20
> Mrm. It's slightly conceptually nasty in that one's an ACPI driver
> and one's calling a Dell custom interface, but I think merging them
> is probably the last bad answer.

I think merging does not fix our problem. dell laptop rfkill driver=20
needs to be initialized after dell-rbtn acpi driver register itself.

And dell-laptop and dell-rbtn are two different devices (one dell smbios=20
and one acpi) and it for me it sounds like bad idea too...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2011302.aRRUxd70EB
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlViuz4ACgkQi/DJPQPkQ1LcNQCfWz7tJSkf+R8FDw46RL+zi+L6
rIgAoKaNkW1caLgr2eLhzkyJ4VhTEXVE
=ePqF
-----END PGP SIGNATURE-----

--nextPart2011302.aRRUxd70EB--
