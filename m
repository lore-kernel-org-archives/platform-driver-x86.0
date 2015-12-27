From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 0/2] Fixes for dell-wmi
Date: Sun, 27 Dec 2015 14:07:47 +0100
Message-ID: <201512271407.47844@pali>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com> <567FE0CD.6080107@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2445909.bJln45jkVe";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <567FE0CD.6080107@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--nextPart2445909.bJln45jkVe
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 27 December 2015 13:59:57 Gabriele Mazzotta wrote:
> On 24/12/2015 22:18, Pali Roh=C3=A1r wrote:
> > This patch series adds check if Dell WMI descriptor structure is
> > valid and fixes processing WMI events on devices with WMI
> > interface version 0.
> >=20
> > After testing, second patch is good candidate for backporting into
> > stable kernels, but problem is that it cannot be used without
> > first patch. So I let decision to other people.
> >=20
> > Gabriele and Micha=C5=82, this patch series should fix processing events
> > on yours Dell laptops (you have in DSDT defined version 0). Can
> > you test it?
>=20
> Hi,
>=20
> I tested the patches and all the function keys work, but I can see
> that there are some differences in the dmesg.
>=20
> Here a before and after comparison.
>=20
> The radio button seems to generate longer messages when compared to
> the others.

Hi! Thanks for testing. Can you please recompile driver with line=20
#define DEBUG at beginning of dell-wmi.c file and send dmesg output=20
again? I want to see processing buffer debug lines in dmesg. Here we=20
should see that after this patch series garbage will not be parsed.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2445909.bJln45jkVe
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlZ/4qMACgkQi/DJPQPkQ1I0zwCcC0sMU3xKPPvEheDfGKM6VaWX
oUcAoLAOONOCU5DuG0ng8fTwA79F/t00
=HCcx
-----END PGP SIGNATURE-----

--nextPart2445909.bJln45jkVe--
