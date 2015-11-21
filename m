From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Sat, 21 Nov 2015 01:11:55 +0100
Message-ID: <201511210111.55932@pali>
References: <cover.1447479930.git.luto@kernel.org> <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org> <20151121000636.GG7413@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1828530.BTCeMg2ylm";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:37160 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759721AbbKUAL6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 19:11:58 -0500
Received: by wmww144 with SMTP id w144so40425294wmw.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2015 16:11:57 -0800 (PST)
In-Reply-To: <20151121000636.GG7413@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

--nextPart1828530.BTCeMg2ylm
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 21 November 2015 01:06:36 Darren Hart wrote:
> > -	keymap =3D kcalloc(hotkey_num + 1, sizeof(struct key_entry),
> > GFP_KERNEL); +	keymap =3D kcalloc(hotkey_num +
> > ARRAY_SIZE(dell_wmi_extra_keymap),
>=20
> This previously allocated kotkey_num + 1, but you dropeed the +1,
> making it eactly the size of hotkey_num + the new entries you added.
>=20
> Why don't we need the +1 anymore? (it isn't clear to me why we needed
> to before actually, but I want to confirm you considered it).
>=20

Last entry in keymap array must be KE_END, right? So this is that +1.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1828530.BTCeMg2ylm
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlZPtssACgkQi/DJPQPkQ1LX+gCgnnAponXHrguPZasOYzDYdqAJ
nRoAn3hem17BcarRvz5Cu1C+HRTQc9JN
=VUBB
-----END PGP SIGNATURE-----

--nextPart1828530.BTCeMg2ylm--
