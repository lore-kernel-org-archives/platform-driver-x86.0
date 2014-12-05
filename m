From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 0/3] dell-wmi: Don't send unneeded keypresses
Date: Fri, 5 Dec 2014 21:31:34 +0100
Message-ID: <201412052131.34455@pali>
References: <1417648583-9336-1-git-send-email-gabriele.mzt@gmail.com> <20141203133431.GG75099@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5085208.aQI5Aj11Yf";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:53995 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751081AbaLEUbh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 5 Dec 2014 15:31:37 -0500
In-Reply-To: <20141203133431.GG75099@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, mjg59@srcf.ucam.org, pavel@ucw.cz, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart5085208.aQI5Aj11Yf
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 03 December 2014 14:34:32 Darren Hart wrote:
> On Thu, Dec 04, 2014 at 12:16:20AM +0100, Gabriele Mazzotta=20
wrote:
> > Currently dell-wmi reports keypresses for WMI events that
> > are notifications of changes performed by the BIOS.
> > This patch series make sure that no keypresses are sent for
> > those events so that nothing is done from userspace.
> >=20
> > Gabriele Mazzotta (3):
> >   dell-wmi: Use appropriate keycode for radio state changes
> >   dell-wmi: Don't report keypresses for radio state changes
>=20
> Merged into one patch, queued.
>=20
> >   dell-wmi: Don't report keypresses on keybord illumination
> >   change
>=20
> Queued.
>=20
> Thanks Gabriele.

Darren, what do you think about sending patch into stable kernel?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart5085208.aQI5Aj11Yf
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlSCFiYACgkQi/DJPQPkQ1JOOgCeL2gHdDFO0WaRHPiORiGZyrwr
hLEAn0K3u/Z7iIc8ccwW/3+RoFK7/ntu
=HXYK
-----END PGP SIGNATURE-----

--nextPart5085208.aQI5Aj11Yf--
