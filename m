From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Sat, 19 Dec 2015 10:59:31 +0100
Message-ID: <201512191059.31643@pali>
References: <20150910043812.GB108260@vmdeb7> <567304EB.6000905@redhat.com> <20151219000253.GA7244@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2287888.Zh15GqtXgH";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:35994 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753544AbbLSJ7g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Dec 2015 04:59:36 -0500
Received: by mail-wm0-f45.google.com with SMTP id p187so13520709wmp.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Dec 2015 01:59:35 -0800 (PST)
In-Reply-To: <20151219000253.GA7244@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Mario Limonciello <mario_limonciello@dell.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

--nextPart2287888.Zh15GqtXgH
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 19 December 2015 01:02:53 Darren Hart wrote:
> On Thu, Dec 17, 2015 at 07:54:35PM +0100, Hans de Goede wrote:
> > Hi,
> >=20
> > On 17-12-15 19:47, Pali Roh=C3=A1r wrote:
> > >Hi Hans! See my comments below about your patches.
>=20
> ...
>=20
> > >>@@ -159,7 +157,8 @@ static void dell_wmi_process_key(int
> > >>reported_key)
> > >>
> > >>  	/* Don't report brightness notifications that will also come
> > >>  	via ACPI */ if ((key->keycode =3D=3D KEY_BRIGHTNESSUP ||
> > >>
> > >>-	     key->keycode =3D=3D KEY_BRIGHTNESSDOWN) && acpi_video)
> > >>+	     key->keycode =3D=3D KEY_BRIGHTNESSDOWN) &&
> > >>+	    acpi_video_handles_brightness_key_presses())
> > >
> > >I do not like this, because that function uses mutex and is called
> > >every time when brightness key event is received by wmi notify
> > >handler.
> >=20
> > Right and this is going to happen 1000-s of times a second so is
> > really going to be a performance problem (not).
> >=20
> > We cannot cache the return value as was being done before because
> > it can change during startup depending in module loading order
> > (the old code actually got this somewhat wrong), and taking a
> > mutex in a code-path which gets executed only once a second tops
> > is really a non issue.
>=20
> Right, this is not a hot path, so the mutex is, indeed, not an issue.

Ok.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2287888.Zh15GqtXgH
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlZ1KoMACgkQi/DJPQPkQ1KkAQCaAmCaaX4MInruv/Oahm2sA4jU
wcUAnisv8ZYAeBucaM6KCBIKJ2aIelRe
=ZS1F
-----END PGP SIGNATURE-----

--nextPart2287888.Zh15GqtXgH--
