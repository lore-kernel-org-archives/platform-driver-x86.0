From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on
 subsequent lines
Date: Wed, 13 Dec 2017 07:39:32 -0800
Message-ID: <1513179572.27409.8.camel@perches.com>
References: <20171213082301.23209-1-dhaval.shah@softnautics.com>
         <CAOFm3uEP-fGPiZt96QDvgXG1Ws8WgdFLbOsGumvhGSG-e7L0Ng@mail.gmail.com>
         <BM1PR0101MB1444C78FDA61BA59D578A5F8E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
         ,<CAOFm3uGEmR9Wq1O06CiaqncA4E7mxfgDm97NetOe0qL_mtpsSw@mail.gmail.com>
         <e482b906981f4b46b2336bebba28888bBM1PR0101MB144449CA7ADDBA3A03061AAFE6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
        ,<1513167907.27409.3.camel@perches.com>
         <BM1PR0101MB1444566FE5F5FB785ED97B28E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BM1PR0101MB1444566FE5F5FB785ED97B28E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Dhaval Shah <dhaval.shah@softnautics.com>, Philippe Ombredanne <pombredanne@nexb.com>
Cc: "pali.rohar@gmail.com" <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2017-12-13 at 12:41 +0000, Dhaval Shah wrote:
> > If anyone does conversions of these license texts
> > you have to be _extremely_ careful about what
> > specific license identifier you use.
> > This license includes the text
> >         "or (at your option) any later version"
> > which is not the same as using
> >         SPDX-License-Identifier: GPL-2.0
> 
> I have given this SPDX ID based on the current license info in the driver.

No, you have not.
You have done it incorrectly.

For a short description, read:
https://spdx.org/sites/cpstandard/files/pages/files/using_spdx_license_list_short_identifiers.pdf
page 5
