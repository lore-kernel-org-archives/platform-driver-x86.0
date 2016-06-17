From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH][v2] dell-wmi: add a WMI event code for display on/off
Date: Fri, 17 Jun 2016 20:50:27 +0200
Message-ID: <201606172050.27278@pali>
References: <1466135067-28566-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2571718.cVUAumRk2u";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:35653 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097AbcFQSub (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 17 Jun 2016 14:50:31 -0400
Received: by mail-wm0-f44.google.com with SMTP id v199so289430wmv.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jun 2016 11:50:30 -0700 (PDT)
In-Reply-To: <1466135067-28566-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: Alex Hung <alex.hung@canonical.com>, mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

--nextPart2571718.cVUAumRk2u
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 17 June 2016 05:44:27 Alex Hung wrote:
> @@ -133,6 +133,9 @@ static const struct key_entry
> dell_wmi_keymap_type_0000[] __initconst =3D { /* Audio panel key */
>  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
>=20
> +	/* Monitor On/Off Control key */
> +	{ KE_KEY, 0xe027, { KEY_DISPLAYTOGGLE } },

Darren, I would suggest small alignment (as for 0xe026):

   	{ KE_KEY,    0xe027, { KEY_DISPLAYTOGGLE } },

>  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2571718.cVUAumRk2u
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldkRnMACgkQi/DJPQPkQ1Le8gCgltnpM3azu5JLr2hdFeNYURYm
Zv4An1D5NV39QfzWkvAWFEDagxlF0sqo
=HUE6
-----END PGP SIGNATURE-----

--nextPart2571718.cVUAumRk2u--
