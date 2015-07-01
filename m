From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] dell-laptop: Check return value of all SMBIOS calls and do not cache hwswitch state
Date: Wed, 1 Jul 2015 20:04:45 +0200
Message-ID: <201507012004.45275@pali>
References: <1434875967-13370-3-git-send-email-pali.rohar@gmail.com> <1435390483-10694-1-git-send-email-pali.rohar@gmail.com> <20150629230240.GE57818@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3029086.b3VKBr5NvK";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:32946 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752069AbbGASEt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jul 2015 14:04:49 -0400
In-Reply-To: <20150629230240.GE57818@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

--nextPart3029086.b3VKBr5NvK
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 30 June 2015 01:02:40 Darren Hart wrote:
> On Sat, Jun 27, 2015 at 09:34:43AM +0200, Pali Roh=C3=A1r wrote:
> > Make sure that return value of all SMBIOS calls are properly
> > checked and do not continue of processing (received) information
> > if call failed.
> >=20
> > Also do not chache hwswitch wireless state as it can be changed at
> > runtime (e.g from userspace smbios applications).
>=20
> This "Also do.." tripled the size of the patch. This should really be
> two patches.
>=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > ---
> >=20
> > Changes since v1:
> >  * Call clear_buffer before each sequential SMBIOS call (we expect
> >  zero-filled buffer)
>=20
> Another good independent patch candidate
>=20

Ok, I will split it into 3 patches.

> >  * Do not cache hwswitch state as it can be modified at runtime by
> >  userspace * simplify some conditions
> >=20
> > ---
> >=20
> >  drivers/platform/x86/dell-laptop.c |  173
> >  ++++++++++++++++++++++++++---------- 1 file changed, 127
> >  insertions(+), 46 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/dell-laptop.c
> > b/drivers/platform/x86/dell-laptop.c index 35758cb..99f28d3 100644
> > --- a/drivers/platform/x86/dell-laptop.c
> > +++ b/drivers/platform/x86/dell-laptop.c
>=20
> ...
>=20
> >  static void dell_update_rfkill(struct work_struct *ignored)
> >  {
> >=20
> > +	int hwswitch;
> >=20
> >  	int status;
> >=20
> > +	int ret;
> >=20
> >  	get_buffer();
> >=20
> > +
> >=20
> >  	dell_send_request(buffer, 17, 11);
> >=20
> > +	ret =3D buffer->output[0];
> >=20
> >  	status =3D buffer->output[1];
> >=20
> > +	if (ret !=3D 0)
> > +		goto out;
> > +
> > +	clear_buffer();
> > +
> > +	buffer->input[0] =3D 0x2;
> > +	dell_send_request(buffer, 17, 11);
> > +	ret =3D buffer->output[0];
> > +
> > +	if (ret =3D=3D 0 && (status & BIT(0)))
> > +		hwswitch =3D buffer->output[1];
> > +	else
> > +		hwswitch =3D 0;
>=20
> Initializing hwswitch to 0 above saves the else and assignment line
> here. Generally preferred.
>=20

Ok.

> ...
>=20
> >  static int dell_get_intensity(struct backlight_device *bd)
> >  {
> >=20
> > -	int ret =3D 0;
> > +	int ret;
> > +	int token;
>=20
> Since we're talking respin, declare in order of descending line
> length please, just as you did later when adding token to a
> function.

Ok.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3029086.b3VKBr5NvK
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlWUK70ACgkQi/DJPQPkQ1Ik1QCgrioZsD7wUrP7ukLZbDegWe+n
1jkAoL9iYokoSje5mq3rabHv2iHxklbJ
=UT48
-----END PGP SIGNATURE-----

--nextPart3029086.b3VKBr5NvK--
