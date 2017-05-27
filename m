From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 16/16] platform/x86: dell-wmi: Convert to the WMI bus infrastructure
Date: Sat, 27 May 2017 12:50:20 +0200
Message-ID: <201705271250.20338@pali>
References: <cover.1495862272.git.dvhart@infradead.org> <4a4da770c8d0af7e3f31e79261b43573d70a6ea6.1495862272.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1629343.TP47SBsL6z";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <4a4da770c8d0af7e3f31e79261b43573d70a6ea6.1495862272.git.dvhart@infradead.org>
Sender: linux-acpi-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Andy Lutomirski <luto@amacapital.net>, Mario Limonciello <mario_limonciello@dell.com>, Rafael Wysocki <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--nextPart1629343.TP47SBsL6z
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 27 May 2017 07:31:30 Darren Hart wrote:
> -	dell_wmi_input_dev->name =3D "Dell WMI hotkeys";
> -	dell_wmi_input_dev->phys =3D "wmi/input0";
> -	dell_wmi_input_dev->id.bustype =3D BUS_HOST;
> +	priv->input_dev->name =3D "Dell WMI hotkeys";
> +	priv->input_dev->id.bustype =3D BUS_HOST;

Is not there BUS_WMI, or something like that? (Just asking)

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1629343.TP47SBsL6z
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlkpWewACgkQi/DJPQPkQ1ILCACfTlr4Uu2nQuGoCJRLc/oo+8Cw
sfoAoKUcKXXOG7VFYWAxo3AVMW5rnL3W
=kvTE
-----END PGP SIGNATURE-----

--nextPart1629343.TP47SBsL6z--
