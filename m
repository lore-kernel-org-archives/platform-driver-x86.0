From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on
 subsequent lines
Date: Wed, 13 Dec 2017 13:08:37 +0000
Message-ID: <BM1PR0101MB14444E857FA41295A8BEFA12E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
References: <20171213082301.23209-1-dhaval.shah@softnautics.com>
 <CAOFm3uEP-fGPiZt96QDvgXG1Ws8WgdFLbOsGumvhGSG-e7L0Ng@mail.gmail.com>
 <BM1PR0101MB1444C78FDA61BA59D578A5F8E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
 <CAOFm3uGEmR9Wq1O06CiaqncA4E7mxfgDm97NetOe0qL_mtpsSw@mail.gmail.com>
 <BM1PR0101MB144449CA7ADDBA3A03061AAFE6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>,<CAOFm3uGVjKxk8B-LRGEFMTC_AT78pFFfz2pjixC4up4Kn8b+pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ma1ind01on0126.outbound.protection.outlook.com ([104.47.100.126]:59296
        "EHLO IND01-MA1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752932AbdLMNIm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 08:08:42 -0500
In-Reply-To: <CAOFm3uGVjKxk8B-LRGEFMTC_AT78pFFfz2pjixC4up4Kn8b+pQ@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: "pali.rohar@gmail.com" <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>


Hi Philippe,



________________________________________
> From: Philippe Ombredanne <pombredanne@nexb.com>
> Sent: Wednesday, December 13, 2017 6:27 PM
> To: Dhaval Shah
> Cc: pali.rohar@gmail.com; Darren Hart; Andy Shevchenko; platform-driver-x=
86@vger.kernel.org; LKML
> Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on sub=
sequent lines
>=20
> Dhaval,
>=20
> On Wed, Dec 13, 2017 at 11:47 AM, Dhaval Shah
> <dhaval.shah@softnautics.com> wrote:
>=20
> <snip>
> > > And for a short comment block like this, Linus preference is to avoid
> > > mixing comment style and go all the way C++ style as in:
> > >
> > > > // SPDX-License-Identifier: GPL-2.0
> > > > // Dell Airplane Mode Switch driver
> > > > // Copyright (C) 2014-2015  Pali Roh=E1r <pali.rohar@gmail.com>
> > > >
> > > > ... for even less boilerplate ;)
> >
> > Thanks a lot for the link.
> > Do you want to me to update along with SPDX in this patchset with V2 or=
 we will update in the next patchset once this patch merge?
>=20
> That's not for me to decide, I am just a lowly licensing elf helper scruf=
fy!
I can assume that current patch is accepted or I have to provide you any ch=
anges

> PS: you might want to avoid sending HTML email on lkml, FWIW.
That is done by mistake. sorry for that. I will take care of that.
