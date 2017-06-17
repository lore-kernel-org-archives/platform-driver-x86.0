From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance number
Date: Sat, 17 Jun 2017 18:47:54 +0200
Message-ID: <201706171847.54407@pali>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com> <20170613184228.GC22450@fury> <20170614154654.GA22981@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2777505.xa2oJlV29D";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f173.google.com ([209.85.128.173]:36863 "EHLO
        mail-wr0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750720AbdFQQr5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Jun 2017 12:47:57 -0400
In-Reply-To: <20170614154654.GA22981@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <jlee@suse.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, Dave Airlie <airlied@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart2777505.xa2oJlV29D
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

> So problematic drivers which use instance=3D1 without any comments are:
>=20
>   acer-wmi
>   asus-wmi
>   mxm-wmi

Adding authors & maintainers of those drivers in loop.

WMI instance number is indexed from zero and therefore first instance
number is 0, not 1. Can you check if for drivers and wmi functions
(specified below) is really correct to use WMI instance number one?

In case in _WDG is specified for particular GUID that instance_count is
1, it means the only allowed instance number is 0 (first and the only
one).

In some cases, when there is only one instance for WMI method, ACPI WMI
bytecode does not check instance number, so any passed value is
accepted by ACPI. But in current patch I'm trying to fix check for
valid instance number based on instance_count information from _WDG.

So I need to know if nothing would be broken. And in case those driver
issue invalid/incorrect instance number, they needs to be fixed.

Can you look at it? Simple look into _WDG dump should be enough... just
check if instance number called from wmi driver is less then
instance_count from _WDG.

On Wednesday 14 June 2017 17:46:54 Pali Roh=C3=A1r wrote:
> Function wmi_query_block:
>=20
>   acer-wmi.c:
>   instance=3D1 /* no comment why, guid=3D95764E09-FB56-4E83-B31A-37761F60=
994A */
>=20
=20
> Function wmi_evaluate_method:
>=20
>   acer-wmi.c:
>   instance=3D1 /* no comment why, guid=3D67C3371D-95A3-4C37-BB61-DD47B491=
DAAB */
>   instance=3D1 /* no comment why, guid=3D6AF4F258-B401-42FD-BE91-3D4AC2D7=
C0D3 */
>=20
>   asus-wmi.c:
>   instance=3D1 /* no comment why, guid=3D97845ED0-4E6D-11DE-8A39-0800200C=
9A66 */
>=20
>   mxm-wmi.c:
>   instance=3D1 /* no comment why, guid=3DF6CB5C3C-9CAE-4EBD-B577-931EA32A=
2CC0 */

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2777505.xa2oJlV29D
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAllFXToACgkQi/DJPQPkQ1Js7ACgwkcqLel1uqbpY5zXkP3Ns082
sjcAoJAwgIk1elXhqQctLj4Z1oma2Afi
=wkyP
-----END PGP SIGNATURE-----

--nextPart2777505.xa2oJlV29D--
