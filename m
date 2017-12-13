From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on
 subsequent lines
Date: Wed, 13 Dec 2017 04:25:07 -0800
Message-ID: <1513167907.27409.3.camel@perches.com>
References: <20171213082301.23209-1-dhaval.shah@softnautics.com>
         <CAOFm3uEP-fGPiZt96QDvgXG1Ws8WgdFLbOsGumvhGSG-e7L0Ng@mail.gmail.com>
         <BM1PR0101MB1444C78FDA61BA59D578A5F8E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
        ,<CAOFm3uGEmR9Wq1O06CiaqncA4E7mxfgDm97NetOe0qL_mtpsSw@mail.gmail.com>
         <e482b906981f4b46b2336bebba28888bBM1PR0101MB144449CA7ADDBA3A03061AAFE6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay0027.hostedemail.com ([216.40.44.27]:42269 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752609AbdLMMZL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 07:25:11 -0500
In-Reply-To: <e482b906981f4b46b2336bebba28888bBM1PR0101MB144449CA7ADDBA3A03061AAFE6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dhaval Shah <dhaval.shah@softnautics.com>, Philippe Ombredanne <pombredanne@nexb.com>
Cc: "pali.rohar@gmail.com" <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, 2017-12-13 at 10:53 +0000, Dhaval Shah wrote:
> > > This is different issue. If we need to fix the issue of this if we update SPDX licensing as well.
> > > I am agree with you on the use of the new SPDX IDs instead of the long legalese.
> > > For this, we have to add the text "// SPDX-License-Identifier: GPL-2.0" at the top of the file and remove the
> > > whole license part and keep on copyright and Author name related info. After change, it looks like
> > > // SPDX-License-Identifier: GPL-2.0
> > > /*
> > >   *  Dell Airplane Mode Switch driver
> > >   *  Copyright (C) 2014-2015  Pali Rohár <pali.rohar@gmail.com>
> > >   */
> > 
> > And for a short comment block like this, Linus preference is to avoid
> > mixing comment style and go all the way C++ style as in:
> > 
> > > // SPDX-License-Identifier: GPL-2.0
> > > // Dell Airplane Mode Switch driver
> > > // Copyright (C) 2014-2015  Pali Rohár <pali.rohar@gmail.com>
> > > 
> > > ... for even less boilerplate ;)
> 
> Thanks a lot for the link.
> Do you want to me to update along with SPDX in this patchset with V2 or we will update in the next patchset once this patch merge?

If anyone does conversions of these license texts
you have to be _extremely_ careful about what
specific license identifier you use.

This license includes the text
	"or (at your option) any later version"
which is not the same as using
	SPDX-License-Identifier: GPL-2.0
