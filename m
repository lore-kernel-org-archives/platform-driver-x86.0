From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Sat, 27 May 2017 15:23:14 +0200
Message-ID: <201705271523.14964@pali>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com> <CAHp75Vez0ZbBQ_uK1=Q7C3azwBQWerZiio0c2p4WEutXK1NhPg@mail.gmail.com> <201705271517.30111@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart8756571.hzSMth9M7P";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35507 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756638AbdE0NXS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 09:23:18 -0400
In-Reply-To: <201705271517.30111@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

--nextPart8756571.hzSMth9M7P
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 27 May 2017 15:17:29 Pali Roh=C3=A1r wrote:
> On Saturday 27 May 2017 15:07:09 Andy Shevchenko wrote:
> > On Sat, May 27, 2017 at 2:51 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
> >=20
> > wrote:
> > > object_id and notify_id are in one union structure and their
> > > meaning is defined by flags. Therefore do not print notify_id for
> > > non-event block and do not print object_id for event block.
> > > Remove also reserved member as it does not have any defined
> > > meaning or type yet.
> > >=20
> > > As object_id and notify_id union members overlaps and have
> > > different types, it caused that kernel print to dmesg binary
> > > data. This patch eliminates it.
> > >=20
> > > -       pr_info("\tobject_id: %c%c\n", g->object_id[0],
> > > g->object_id[1]); -       pr_info("\tnotify_id: %02X\n",
> > > g->notify_id);
> > >=20
> > > -       pr_info("\treserved: %02X\n", g->reserved);
> >=20
> > Do we need this? Commit message doesn't clarify.
>=20
> I wrote to commit message that reserved does not have defined meaning
> nor type. Also reserved overlap with object_id[1] so for non-event
> should not be print at all. And as it is reserved, I removed it.
>=20
> > > +       if (g->flags & ACPI_WMI_EVENT)
> > > +               pr_info("\tnotify_id: 0x%02X\n", g->notify_id);
> > > +       else
> > >=20
> > > +               pr_info("\tobject_id: %c%c\n", g->object_id[0],
> > > g->object_id[1]);
> >=20
> > If this can still contain non-printable characters the %*pE can
> > help instead.
>=20
> Those are printable ASCII. object_id contains two characters which
> are suffix for ACPI method.
>=20
> Problem was only for events when we tried to print notify_id as
> object_id. notify_id is binary and overlaps with object_id.

Before patch modprobe wmi debug_dump_wdg=3D1 print to dmesg:

wmi: 8D9DDCBC-A997-11DA-B012-B622A1EF5492:
wmi: 	object_id: AA
wmi: 	notify_id: 41
wmi: 	reserved: 41
wmi: 	instance_count: 1
wmi: 	flags: 0x0
wmi: A80593CE-A997-11DA-B012-B622A1EF5492:
wmi: 	object_id: BA
wmi: 	notify_id: 42
wmi: 	reserved: 41
wmi: 	instance_count: 1
wmi: 	flags: 0x2 ACPI_WMI_METHOD
wmi: 9DBB5994-A997-11DA-B012-B622A1EF5492:
wmi: 	object_id: <<some_binary_char>>
wmi: 	notify_id: D0
wmi: 	reserved: 00
wmi: 	instance_count: 1
wmi: 	flags: 0x8 ACPI_WMI_EVENT
wmi: A3776CE0-1E88-11DB-A98B-0800200C9A66:
wmi: 	object_id: BC
wmi: 	notify_id: 42
wmi: 	reserved: 43
wmi: 	instance_count: 1
wmi: 	flags: 0x0
wmi: 05901221-D566-11D1-B2F0-00A0C9062910:
wmi: 	object_id: MO
wmi: 	notify_id: 4D
wmi: 	reserved: 4F
wmi: 	instance_count: 1
wmi: 	flags: 0x0

(where <<some_binary_char>> was 0xD0)

After patch it prints:

wmi: 8D9DDCBC-A997-11DA-B012-B622A1EF5492:
wmi: 	object_id: AA
wmi: 	instance_count: 1
wmi: 	flags: 0x0
wmi: A80593CE-A997-11DA-B012-B622A1EF5492:
wmi: 	object_id: BA
wmi: 	instance_count: 1
wmi: 	flags: 0x2 ACPI_WMI_METHOD
wmi: 9DBB5994-A997-11DA-B012-B622A1EF5492:
wmi: 	notify_id: 0xD0
wmi: 	instance_count: 1
wmi: 	flags: 0x8 ACPI_WMI_EVENT
wmi: A3776CE0-1E88-11DB-A98B-0800200C9A66:
wmi: 	object_id: BC
wmi: 	instance_count: 1
wmi: 	flags: 0x0
wmi: 05901221-D566-11D1-B2F0-00A0C9062910:
wmi: 	object_id: MO
wmi: 	instance_count: 1
wmi: 	flags: 0x0

I hope it is more clear right now.

Basically output now contains only meaningful parsed members (event=20
contains notify_id, method contains object_id).

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart8756571.hzSMth9M7P
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlkpfcIACgkQi/DJPQPkQ1IjCACeKrrmsYr4c7QcHpgOCPbBYx1k
rWsAoLjroypYpVk5MASddeWi+j0RUxD2
=BWC4
-----END PGP SIGNATURE-----

--nextPart8756571.hzSMth9M7P--
