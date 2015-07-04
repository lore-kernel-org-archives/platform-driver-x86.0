From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Incorrect key code parsing in dell-wmi.c since 5ea2559
Date: Sat, 4 Jul 2015 19:06:48 +0200
Message-ID: <201507041906.48648@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2208749.jj6e4udj3U";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:36486 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753394AbbGEI3z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jul 2015 04:29:55 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Islam Amer <pharon@gmail.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario_limonciello@dell.com>

--nextPart2208749.jj6e4udj3U
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I found another problem in dell-wmi.c code which is still partially in
mainline kernel since commit 5ea2559726b786283236835dc2905c23b36ac91c:

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=
=3D5ea2559726b786283236835dc2905c23b36ac91c

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
commit 5ea2559726b786283236835dc2905c23b36ac91c
Author: Rezwanul Kabir <Rezwanul_Kabir@dell.com>
Date:   Mon Nov 2 12:00:42 2009 -0500

    dell-wmi: Add support for new Dell systems
   =20
    Newer Dell systems support HotKey features differently from legacy
    systems.  A new vendor specifc HotKey SMBIOS table (Type 0xB2) is
    defined. This table contains a mapping between scancode and the
    corresponding predefined keyfunction ( i.e. keycode).. Also, a new
    ACPI-WMI event type (called KeyIDList) with a value of 0x0010 is
    defined. Any BIOS containing 0xB2 table will send hotkey notifications
    using KeyIDList event.
   =20
    This is Rezwanul's patch, updated to ensure that brightness events are
    not sent if the backlight is controlled via ACPI and with the default
    keycode for the display output switching altered to match desktop
    expectations.
   =20
    Signed-off-by: Rezwanul Kabir <Rezwanul_Kabir@dell.com>
    Signed-off-by: Matthew Garrett <mjg@redhat.com>
    Signed-off-by: Len Brown <len.brown@intel.com>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Before this commit WMI event buffer was parsed as:

  int *buffer =3D (int *)obj->buffer.pointer;
  key =3D dell_wmi_get_entry_by_scancode(buffer[1] & 0xFFFF);

So basically 4th-7th bytes are parsed.

After this commit WMI event buffer is parsed as:

  u16 *buffer_entry =3D (u16 *)obj->buffer.pointer;
  reported_key =3D (int)buffer_entry[1] & 0xffff;
  key =3D dell_wmi_get_entry_by_scancode(reported_key);

Which means that 2nd and 3rd bytes are parsed.

Apparently this commit changed what kernel parse as keycode. And I bet
this is some copy-paste error and not correct code. Variable buffer was
changed from (int*) to (u16*) and which change could be "hidden" at time
of code review.

Next there is commit which somehow is trying to fix user problems:

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=
=3Dd5164dbf1f651d1e955b158fb70a9c844cc91cd1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
commit d5164dbf1f651d1e955b158fb70a9c844cc91cd1
Author: Islam Amer <pharon@gmail.com>
Date:   Thu Jun 24 13:39:47 2010 -0400

    dell-wmi: Add support for eject key on Dell Studio 1555
   =20
    Fixes pressing the eject key on Dell Studio 1555 does not work and prod=
uces
    message :
   =20
    dell-wmi: Unknown key 0 pressed
   =20
    Signed-off-by: Islam Amer <pharon@gmail.com>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

It changes parsing WMI event buffer to:

  u16 *buffer_entry =3D (u16 *)obj->buffer.pointer;
  if (buffer_entry[1] =3D=3D 0x0)
    reported_key =3D (int)buffer_entry[2] & 0xffff;
  else
    reported_key =3D (int)buffer_entry[1] & 0xffff;
  key =3D dell_wmi_get_entry_by_scancode(reported_key);

My idea is that Islam Amer tried to fix problem introduced in commit
5ea2559726b786283236835dc2905c23b36ac91c.

According to some available very-very old Dell ACPI-WMI documentation at

http://vpsservice1.sampo.com.tw/sampo_update/document/jimmy/ACPI-WMI%20.pdf

and also from information from commit message 5ea2559 format of WMI is
(u16*)[length, type, data, ...].

Because type for hotkey is 0x0000 then it expected that kernel reported
always key 0x0000...

So I would propose to drop parsing "buffer_entry[1]" as key code and
rewrite dell_wmi_notify function to always process WMI buffer as
[length, type, data...].

What do you think about it? It also simplify notify code as there is one
branch for dell_new_hk_type and one for old parsing (with that entry[1]).

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2208749.jj6e4udj3U
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlWYEqgACgkQi/DJPQPkQ1LhGwCgzWRnjtueWz1XnRapoLi54Eir
ADkAnRm6XNs6lKDxmABO5MZJrjFArCHT
=g2ud
-----END PGP SIGNATURE-----

--nextPart2208749.jj6e4udj3U--
