From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Fri, 22 Jan 2016 09:58:02 -0600
Message-ID: <56A2518A.5070500@dell.com>
References: <cover.1447479930.git.luto@kernel.org>
 <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org>
 <20151121000636.GG7413@malice.jf.intel.com>
 <CALCETrVz+4CX=rjY5OZfCSGQDcgW1oQe6t8d9940ubQKDv-Eqg@mail.gmail.com>
 <20151122020414.GR16374@dell.com> <20151123145351.GG24147@pali>
 <20160121101711.GY7192@pali> <56A17306.3010503@dell.com>
 <20160122082602.GK7192@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="J719bhgB4SovujDVPWQAQisfQSN1BFt4D"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60pc101.us.dell.com ([143.166.85.206]:32345 "EHLO
	ausc60pc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751975AbcAVQLM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Jan 2016 11:11:12 -0500
In-Reply-To: <20160122082602.GK7192@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: "Dominguez, Jared" <Jared_Dominguez@DELL.com>, Andy Lutomirski <luto@amacapital.net>, Darren Hart <dvhart@infradead.org>, Andy Lutomirski <luto@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--J719bhgB4SovujDVPWQAQisfQSN1BFt4D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 01/22/2016 02:26 AM, Pali Roh=C3=A1r wrote:
> On Thursday 21 January 2016 18:08:38 Mario Limonciello wrote:
> Hi Mario! Thats truth, but we still needs to know all codes which
> dell-wmi should ignore (because they will be handled by intel-hid).
>
> Currently Andy's patch adds three codes which are not specified in
> vendor-specific DMI table.
>
> Do you such table of key events which can ACPI/BIOS/WMI send to OS?
Hi Pali,

Andy conversed with us privately on this, and we double checked with our
BIOS team on the EC source code for these items that aren't mentioned in
the DMI table.
This should now be complete as of current EC feature support.

Thanks,


--J719bhgB4SovujDVPWQAQisfQSN1BFt4D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlaiUYoACgkQ2CrZjkA73Yvp2QCeO2AW0IbNyTqLMvnkmWSmT6nS
9soAn3b3l6lqTkD+nVkJ8IhP0BNgYcjc
=cBKK
-----END PGP SIGNATURE-----

--J719bhgB4SovujDVPWQAQisfQSN1BFt4D--
