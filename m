From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Possible broken MM code in dell-laptop.c?
Date: Mon, 15 Jun 2015 22:42:30 +0200
Message-ID: <201506152242.30732@pali>
References: <201506141105.07171@pali> <20150615203645.GD83198@vmdeb7>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2946010.OgYTOazmK5";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:35421 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751909AbbFOUme (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Jun 2015 16:42:34 -0400
In-Reply-To: <20150615203645.GD83198@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Stuart Hayes <stuart_hayes@dell.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.cz>, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>

--nextPart2946010.OgYTOazmK5
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 15 June 2015 22:36:45 Darren Hart wrote:
> On Sun, Jun 14, 2015 at 11:05:07AM +0200, Pali Roh=C3=A1r wrote:
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
> > 	if (!bufferpage) {
> > =09
> > 		ret =3D -ENOMEM;
> > 		goto fail_buffer;
> > =09
> > 	}
> > 	buffer =3D page_address(bufferpage);
> > =09
> > 	ret =3D dell_setup_rfkill();
> > =09
> > 	if (ret) {
> > =09
> > 		pr_warn("Unable to setup rfkill\n");
> > 		goto fail_rfkill;
> > =09
> > 	}
> >=20
> > ...
> >=20
> > fail_rfkill:
> > 	free_page((unsigned long)bufferpage);
> >=20
> > fail_buffer:
> > ...
> > }
> >=20
> > Then there is another part:
> >=20
> > static void __exit dell_exit(void)
> > {
> > ...
> >=20
> > 	free_page((unsigned long)buffer);
>=20
> I believe you are correct, and this should be bufferpage. Have you
> observed any failures?

Rmmoding dell-laptop.ko works fine. There is no error in dmesg. I think=20
that buffer (and not bufferpage) should be passed to free_page(). So in=20
my opinion problem is at fail_rfkill: label and not in dell_exit().

But somebody from linux-mm should look at it...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2946010.OgYTOazmK5
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlV/OLYACgkQi/DJPQPkQ1Jk0ACeIGd6oijZXI+02KCAq3JSNibE
TXQAn2qfELLHG8KWLj2yFeTv/L/aR46T
=FGp/
-----END PGP SIGNATURE-----

--nextPart2946010.OgYTOazmK5--
