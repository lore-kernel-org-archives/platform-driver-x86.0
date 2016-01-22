From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Fri, 22 Jan 2016 18:11:49 +0100
Message-ID: <201601221811.49782@pali>
References: <cover.1447479930.git.luto@kernel.org> <20160122082602.GK7192@pali> <56A2518A.5070500@dell.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart11634623.5OaQWHqRIU";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:35686 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754616AbcAVRLx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Jan 2016 12:11:53 -0500
Received: by mail-wm0-f44.google.com with SMTP id r129so221591337wmr.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Jan 2016 09:11:52 -0800 (PST)
In-Reply-To: <56A2518A.5070500@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: "Dominguez, Jared" <Jared_Dominguez@dell.com>, Andy Lutomirski <luto@amacapital.net>, Darren Hart <dvhart@infradead.org>, Andy Lutomirski <luto@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>

--nextPart11634623.5OaQWHqRIU
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 22 January 2016 16:58:02 Mario Limonciello wrote:
> On 01/22/2016 02:26 AM, Pali Roh=C3=A1r wrote:
> > On Thursday 21 January 2016 18:08:38 Mario Limonciello wrote:
> > Hi Mario! Thats truth, but we still needs to know all codes which
> > dell-wmi should ignore (because they will be handled by intel-hid).
> >=20
> > Currently Andy's patch adds three codes which are not specified in
> > vendor-specific DMI table.
> >=20
> > Do you such table of key events which can ACPI/BIOS/WMI send to OS?
>=20
> Hi Pali,
>=20
> Andy conversed with us privately on this, and we double checked with
> our BIOS team on the EC source code for these items that aren't
> mentioned in the DMI table.
> This should now be complete as of current EC feature support.
>=20
> Thanks,

Great! Thank you for info.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart11634623.5OaQWHqRIU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaiYtUACgkQi/DJPQPkQ1JFhwCeOyHVLea/hGFvOzyDLgGcpwCU
I9wAnR7zM9JeWFuBJrktXHaRmoZMjL+O
=8xVg
-----END PGP SIGNATURE-----

--nextPart11634623.5OaQWHqRIU--
