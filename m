From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/2] dell-wmi: Check if Dell WMI descriptor structure is valid
Date: Tue, 29 Dec 2015 17:05:43 +0100
Message-ID: <201512291705.43939@pali>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com> <201512281508.20683@pali> <20151229124413.GB2467@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3662813.7YN0OWsI29";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:35399 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753282AbbL2QFr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Dec 2015 11:05:47 -0500
In-Reply-To: <20151229124413.GB2467@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart3662813.7YN0OWsI29
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 29 December 2015 13:44:13 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > > > According to Dell WMI document mentioned in ML dicussion
> > > > archived at
> > > > http://www.spinics.net/lists/platform-driver-x86/msg07220.html
> > > > OS should check Dell WMI descriptor structure.
> > >=20
> > > "Should" or "can"?  I skimmed through the ACPI-WMI PDF and
> > > Mario's message again and I couldn't find any explicit statement
> > > urging the reader to check the structure in question before
> > > doing anything else.
> >=20
> > That's questionable... In "Design flow" is first point that WMI
> > descriptor check.
>=20
> Which "Design flow" are you referring to?  Because I found at least
> two: chapter 2.3 and a subsection of chapter 2.3.3.  Funnily enough,
> in both of these locations the WMI Descriptor Method is discussed
> first.
>=20
> Personally, I wouldn't use the structure of that document to draw
> cause-effect conclusions.  Just look at the last chapter (2.3.4),
> which shows how to tell whether the BIOS supports the ACPI-WMI
> interface. Shouldn't that be the first thing to check, before doing
> anything else mentioned in that document?  Yet, it's the last thing
> discussed.
>=20
> Anyway, while the document mentions in several places that the BIOS
> WMI Descriptor object can be queried, it fails to convince me as to
> why this is necessary at all as all values in the returned buffer
> are constant. Perhaps parsing the buffer is useful as a sanity check
> of some kind, but it certainly isn't a prerequisite for performing
> further actions.
>=20
> Given the nature of your patchset, I'd personally rephrase the commit
> message(s) to state that according to your observations, there are
> behavioral differences between models with different versions of the
> WMI Interface, so we parse the WMI Descriptor object to determine
> which WMI Interface version is used on the machine we're running on.
>  Perhaps with an additional word or two that it won't hurt to also
> check the WMI Descriptor object's correctness while we're at it.
>=20
> If you feel like I'm nit-picking and none of the above matters,
> please feel free to disregard my input and just follow your gut.

It's ok. We just understand it quite differently. And in this case what=20
about changing commit message to something like this?

=3D=3D=3D
dell-wmi: Check if Dell WMI descriptor structure is valid

After examining existing DSDT ACPI tables of more laptops and looking=20
into Dell WMI document mentioned in ML dicussion archived at=20
http://www.spinics.net/lists/platform-driver-x86/msg07220.html we will=20
parse and check WMI descriptor if contains expected data. It is because=20
WMI descriptor contains interface version number and it is needed to=20
know in next commit.
=3D=3D=3D

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3662813.7YN0OWsI29
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaCr1cACgkQi/DJPQPkQ1LyFACcDSdrdGM0ll7iqREaIdkzyfgr
v/EAn1rKx7Ys8xsgTdvmyQrUIjn23/I2
=Mtri
-----END PGP SIGNATURE-----

--nextPart3662813.7YN0OWsI29--
