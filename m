From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on
 subsequent lines
Date: Thu, 14 Dec 2017 09:12:06 +0000
Message-ID: <BM1PR0101MB14445D796D67A2A4C0C002B4E60A0@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
References: <20171213082301.23209-1-dhaval.shah@softnautics.com>
         <CAOFm3uEP-fGPiZt96QDvgXG1Ws8WgdFLbOsGumvhGSG-e7L0Ng@mail.gmail.com>
         <BM1PR0101MB1444C78FDA61BA59D578A5F8E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
         ,<CAOFm3uGEmR9Wq1O06CiaqncA4E7mxfgDm97NetOe0qL_mtpsSw@mail.gmail.com>
         <e482b906981f4b46b2336bebba28888bBM1PR0101MB144449CA7ADDBA3A03061AAFE6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
        ,<1513167907.27409.3.camel@perches.com>
         <BM1PR0101MB1444566FE5F5FB785ED97B28E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>,<1513179572.27409.8.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bo1ind01on0090.outbound.protection.outlook.com ([104.47.101.90]:38624
        "EHLO IND01-BO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750737AbdLNJML (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Dec 2017 04:12:11 -0500
In-Reply-To: <1513179572.27409.8.camel@perches.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>, Philippe Ombredanne <pombredanne@nexb.com>
Cc: "pali.rohar@gmail.com" <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

________________________________________
> From: Joe Perches <joe@perches.com>
> Sent: Wednesday, December 13, 2017 9:09 PM
> To: Dhaval Shah; Philippe Ombredanne
> Cc: pali.rohar@gmail.com; Darren Hart; Andy Shevchenko; platform-driver-x=
86@vger.kernel.org; LKML
> Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on sub=
sequent lines
>=20
> On Wed, 2017-12-13 at 12:41 +0000, Dhaval Shah wrote:
> > > If anyone does conversions of these license texts
> > > you have to be _extremely_ careful about what
> > > specific license identifier you use.
> > > This license includes the text
> > >         "or (at your option) any later version"
> > > which is not the same as using
> > >         SPDX-License-Identifier: GPL-2.0
> >
> > I have given this SPDX ID based on the current license info in the driv=
er.
>=20
> No, you have not.
> You have done it incorrectly.
>=20
> For a short description, read:
> https://spdx.org/sites/cpstandard/files/pages/files/using_spdx_license_li=
st_short_identifiers.pdf
> page 5
I got your point. SPDX text should be "SPDX-License-Identifier: GPL-2.0+".
Am i Right?
