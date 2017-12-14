From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on
 subsequent lines
Date: Thu, 14 Dec 2017 19:56:40 +0200
Message-ID: <CAHp75VdZ=2YaSHM2BQnWjcnMjnNpVSA7EFf0iHmtmSzBP8Ur8A@mail.gmail.com>
References: <20171213082301.23209-1-dhaval.shah@softnautics.com>
 <CAOFm3uEP-fGPiZt96QDvgXG1Ws8WgdFLbOsGumvhGSG-e7L0Ng@mail.gmail.com>
 <BM1PR0101MB1444C78FDA61BA59D578A5F8E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
 <CAOFm3uGEmR9Wq1O06CiaqncA4E7mxfgDm97NetOe0qL_mtpsSw@mail.gmail.com>
 <e482b906981f4b46b2336bebba28888bBM1PR0101MB144449CA7ADDBA3A03061AAFE6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
 <1513167907.27409.3.camel@perches.com> <BM1PR0101MB1444566FE5F5FB785ED97B28E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
 <1513179572.27409.8.camel@perches.com> <BM1PR0101MB14445D796D67A2A4C0C002B4E60A0@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:44858 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753711AbdLNR4l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Dec 2017 12:56:41 -0500
In-Reply-To: <BM1PR0101MB14445D796D67A2A4C0C002B4E60A0@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dhaval Shah <dhaval.shah@softnautics.com>
Cc: Joe Perches <joe@perches.com>, Philippe Ombredanne <pombredanne@nexb.com>, "pali.rohar@gmail.com" <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, Dec 14, 2017 at 11:12 AM, Dhaval Shah
<dhaval.shah@softnautics.com> wrote:

> I got your point. SPDX text should be "SPDX-License-Identifier: GPL-2.0+".
> Am i Right?

Whatever you come up with I will apply taking into consideration the following:
1. Linus' preference over comment style.
2. Module author(s) blessing for the change.

Without above on the table I would not even look into the message.

P.S. And personally I'm a bit sceptical about standalone (coment)
style changes. I would rather not to apply anything like this without
real need.

-- 
With Best Regards,
Andy Shevchenko
