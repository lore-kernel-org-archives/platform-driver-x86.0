From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 0/3] Dell Airplane Mode Switch driver
Date: Sun, 3 May 2015 12:38:14 +0200
Message-ID: <201505031238.14772@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <1430301066-22870-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1788559.zIUCDIMGM2";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:32910 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752482AbbECKiS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 May 2015 06:38:18 -0400
In-Reply-To: <1430301066-22870-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

--nextPart1788559.zIUCDIMGM2
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 29 April 2015 11:51:03 Pali Roh=C3=A1r wrote:
> This patch series add new acpi Dell Airplane Mode Switch
> driver (DELLABCE and DELRBTN acpi devices). It provides radio
> HW switch events (together with current state of radio
> devices) and export them via rfkill interface. These events
> are also used in dell-laptop driver instead i8042 filter hook
> function (when acpi device is available).
>=20
> In v2 was added support for laptops which have toggle button
> instead HW slider switch. For that I reused code done by Alex
> Hung.
>=20
> Pali Roh=C3=A1r (3):
>   platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
>   platform: x86: dell-rbtn: Export notifier for other kernel
> modules platform: x86: dell-laptop: Use dell-rbtn instead
> i8042 filter when possible
>=20
>  drivers/platform/x86/Kconfig       |   14 ++
>  drivers/platform/x86/Makefile      |    1 +
>  drivers/platform/x86/dell-laptop.c |   67 +++++-
>  drivers/platform/x86/dell-rbtn.c   |  430
> ++++++++++++++++++++++++++++++++++++
> drivers/platform/x86/dell-rbtn.h   |   35 +++
>  5 files changed, 542 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/platform/x86/dell-rbtn.c
>  create mode 100644 drivers/platform/x86/dell-rbtn.h

Alex, can you rested this patch series on all your machines like=20
you did previous in this sheet?

https://docs.google.com/spreadsheets/d/1voffS6dNglwAExSGh3UmG__UAO2qfZ829Ck=
JLPo06aI/edit?usp=3Dsharing

Ideally do more tests:
1) only with first patch 1/3
2) with full patch series 1/3, 2/3, 3/3 *with* loaded dell-laptop
3) same as 2) but without loaded dell-laptop

If everything pass then this patch series is OK from my side.

Looks like Gabriele's problem is irrelevant to this patch series,=20
but we probably hit some rfkill bug in dell-laptop.ko :-(

Matthew or Darren, can you review code in this patch series? So=20
if everything will be fine, dell-rbtn could be ready for 4.2.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1788559.zIUCDIMGM2
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlVF+pYACgkQi/DJPQPkQ1J4LwCbBz7CL//m7kOY5y8dKgyNkPTt
clQAoKht/n9khk217rDAIHOAIUNGASJV
=G3fK
-----END PGP SIGNATURE-----

--nextPart1788559.zIUCDIMGM2--
