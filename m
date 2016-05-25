From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4] dell-rbtn: Ignore ACPI notifications if device is suspended
Date: Wed, 25 May 2016 22:36:55 +0200
Message-ID: <201605252236.55715@pali>
References: <20160524195726.GM2735@f23x64.localdomain> <1464123188-9589-1-git-send-email-gabriele.mzt@gmail.com> <20160525202847.GC109010@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4612199.T4uhKdy8GI";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35026 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751017AbcEYUg7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2016 16:36:59 -0400
In-Reply-To: <20160525202847.GC109010@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, arvidjaar@gmail.com, rjw@rjwysocki.net, Jared_Dominguez@dell.com, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-kernel@vger.kernel.org

--nextPart4612199.T4uhKdy8GI
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 25 May 2016 22:28:47 Darren Hart wrote:
> On Tue, May 24, 2016 at 10:53:08PM +0200, Gabriele Mazzotta wrote:
> > Some BIOSes unconditionally send an ACPI notification to RBTN when
> > the system is resuming from suspend. This makes dell-rbtn send an
> > input event to userspace as if a function key was pressed. Prevent
> > this by ignoring all the notifications received while the device
> > is suspended.
> >=20
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
> > Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
>=20
> Gabriele, please include all the maintainers on Cc (Pali was
> missing).

Hehe, currently I started git send-email with my changes for v4 :D
So doing CTRL+C in terminal...

> Pali, can I have your Reviewed-by?

Yes as my patch differs only in two words (in comments) :-)

Anyway, there is missing Andrei's tested-by (from v2 version).

Maybe also this should go to stable tree?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart4612199.T4uhKdy8GI
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldGDOcACgkQi/DJPQPkQ1JEZQCgpoUmFGUvhdQER9w6MTMX9qMI
JtwAoM4nqOC3VdwtJZJ0YfS2By3ksiLn
=+pwG
-----END PGP SIGNATURE-----

--nextPart4612199.T4uhKdy8GI--
