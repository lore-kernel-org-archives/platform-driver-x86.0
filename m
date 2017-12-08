From: Stefan =?ISO-8859-1?Q?Br=FCns?= <stefan.bruens@rwth-aachen.de>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Simplify autorelease logic
Date: Sat, 9 Dec 2017 00:28:18 +0100
Message-ID: <7546133.vVTS3nG8Ku@pebbles>
References: <eb2e1de12dad4c11454b009075f916c63de8a2a6.1512774279.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2225098.EicF7K9bUB";
        micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out-2.itc.rwth-aachen.de ([134.130.5.47]:32423 "EHLO
        mail-out-2.itc.rwth-aachen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753288AbdLHX21 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 18:28:27 -0500
In-Reply-To: <eb2e1de12dad4c11454b009075f916c63de8a2a6.1512774279.git.dvhart@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, AceLan Kao <acelan.kao@canonical.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

--nextPart2225098.EicF7K9bUB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Saturday, December 9, 2017 12:07:08 AM CET Darren Hart (VMware) wrote:
> The new notify_handler logic determining if autorelease should be used or
> not is a bit awkward, and can result in more than one call to
> sparse_keymap_report_event for the same event (scancode). The nesting
> and long lines also made it difficult to read.
>=20
> Simplify the logic by eliminating a level of nesting with a goto and
> always calculate autorelease and val so we can make a single call to
> sparse_keymap_report_event.
>=20
> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> Cc: Stefan Br=FCns <stefan.bruens@rwth-aachen.de>
> Cc: AceLan Kao <acelan.kao@canonical.com>
> ---
> Note: This is based on top of Stefan's v2 patch series for intel-vbtn,
> currently in my review-dvhart branch.

Hi Darren,

is this tree publically available?

Thanks,

Stefan

=2D-=20
Stefan Br=FCns  /  Bergstra=DFe 21  /  52062 Aachen
home: +49 241 53809034     mobile: +49 151 50412019
--nextPart2225098.EicF7K9bUB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSwWRWIpJbl0W4DemNvf0o9jP6qUwUCWisgEgAKCRBvf0o9jP6q
U2FcAJ0T1giuzdt+eHdpHYwjc0g1VNviQQCgpWdlIXh6ZkaPbbufwkPuBjZV6tc=
=CC0d
-----END PGP SIGNATURE-----

--nextPart2225098.EicF7K9bUB--
