From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on
 subsequent lines
Date: Wed, 13 Dec 2017 13:57:15 +0100
Message-ID: <CAOFm3uGVjKxk8B-LRGEFMTC_AT78pFFfz2pjixC4up4Kn8b+pQ@mail.gmail.com>
References: <20171213082301.23209-1-dhaval.shah@softnautics.com>
 <CAOFm3uEP-fGPiZt96QDvgXG1Ws8WgdFLbOsGumvhGSG-e7L0Ng@mail.gmail.com>
 <BM1PR0101MB1444C78FDA61BA59D578A5F8E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
 <CAOFm3uGEmR9Wq1O06CiaqncA4E7mxfgDm97NetOe0qL_mtpsSw@mail.gmail.com> <BM1PR0101MB144449CA7ADDBA3A03061AAFE6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:32872 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753027AbdLMM55 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 07:57:57 -0500
Received: by mail-wm0-f49.google.com with SMTP id g130so21764605wme.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Dec 2017 04:57:56 -0800 (PST)
In-Reply-To: <BM1PR0101MB144449CA7ADDBA3A03061AAFE6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dhaval Shah <dhaval.shah@softnautics.com>
Cc: "pali.rohar@gmail.com" <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Dhaval,

On Wed, Dec 13, 2017 at 11:47 AM, Dhaval Shah
<dhaval.shah@softnautics.com> wrote:

<snip>
> > And for a short comment block like this, Linus preference is to avoid
> > mixing comment style and go all the way C++ style as in:
> >
> > > // SPDX-License-Identifier: GPL-2.0
> > > // Dell Airplane Mode Switch driver
> > > // Copyright (C) 2014-2015  Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > >
> > > ... for even less boilerplate ;)
>
> Thanks a lot for the link.
> Do you want to me to update along with SPDX in this patchset with V2 or w=
e will update in the next patchset once this patch merge?

That's not for me to decide, I am just a lowly licensing elf helper scruffy=
!

PS: you might want to avoid sending HTML email on lkml, FWIW.

--=20
Cordially
Philippe Ombredanne
