From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Sat, 27 May 2017 15:17:29 +0200
Message-ID: <201705271517.30111@pali>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com> <CAHp75Vez0ZbBQ_uK1=Q7C3azwBQWerZiio0c2p4WEutXK1NhPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart65047410.yaIuVpmhQF";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:32947 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753590AbdE0NRe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 09:17:34 -0400
In-Reply-To: <CAHp75Vez0ZbBQ_uK1=Q7C3azwBQWerZiio0c2p4WEutXK1NhPg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

--nextPart65047410.yaIuVpmhQF
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 27 May 2017 15:07:09 Andy Shevchenko wrote:
> On Sat, May 27, 2017 at 2:51 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>
> wrote:
> > object_id and notify_id are in one union structure and their
> > meaning is defined by flags. Therefore do not print notify_id for
> > non-event block and do not print object_id for event block. Remove
> > also reserved member as it does not have any defined meaning or
> > type yet.
> >=20
> > As object_id and notify_id union members overlaps and have
> > different types, it caused that kernel print to dmesg binary data.
> > This patch eliminates it.
> >=20
> > -       pr_info("\tobject_id: %c%c\n", g->object_id[0],
> > g->object_id[1]); -       pr_info("\tnotify_id: %02X\n",
> > g->notify_id);
> >=20
> > -       pr_info("\treserved: %02X\n", g->reserved);
>=20
> Do we need this? Commit message doesn't clarify.

I wrote to commit message that reserved does not have defined meaning=20
nor type. Also reserved overlap with object_id[1] so for non-event=20
should not be print at all. And as it is reserved, I removed it.

> > +       if (g->flags & ACPI_WMI_EVENT)
> > +               pr_info("\tnotify_id: 0x%02X\n", g->notify_id);
> > +       else
> >=20
> > +               pr_info("\tobject_id: %c%c\n", g->object_id[0],
> > g->object_id[1]);
>=20
> If this can still contain non-printable characters the %*pE can help
> instead.

Those are printable ASCII. object_id contains two characters which are=20
suffix for ACPI method.

Problem was only for events when we tried to print notify_id as=20
object_id. notify_id is binary and overlaps with object_id.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart65047410.yaIuVpmhQF
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlkpfGkACgkQi/DJPQPkQ1IDNACgm5pKv/wqpHo7ekDOvIrtvyTA
dvgAn3V1EzXrpfvjL1W2RAbgSsrwEtIi
=T5mE
-----END PGP SIGNATURE-----

--nextPart65047410.yaIuVpmhQF--
