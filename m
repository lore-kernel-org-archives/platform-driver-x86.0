From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/3] platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
Date: Mon, 24 Nov 2014 23:01:54 +0100
Message-ID: <201411242301.55012@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <201411242155.48087@pali> <20141124215026.GA14361@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1984965.SaYcFr637E";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:54329 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750729AbaKXWB6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 24 Nov 2014 17:01:58 -0500
In-Reply-To: <20141124215026.GA14361@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>

--nextPart1984965.SaYcFr637E
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 24 November 2014 22:50:26 Matthew Garrett wrote:
> On Mon, Nov 24, 2014 at 09:55:47PM +0100, Pali Roh=C3=A1r wrote:
> > This is complicated. HW switch controls all radio devices
> > and you do not know which are present in specified running
> > machine. Also list of devices which HW switch controls can
> > be edited in BIOS (on some machines). So what to do? We
> > only know that it controls some devices...
>=20
> Typically there'll be a firmware method that provides a mask
> of the controlled devices. Do you have the ACPI tables for a
> device that implements this? Registering an rfkill interface
> that claims to only control wifi but which also kills other
> devices is likely to confuse userspace - it would probably be
> better to avoid registering the rfkill interface at all in
> that case.

Currently you cannot control soft state of rfkill. It receive=20
events when hard state was changed and update hard rfkill status=20
(if is enabled or disabled).

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1984965.SaYcFr637E
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlRzqtMACgkQi/DJPQPkQ1LgAwCePI66O6RkHqKOhqVPa8eLju9/
czcAoLiVkd0bx2TT9xm3/NqqLWV54h58
=2ZFn
-----END PGP SIGNATURE-----

--nextPart1984965.SaYcFr637E--
