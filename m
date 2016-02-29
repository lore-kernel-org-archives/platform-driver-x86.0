From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 4/5] dell-wmi: properly process Dell Instant Launch hotkey
Date: Mon, 29 Feb 2016 21:39:15 +0100
Message-ID: <201602292139.16006@pali>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl> <20160229125948.GI21814@pali> <20160229203123.GB23395@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1850018.s2RJWmp2OJ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:33288 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751052AbcB2UjT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 15:39:19 -0500
In-Reply-To: <20160229203123.GB23395@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart1850018.s2RJWmp2OJ
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 29 February 2016 21:31:23 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > > diff --git a/drivers/platform/x86/dell-wmi.c
> > > b/drivers/platform/x86/dell-wmi.c index 65edd93..ffc957b5 100644
> > > --- a/drivers/platform/x86/dell-wmi.c
> > > +++ b/drivers/platform/x86/dell-wmi.c
> > > @@ -111,7 +111,7 @@ static const struct key_entry
> > > dell_wmi_legacy_keymap[] __initconst =3D {
> > >=20
> > >  	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
> > >  =09
> > >  	/* Shortcut and audio panel keys */
> > >=20
> > > -	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
> > > +	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> > >=20
> > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > >  =09
> > >  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
> > >=20
> > > @@ -235,6 +235,9 @@ static void dell_wmi_process_key(int
> > > reported_key)
> > >=20
> > >  	    acpi_video_handles_brightness_key_presses())
> > >  	=09
> > >  		return;
> > >=20
> > > +	if (key->keycode =3D=3D KEY_PROG4 && !wmi_requires_smbios_request)
> > > +		return;
> > > +
> >=20
> > Here I would rather test against reported_key, not keycode. If
> > somebody in future adds KEY_PROG4 for something else we will have
> > problem...
>=20
> As 0xe025 is currently the only event we know about that should be
> ignored on some machines and processed on others, this makes sense,
> at least for now.  If I change the first condition to:
>=20
>     reported_key =3D=3D 0xe025

There will be need also change for 5/5 patch...

> will you be okay with adding your Reviewed-by for this patch?  Then,
> for Darren's convenience, I could post a v5 of the whole series with
> the above change and all your Acked-by and Reviewed-by tags added.

This is my suggestion as I'm thinking about future changes to this=20
driver... But it is also on Darren as maintainer of platform x86=20
subsystem.

Basically you do not want to check if pressed key is KEY_PROG4. But you=20
want to check if dell wmi sent event 0xe025. This is what I say.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1850018.s2RJWmp2OJ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlbUrHMACgkQi/DJPQPkQ1L17ACeLNM2gMghYiJV8N0J2+MccnWZ
XZEAn3r5KEjnLBfHq9eQqlb8s2ySPw+Z
=O7E2
-----END PGP SIGNATURE-----

--nextPart1850018.s2RJWmp2OJ--
