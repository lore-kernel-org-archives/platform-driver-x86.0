From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: BUG? Duplicate key code 0xe045 in dell-wmi.c
Date: Sat, 4 Jul 2015 18:34:03 +0200
Message-ID: <201507041834.03944@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1472484.o6VjLdEdCs";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:32836 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756122AbbGEIxS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jul 2015 04:53:18 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Len Brown <len.brown@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>

--nextPart1472484.o6VjLdEdCs
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm looking at dell-wmi.c driver and its history in git and I found=20
problem with handling WMI key code 0xe045. In current dell-wmi.c code is

{KE_KEY, 0xe045, KEY_PROG1},
{KE_IGNORE, 0xe045, KEY_NUMLOCK},

I bet this is some copy-paste error as one code can be translated only=20
to one input key event.

In git history I found that above change was added by commit:

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=
=3D5cab0098171712a9fd51399b06181c8dfdebe9c9

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
commit 5cab0098171712a9fd51399b06181c8dfdebe9c9
Author: Mario Limonciello <mario_limonciello@dell.com>
Date:   Wed Jun 10 19:40:47 2009 +0000

    dell-wmi: add additional keyboard events
   =20
    Upcoming Dell hardware will send more keyboard events via WMI.  Add
    support for them.
   =20
    Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
    Signed-off-by: Matthew Garrett <mjg@redhat.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Len Brown <len.brown@intel.com>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Sending email to all signers of this commit. Problematic code is still=20
in upstream kernel, so it needs to be fixed.

Mario Limonciello: Do you know if code 0xe045 is some PROG1 or NUMLOCK?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1472484.o6VjLdEdCs
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlWYCvsACgkQi/DJPQPkQ1JQjACguDZpQsDkAvA3jJ7gINPg0BMZ
/V4AoMLJkY0KWl3HaiMOT9csCkBIOjue
=YEQ9
-----END PGP SIGNATURE-----

--nextPart1472484.o6VjLdEdCs--
