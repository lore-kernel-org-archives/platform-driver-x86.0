From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Possible broken MM code in dell-laptop.c?
Date: Mon, 15 Jun 2015 23:27:59 +0200
Message-ID: <201506152327.59907@pali>
References: <201506141105.07171@pali> <20150615211816.GC16138@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1577752.QXBNijviWD";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:34561 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751933AbbFOV2D (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Jun 2015 17:28:03 -0400
In-Reply-To: <20150615211816.GC16138@dhcp22.suse.cz>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Michal Hocko <mhocko@suse.cz>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Stuart Hayes <stuart_hayes@dell.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org

--nextPart1577752.QXBNijviWD
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 15 June 2015 23:18:16 Michal Hocko wrote:
> On Sun 14-06-15 11:05:07, Pali Roh=C3=A1r wrote:
> > Hello,
> >=20
> > in drivers/platform/x86/dell-laptop.c is this part of code:
> >=20
> > static int __init dell_init(void)
> > {
> > ...
> >=20
> > 	/*
> > =09
> > 	 * Allocate buffer below 4GB for SMI data--only 32-bit physical
> > 	 addr * is passed to SMI handler.
> > 	 */
> > =09
> > 	bufferpage =3D alloc_page(GFP_KERNEL | GFP_DMA32);
>=20
> [...]
>=20
> > 	buffer =3D page_address(bufferpage);
>=20
> [...]
>=20
> > fail_rfkill:
> > 	free_page((unsigned long)bufferpage);
>=20
> This one should be __free_page because it consumes struct page* and
> it is the proper counter part for alloc_page. free_page, just to
> make it confusing, consumes an address which has to be translated to
> a struct page.
>=20
> I have no idea why the API has been done this way and yeah, it is
> really confusing.
>=20
> [...]
>=20
> > static void __exit dell_exit(void)
> > {
> > ...
> >=20
> > 	free_page((unsigned long)buffer);

So both, either:

 free_page((unsigned long)buffer);

or

 __free_page(bufferpage);

is correct?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1577752.QXBNijviWD
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlV/Q18ACgkQi/DJPQPkQ1KMpgCfckKUQ53inI40AC4Hf7EmetC3
w8gAoJhyPBe99vFd5nAPblRsZqtlK56y
=kc+d
-----END PGP SIGNATURE-----

--nextPart1577752.QXBNijviWD--
