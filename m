From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 4/5] dell-wmi: properly process Dell Instant Launch hotkey
Date: Mon, 29 Feb 2016 21:56:03 +0100
Message-ID: <201602292156.03876@pali>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl> <201602292139.16006@pali> <20160229204927.GB23568@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2475112.CKeFCBDQnE";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:37092 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbcB2U4H (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 15:56:07 -0500
In-Reply-To: <20160229204927.GB23568@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart2475112.CKeFCBDQnE
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 29 February 2016 21:49:27 you wrote:
> > On Monday 29 February 2016 21:31:23 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > > > > diff --git a/drivers/platform/x86/dell-wmi.c
> > > > > b/drivers/platform/x86/dell-wmi.c index 65edd93..ffc957b5
> > > > > 100644 --- a/drivers/platform/x86/dell-wmi.c
> > > > > +++ b/drivers/platform/x86/dell-wmi.c
> > > > > @@ -111,7 +111,7 @@ static const struct key_entry
> > > > > dell_wmi_legacy_keymap[] __initconst =3D {
> > > > >=20
> > > > >  	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
> > > > >  =09
> > > > >  	/* Shortcut and audio panel keys */
> > > > >=20
> > > > > -	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
> > > > > +	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> > > > >=20
> > > > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > > > >  =09
> > > > >  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
> > > > >=20
> > > > > @@ -235,6 +235,9 @@ static void dell_wmi_process_key(int
> > > > > reported_key)
> > > > >=20
> > > > >  	    acpi_video_handles_brightness_key_presses())
> > > > >  	=09
> > > > >  		return;
> > > > >=20
> > > > > +	if (key->keycode =3D=3D KEY_PROG4 &&
> > > > > !wmi_requires_smbios_request) +		return;
> > > > > +
> > > >=20
> > > > Here I would rather test against reported_key, not keycode. If
> > > > somebody in future adds KEY_PROG4 for something else we will
> > > > have problem...
> > >=20
> > > As 0xe025 is currently the only event we know about that should
> > > be ignored on some machines and processed on others, this makes
> > > sense,
> > >=20
> > > at least for now.  If I change the first condition to:
> > >     reported_key =3D=3D 0xe025
> >=20
> > There will be need also change for 5/5 patch...
>=20
> Why?  Are you aware of any model which sends a 0xe029 WMI event _and_
> generates an i8042 interrupt?  If not, WMI event 0xe029 should always
> be turned into a key event, as per the keymap.

No, but your current patch 4/5 and 5/5 do that (because it checks=20
KEY_PROG4). But if it is not needed, I'm happy because of one hook less.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2475112.CKeFCBDQnE
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlbUsGMACgkQi/DJPQPkQ1IEZwCgm7QkCMVYiYkm5zaEwqpMi+a0
epQAoLfSwTexJIu7Gn5/JeB7SFCr3HS3
=RuEH
-----END PGP SIGNATURE-----

--nextPart2475112.CKeFCBDQnE--
