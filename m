From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on
 subsequent lines
Date: Wed, 13 Dec 2017 11:01:39 +0100
Message-ID: <CAOFm3uGEmR9Wq1O06CiaqncA4E7mxfgDm97NetOe0qL_mtpsSw@mail.gmail.com>
References: <20171213082301.23209-1-dhaval.shah@softnautics.com>
 <CAOFm3uEP-fGPiZt96QDvgXG1Ws8WgdFLbOsGumvhGSG-e7L0Ng@mail.gmail.com> <BM1PR0101MB1444C78FDA61BA59D578A5F8E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:45918 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752497AbdLMKCV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 05:02:21 -0500
Received: by mail-wm0-f53.google.com with SMTP id 9so3778538wme.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Dec 2017 02:02:21 -0800 (PST)
In-Reply-To: <BM1PR0101MB1444C78FDA61BA59D578A5F8E6350@BM1PR0101MB1444.INDPRD01.PROD.OUTLOOK.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dhaval Shah <dhaval.shah@softnautics.com>
Cc: "pali.rohar@gmail.com" <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Dhaval,

On Wed, Dec 13, 2017 at 10:52 AM, Dhaval Shah
<dhaval.shah@softnautics.com> wrote:
> HI
>
> Thanks a lot for the review.
> ________________________________________
>> From: Philippe Ombredanne <pombredanne@nexb.com>
>> Sent: Wednesday, December 13, 2017 2:54 PM
>> To: Dhaval Shah
>> Cc: pali.rohar@gmail.com; Darren Hart; Andy Shevchenko; platform-driver-=
x86@vger.kernel.org; LKML
>> Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on su=
bsequent lines
>>
>> Dhaval,
>>
>> On Wed, Dec 13, 2017 at 9:23 AM, Dhaval Shah
>> <dhaval.shah@softnautics.com> wrote:
>> > Resolved Block comments use * on subsequent lines checkpatch warnings.
>> > Issue found by checkpatch.
>> >
>> > Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
>> > ---
>> >  drivers/platform/x86/dell-rbtn.c | 26 +++++++++++++-------------
>> >  drivers/platform/x86/dell-rbtn.h | 26 +++++++++++++-------------
>> >  2 files changed, 26 insertions(+), 26 deletions(-)
>> >
>> > diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/d=
ell-rbtn.c
>> > index f3afe778001e..cab93c6dcd34 100644
>> > --- a/drivers/platform/x86/dell-rbtn.c
>> > +++ b/drivers/platform/x86/dell-rbtn.c
>> > @@ -1,17 +1,17 @@
>> >  /*
>> > -    Dell Airplane Mode Switch driver
>> > -    Copyright (C) 2014-2015  Pali Roh=C3=A1r <pali.rohar@gmail.com>
>> > -
>> > -    This program is free software; you can redistribute it and/or mod=
ify
>> > -    it under the terms of the GNU General Public License as published=
 by
>> > -    the Free Software Foundation; either version 2 of the License, or
>> > -    (at your option) any later version.
>> > -
>> > -    This program is distributed in the hope that it will be useful,
>> > -    but WITHOUT ANY WARRANTY; without even the implied warranty of
>> > -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> > -    GNU General Public License for more details.
>> > -*/
>> > + *   Dell Airplane Mode Switch driver
>> > + *   Copyright (C) 2014-2015  Pali Roh=C3=A1r <pali.rohar@gmail.com>
>> > + *
>> > + *   This program is free software; you can redistribute it and/or mo=
dify
>> > + *   it under the terms of the GNU General Public License as publishe=
d by
>> > + *   the Free Software Foundation; either version 2 of the License, o=
r
>> > + *   (at your option) any later version.
>> > + *
>> > + *   This program is distributed in the hope that it will be useful,
>> > + *   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> > + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> > + *   GNU General Public License for more details.
>> > + */
>>
>> Do you mind using the new SPDX ids instead of this long legalese?
>> You can check the doc patches from Thomas for details [1]
>>
>>
>> [1] https://lkml.org/lkml/2017/12/4/934
> This is different issue. If we need to fix the issue of this if we update=
 SPDX licensing as well.
> I am agree with you on the use of the new SPDX IDs instead of the long le=
galese.
> For this, we have to add the text "// SPDX-License-Identifier: GPL-2.0" a=
t the top of the file and remove the
> whole license part and keep on copyright and Author name related info. Af=
ter change, it looks like
> // SPDX-License-Identifier: GPL-2.0
> /*
>  *  Dell Airplane Mode Switch driver
>  *  Copyright (C) 2014-2015  Pali Roh=C3=A1r <pali.rohar@gmail.com>
>  */

And for a short comment block like this, Linus preference is to avoid
mixing comment style and go all the way C++ style as in:

> // SPDX-License-Identifier: GPL-2.0
> // Dell Airplane Mode Switch driver
> // Copyright (C) 2014-2015  Pali Roh=C3=A1r <pali.rohar@gmail.com>

... for even less boilerplate ;)

See Linus comments for a rationale [1] [2] [3] [4] [5]

[1] https://lkml.org/lkml/2017/11/25/133
[2] https://lkml.org/lkml/2017/11/25/125
[3] https://lkml.org/lkml/2017/11/2/715
[4] https://lkml.org/lkml/2017/11/2/805

--=20
Cordially
Philippe Ombredanne
