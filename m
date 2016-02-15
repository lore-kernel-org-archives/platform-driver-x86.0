From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 4/5] dell-wmi: Support new hotkeys on the XPS 13 9350 (Skylake)
Date: Mon, 15 Feb 2016 18:20:55 +0100
Message-ID: <201602151820.56085@pali>
References: <cover.1455553470.git.luto@kernel.org> <6492bf46d1042b6d6c80ade8792327797e668d09.1455553470.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2989075.VsED7MQQ9K";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:33620 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380AbcBORU7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Feb 2016 12:20:59 -0500
Received: by mail-wm0-f45.google.com with SMTP id g62so157980191wme.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2016 09:20:58 -0800 (PST)
In-Reply-To: <6492bf46d1042b6d6c80ade8792327797e668d09.1455553470.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario_limonciello@dell.com>

--nextPart2989075.VsED7MQQ9K
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 15 February 2016 17:32:36 Andy Lutomirski wrote:
> +       /* Stealth mode toggle */
> +       { KE_IGNORE, 0x155, { KEY_RESERVED } },

Hi! Just one question, what does this "Stealth mode" means and what this=20
toggle key/button doing?

I would propose for Laptops manufactures to revert back normal=20
nonchiclet keyboard with full 105 normal keys (with F1-F12) instead=20
inventing such useless and crappy/funny names for keys/buttons on=20
laptops which replace PgUP/PgDown/SysRq and etc...

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2989075.VsED7MQQ9K
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlbCCPgACgkQi/DJPQPkQ1JxZgCfTXmV+dd944BXhpimoEmPHhn/
SvsAn3RWCrYyg0BqISKJAH+rgkK9W5Kp
=aQ0r
-----END PGP SIGNATURE-----

--nextPart2989075.VsED7MQQ9K--
