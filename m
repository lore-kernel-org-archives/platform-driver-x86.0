From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [patch 1/2] thinkpad_acpi: signedness bugs getting current_mode
Date: Sun, 15 Mar 2015 13:48:13 +1100
Message-ID: <20150315134813.1b0a5685@canb.auug.org.au>
References: <20150311093450.GA3564@mwanda>
	<20150314210612.GA26465@fury.dvhart.com>
	<20150315134612.46ca70c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FCXTWMqj2FPDcHyi5WFplFL"; protocol="application/pgp-signature"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53734 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751054AbbCOCsU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Mar 2015 22:48:20 -0400
In-Reply-To: <20150315134612.46ca70c5@canb.auug.org.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Bastien Nocera <hadess@hadess.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>, "H. Peter Anvin" <hpa@zytor.com>

--Sig_/FCXTWMqj2FPDcHyi5WFplFL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Darren,

On Sun, 15 Mar 2015 13:46:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The people you will inconvenience more by rebasing are the developers
> who write patches that are based on your tree.  If you rebase under
> them, they may have to rebase and fix up the patches they have already
> tested and had reviewed before they can then submit them to you
> (hopefully before you rebase again).

This, of course, only applied to published trees (which includes
anything in linux-next) - what you do in your own (logically private)
development tree is your own business.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/FCXTWMqj2FPDcHyi5WFplFL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVBPLxAAoJEMDTa8Ir7ZwVT6sP/jWfFIPvJKpg7UGn6G65/HH8
a6vVXpoYYx0QAnMyUw1oHA/Ex+kgnQH97dkxMawJZoWLrUWnwkNNNLOHfmWKSqDF
+lJGJdEXpE3dS5tlMZWK8ya18yaDDk9L+m0ICxMtxQAKoYxiS2+aybOsAghCUXkG
2FrIdNRQs5jH1MstfzegmHqOdDulI7ffKbRPYg77Dx7tpscJGfT8F9HE9Wp75PvP
k25hQYZM20uAL54ysgN2jw+EfoFnB+t2tH8Hy14bC63M6fFzdR34o3DpvKDu9W/4
gE3NOYISTorV3rYyPj0rpBrs9AJCffI50D9yWWdHbqUdSLfAFOnqrJRuMh4TEeDZ
3v4RMAfVdbNdiKEtszz3pVcXKgoAdGSRmSgjMqYxNDUzNFPEYOVwStbGLbfbJgbe
S8m/bAW76wbZZbKj3atBm/82WO9IQYsT/XOMN2wyAcVzWnzVy0DC3Sn7EPXkYftd
8XsW9t0xeA9BeC7gZFTHQ80+z7+hwNtkfDrJpFgUJWVtPuVikU3avb5FU6rsKYXJ
diUqyipbmWmP69SXAbJ0hu/FQV3ENjpBrBpOZV5xi8Aksc78MOfdmd+wLJK1SCZV
yNDZQ7JYwF9VEHbbtZ2ScEsyPrfmgxBLS91wwhNTk5JCkMGi6RRN3EuarvBmVt55
yu5cEuKK5qR6Sqt9VvyQ
=8UPD
-----END PGP SIGNATURE-----

--Sig_/FCXTWMqj2FPDcHyi5WFplFL--
