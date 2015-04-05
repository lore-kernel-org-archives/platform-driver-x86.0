From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add me on list of Dell laptop drivers
Date: Sun, 5 Apr 2015 23:11:49 +0200
Message-ID: <201504052311.49832@pali>
References: <1427636330-21091-1-git-send-email-pali.rohar@gmail.com> <20150402051027.GD37152@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart9721009.SJYfShkFRR";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:38538 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752010AbbDEVLx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Apr 2015 17:11:53 -0400
In-Reply-To: <20150402051027.GD37152@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>

--nextPart9721009.SJYfShkFRR
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 02 April 2015 07:10:27 Darren Hart wrote:
> On Sun, Mar 29, 2015 at 03:38:50PM +0200, Pali Roh=C3=A1r wrote:
>=20
> Please include why. No empty commit messages please.
>=20
> For example, you've written nearly a third of the dell-wmi.c
> driver, and all the dell-smo8800.c driver.
>=20

Ok. If you need description include this:

=3D=3D=3D
MAINTAINERS: Add me on list of Dell laptop drivers

I have written more parts of dell laptop drivers dell-laptop.c,=20
dell-wmi.c and dell-smo8800.c
=3D=3D=3D

> Dell Laptop is still pending the keyboard backlight patches
> though I believe (have I missed them?), so you don't
> currently have code ownership there. I agree you should be on
> the MAINTAINERS list, but it would be good to get your
> keyboard backlight changes in first.
>=20

ok.

> Gosh... sure seems like we should have merged that already...
> am I missing something? The last thing I see in master,
> testing, and next is the revert from Jan 21....
>=20

backlight support was merged for 3.19, but has small problem with=20
ALS settings. And then you decided to revert it for 3.19. After=20
that problem was fixed and last (2015-03-06) you wrote that you=20
queued patch again for 4.1 release.

> Also, Matthew, you're the listed maintainer for these, do you
> agree to adding Pali?
>=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > ---
> >=20
> >  MAINTAINERS |    7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 88c09ca..72a08ef 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3058,10 +3058,16 @@ F:	drivers/net/fddi/defxx.*
> >=20
> >  DELL LAPTOP DRIVER
> >  M:	Matthew Garrett <mjg59@srcf.ucam.org>
> >=20
> > +M:	Pali Roh=C3=A1r <pali.rohar@gmail.com>
> >=20
> >  L:	platform-driver-x86@vger.kernel.org
> >  S:	Maintained
> >  F:	drivers/platform/x86/dell-laptop.c
> >=20
> > +DELL LAPTOP FREEFALL DRIVER
> > +M:	Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > +S:	Maintained
> > +F:	drivers/platform/x86/dell-smo8800.c
> > +
> >=20
> >  DELL LAPTOP SMM DRIVER
> >  M:	Guenter Roeck <linux@roeck-us.net>
> >  S:	Maintained
> >=20
> > @@ -3076,6 +3082,7 @@ F:	drivers/firmware/dcdbas.*
> >=20
> >  DELL WMI EXTRAS DRIVER
> >  M:	Matthew Garrett <mjg59@srcf.ucam.org>
> >=20
> > +M:	Pali Roh=C3=A1r <pali.rohar@gmail.com>
> >=20
> >  S:	Maintained
> >  F:	drivers/platform/x86/dell-wmi.c

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart9721009.SJYfShkFRR
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlUhpRUACgkQi/DJPQPkQ1LDTgCfSXQE+Z91UtACujqqXtU+gr4r
2dsAoJ+IJ8FcIHhSolbU1hrStspvOMfq
=EyK5
-----END PGP SIGNATURE-----

--nextPart9721009.SJYfShkFRR--
