From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/3] dell_wmi: Improve unknown hotkey handling
Date: Sat, 21 Nov 2015 01:41:14 +0100
Message-ID: <201511210141.14081@pali>
References: <cover.1447479930.git.luto@kernel.org> <CALCETrUXJfKEEAwk1-cBhDrEtgp6nP0pBGOhuoQc-XRohKtLwA@mail.gmail.com> <20151121002904.GK7413@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2649522.KJpR2XYbh8";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:36561 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760345AbbKUAlR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 19:41:17 -0500
Received: by wmww144 with SMTP id w144so37955371wmw.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2015 16:41:15 -0800 (PST)
In-Reply-To: <20151121002904.GK7413@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

--nextPart2649522.KJpR2XYbh8
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 21 November 2015 01:29:04 Darren Hart wrote:
> Pali, was this something you wanted to discuss more before I merge
> it?

Just one note:

> +		if (keycode =3D=3D 0) {

What about using define KEY_RESERVED instead hardcoded constant 0?

> +			pr_info("firmware scancode %d maps to unrecognized keycode %d\n", bio=
s_entry->keycode, bios_entry->scancode);
> +			continue;
> +		}

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2649522.KJpR2XYbh8
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlZPvaoACgkQi/DJPQPkQ1J/RACgtFH4u6OffPVYInATieb2peC2
2s4AoMUs5+oLROHPkKcXDWNhxhx3MAga
=MhBX
-----END PGP SIGNATURE-----

--nextPart2649522.KJpR2XYbh8--
