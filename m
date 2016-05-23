From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3] dell-rbtn: Ignore ACPI notifications if device is suspended
Date: Tue, 24 May 2016 00:22:28 +0200
Message-ID: <201605240022.28140@pali>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com> <201605240006.03580@pali> <20160523221715.GE2735@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3275945.aYp4lR5EcH";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:33230 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751951AbcEWWWb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2016 18:22:31 -0400
In-Reply-To: <20160523221715.GE2735@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "D. Jared Dominguez" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, Andrei Borzenkov <arvidjaar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

--nextPart3275945.aYp4lR5EcH
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 24 May 2016 00:17:15 Darren Hart wrote:
> On Tue, May 24, 2016 at 12:06:03AM +0200, Pali Roh=C3=A1r wrote:
> > On Monday 23 May 2016 23:26:55 Darren Hart wrote:
> > > I've queued this. Thanks for your patience.
> >=20
> > Ok, In that case I would update comments in patch to try it more
> > clear what code is doing.
>=20
> I thought I had your approval on this one Pali. Apologies if that was
> not the case. Did I miss a change request from you?
>=20
> If so, please point me at it, and I'll dequeue this one and wait for
> an updated one.

I just wanted to review that code from somebody else and decide if=20
accept it or not. Because I was not sure if it is OK...

But there was no objection, so patch is OK.

And I pointed that patch could have better comments to describe what it=20
is doing as at first time I was confused.

So I believe that you can update patch in your queue with new version=20
which just change comments in source code (without functional changes).

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3275945.aYp4lR5EcH
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldDgqQACgkQi/DJPQPkQ1JSAwCaAnETD3Geil6kFwUlReVCEsph
ykkAoLh4QtUvlmvFO7OP4flHaqqP6chJ
=Z17y
-----END PGP SIGNATURE-----

--nextPart3275945.aYp4lR5EcH--
