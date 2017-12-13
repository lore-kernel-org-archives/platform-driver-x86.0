From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on
 subsequent lines
Date: Wed, 13 Dec 2017 10:53:30 +0000
Message-ID: <e482b906981f4b46b2336bebba28888bBM1PR0101MB144449CA7ADDBA3A03061AAFE6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
References: <20171213082301.23209-1-dhaval.shah@softnautics.com>
 <CAOFm3uEP-fGPiZt96QDvgXG1Ws8WgdFLbOsGumvhGSG-e7L0Ng@mail.gmail.com>
 <BM1PR0101MB1444C78FDA61BA59D578A5F8E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>,<CAOFm3uGEmR9Wq1O06CiaqncA4E7mxfgDm97NetOe0qL_mtpsSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ma1ind01on0098.outbound.protection.outlook.com ([104.47.100.98]:63552
        "EHLO IND01-MA1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751870AbdLMKxe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 05:53:34 -0500
In-Reply-To: <CAOFm3uGEmR9Wq1O06CiaqncA4E7mxfgDm97NetOe0qL_mtpsSw@mail.gmail.com>
Content-Language: en-US
Content-ID: <E9C8CDC947F9C84D8918CEE38E36E779@INDPRD01.PROD.OUTLOOK.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: "pali.rohar@gmail.com" <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>


Hi Philippe,



> From: Philippe Ombredanne <pombredanne@nexb.com>
> Sent: Wednesday, December 13, 2017 3:31 PM
> To: Dhaval Shah
> Cc: pali.rohar@gmail.com; Darren Hart; Andy Shevchenko; platform-driver-x=
86@vger.kernel.org; LKML
> Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on sub=
sequent lines
> =A0=20

> Dhaval,
>=20
> On Wed, Dec 13, 2017 at 10:52 AM, Dhaval Shah
> <dhaval.shah@softnautics.com> wrote:
> > HI
> >
> > Thanks a lot for the review.
> > ________________________________________
> > > From: Philippe Ombredanne <pombredanne@nexb.com>
> > > Sent: Wednesday, December 13, 2017 2:54 PM
> > > To: Dhaval Shah
> > > Cc: pali.rohar@gmail.com; Darren Hart; Andy Shevchenko; platform-driv=
er-x86@vger.kernel.org; LKML
> > > Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on=
 subsequent lines
> > >
> > > Dhaval,
> > >
> > > On Wed, Dec 13, 2017 at 9:23 AM, Dhaval Shah
> > > <dhaval.shah@softnautics.com> wrote:
> > > > Resolved Block comments use * on subsequent lines checkpatch warnin=
gs.
> > > > Issue found by checkpatch.
> > > >
> > > > Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
> > > > ---
> > > >=A0 drivers/platform/x86/dell-rbtn.c | 26 +++++++++++++-------------
> > > >=A0 drivers/platform/x86/dell-rbtn.h | 26 +++++++++++++-------------
> > > >=A0 2 files changed, 26 insertions(+), 26 deletions(-)
> > > >
> > > > diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x8=
6/dell-rbtn.c
> > > > index f3afe778001e..cab93c6dcd34 100644
> > > > --- a/drivers/platform/x86/dell-rbtn.c
> > > > +++ b/drivers/platform/x86/dell-rbtn.c
> > > > @@ -1,17 +1,17 @@
> > > >=A0 /*
> > > > -=A0=A0=A0 Dell Airplane Mode Switch driver
> > > > -=A0=A0=A0 Copyright (C) 2014-2015=A0 Pali Roh=E1r <pali.rohar@gmai=
l.com>
> > > > -
> > > > -=A0=A0=A0 This program is free software; you can redistribute it a=
nd/or modify
> > > > -=A0=A0=A0 it under the terms of the GNU General Public License as =
published by
> > > > -=A0=A0=A0 the Free Software Foundation; either version 2 of the Li=
cense, or
> > > > -=A0=A0=A0 (at your option) any later version.
> > > > -
> > > > -=A0=A0=A0 This program is distributed in the hope that it will be =
useful,
> > > > -=A0=A0=A0 but WITHOUT ANY WARRANTY; without even the implied warra=
nty of
> > > > -=A0=A0=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=A0 =
See the
> > > > -=A0=A0=A0 GNU General Public License for more details.
> > > > -*/
> > > > + *=A0=A0 Dell Airplane Mode Switch driver
> > > > + *=A0=A0 Copyright (C) 2014-2015=A0 Pali Roh=E1r <pali.rohar@gmail=
.com>
> > > > + *
> > > > + *=A0=A0 This program is free software; you can redistribute it an=
d/or modify
> > > > + *=A0=A0 it under the terms of the GNU General Public License as p=
ublished by
> > > > + *=A0=A0 the Free Software Foundation; either version 2 of the Lic=
ense, or
> > > > + *=A0=A0 (at your option) any later version.
> > > > + *
> > > > + *=A0=A0 This program is distributed in the hope that it will be u=
seful,
> > > > + *=A0=A0 but WITHOUT ANY WARRANTY; without even the implied warran=
ty of
> > > > + *=A0=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=A0 S=
ee the
> > > > + *=A0=A0 GNU General Public License for more details.
> > > > + */
> > >
> > > Do you mind using the new SPDX ids instead of this long legalese?
> > > You can check the doc patches from Thomas for details [1]
> > >
> > >
> > > [1]  https://lkml.org/lkml/2017/12/4/934
> > This is different issue. If we need to fix the issue of this if we upda=
te SPDX licensing as well.
> > I am agree with you on the use of the new SPDX IDs instead of the long =
legalese.
> > For this, we have to add the text "// SPDX-License-Identifier: GPL-2.0"=
 at the top of the file and remove the
> > whole license part and keep on copyright and Author name related info. =
After change, it looks like
> > // SPDX-License-Identifier: GPL-2.0
> > /*
> >=A0 *=A0 Dell Airplane Mode Switch driver
> >=A0 *=A0 Copyright (C) 2014-2015=A0 Pali Roh=E1r <pali.rohar@gmail.com>
> >=A0 */
>=20
> And for a short comment block like this, Linus preference is to avoid
> mixing comment style and go all the way C++ style as in:
>=20
> > // SPDX-License-Identifier: GPL-2.0
> > // Dell Airplane Mode Switch driver
> > // Copyright (C) 2014-2015=A0 Pali Roh=E1r <pali.rohar@gmail.com>
> >=20
> > ... for even less boilerplate ;)

Thanks a lot for the link.
Do you want to me to update along with SPDX in this patchset with V2 or we =
will update in the next patchset once this patch merge?

> >=20
> > See Linus comments for a rationale [1] [2] [3] [4] [5]
> >=20
> > [1]  https://lkml.org/lkml/2017/11/25/133
> > [2]  https://lkml.org/lkml/2017/11/25/125
> > [3] https://lkml.org/lkml/2017/11/2/715
 > > [4] https://lkml.org/lkml/2017/11/2/805
>=20
 >  --=20
 >  Cordially
 >  Philippe Ombredanne
      =
