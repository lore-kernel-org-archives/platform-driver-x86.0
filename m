From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on
 subsequent lines
Date: Wed, 13 Dec 2017 09:52:32 +0000
Message-ID: <BM1PR0101MB1444C78FDA61BA59D578A5F8E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
References: <20171213082301.23209-1-dhaval.shah@softnautics.com>,<CAOFm3uEP-fGPiZt96QDvgXG1Ws8WgdFLbOsGumvhGSG-e7L0Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bo1ind01on0128.outbound.protection.outlook.com ([104.47.101.128]:41712
        "EHLO IND01-BO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751121AbdLMJwh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 04:52:37 -0500
In-Reply-To: <CAOFm3uEP-fGPiZt96QDvgXG1Ws8WgdFLbOsGumvhGSG-e7L0Ng@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: "pali.rohar@gmail.com" <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

HI

Thanks a lot for the review.
________________________________________
> From: Philippe Ombredanne <pombredanne@nexb.com>
> Sent: Wednesday, December 13, 2017 2:54 PM
> To: Dhaval Shah
> Cc: pali.rohar@gmail.com; Darren Hart; Andy Shevchenko; platform-driver-x=
86@vger.kernel.org; LKML
> Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on sub=
sequent lines
>=20
> Dhaval,
>=20
> On Wed, Dec 13, 2017 at 9:23 AM, Dhaval Shah
> <dhaval.shah@softnautics.com> wrote:
> > Resolved Block comments use * on subsequent lines checkpatch warnings.
> > Issue found by checkpatch.
> >
> > Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
> > ---
> >  drivers/platform/x86/dell-rbtn.c | 26 +++++++++++++-------------
> >  drivers/platform/x86/dell-rbtn.h | 26 +++++++++++++-------------
> >  2 files changed, 26 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/de=
ll-rbtn.c
> > index f3afe778001e..cab93c6dcd34 100644
> > --- a/drivers/platform/x86/dell-rbtn.c
> > +++ b/drivers/platform/x86/dell-rbtn.c
> > @@ -1,17 +1,17 @@
> >  /*
> > -    Dell Airplane Mode Switch driver
> > -    Copyright (C) 2014-2015  Pali Roh=E1r <pali.rohar@gmail.com>
> > -
> > -    This program is free software; you can redistribute it and/or modi=
fy
> > -    it under the terms of the GNU General Public License as published =
by
> > -    the Free Software Foundation; either version 2 of the License, or
> > -    (at your option) any later version.
> > -
> > -    This program is distributed in the hope that it will be useful,
> > -    but WITHOUT ANY WARRANTY; without even the implied warranty of
> > -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > -    GNU General Public License for more details.
> > -*/
> > + *   Dell Airplane Mode Switch driver
> > + *   Copyright (C) 2014-2015  Pali Roh=E1r <pali.rohar@gmail.com>
> > + *
> > + *   This program is free software; you can redistribute it and/or mod=
ify
> > + *   it under the terms of the GNU General Public License as published=
 by
> > + *   the Free Software Foundation; either version 2 of the License, or
> > + *   (at your option) any later version.
> > + *
> > + *   This program is distributed in the hope that it will be useful,
> > + *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *   GNU General Public License for more details.
> > + */
>=20
> Do you mind using the new SPDX ids instead of this long legalese?
> You can check the doc patches from Thomas for details [1]
>=20
>=20
> [1] https://lkml.org/lkml/2017/12/4/934
This is different issue. If we need to fix the issue of this if we update S=
PDX licensing as well.
I am agree with you on the use of the new SPDX IDs instead of the long lega=
lese.
For this, we have to add the text "// SPDX-License-Identifier: GPL-2.0" at =
the top of the file and remove the=20
whole license part and keep on copyright and Author name related info. Afte=
r change, it looks like
// SPDX-License-Identifier: GPL-2.0
/*
 *  Dell Airplane Mode Switch driver
 *  Copyright (C) 2014-2015  Pali Roh=E1r <pali.rohar@gmail.com>
 */
=20
> --
> Cordially
> Philippe Ombredanne
