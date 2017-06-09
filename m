From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Fri, 9 Jun 2017 12:29:35 +0300
Message-ID: <CAHp75VeOVjzyqmagu56jH08uQEQwcMb+k6yY8Zdo-0iAmwRpMA@mail.gmail.com>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
 <201705271517.30111@pali> <CAHp75VfkudDRNTh9dR=y4G5HD+OaPoxjxVZgw6=9-YpOn4sJSA@mail.gmail.com>
 <201705272248.13257@pali> <CAHp75VdmMwEvho-2tRoYz3CGz2QvLr40G6Nf7wQ76LCtxFjT4g@mail.gmail.com>
 <20170608151618.GE32509@fury> <20170609082902.GR4690@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:36736 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751505AbdFIJ3g (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Jun 2017 05:29:36 -0400
In-Reply-To: <20170609082902.GR4690@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 9, 2017 at 11:29 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Thursday 08 June 2017 08:16:18 Darren Hart wrote:
>> On Sat, May 27, 2017 at 11:49:22PM +0300, Andy Shevchenko wrote:
>> > On Sat, May 27, 2017 at 11:48 PM, Pali Roh=C3=A1r <pali.rohar@gmail.co=
m> wrote:
>> > > On Saturday 27 May 2017 15:33:14 Andy Shevchenko wrote:
>> > >> On Sat, May 27, 2017 at 4:17 PM, Pali Roh=C3=A1r <pali.rohar@gmail.=
com>
>> > >> wrote:
>> >
>> > >> Okay, got it. But on your opinion does it make sense to do
>> > >>
>> > >> pr_info("\tobject_id: %2pE\n", g->object_id);
>> > >>
>> > >> instead?
>> > >>
>> > >> For ASCII it will go as is previously, otherwise escaping would be
>> > >> done.
>> > >
>> > > Both is OK for me. Do you want to send a new patch with %2pE?
>> >
>> > To me it looks slightly cleaner.
>>
>> I don't want to let this one fall through the cracks. Pali, is a new one=
 coming?
>
> So.. which modifier to use? Andy already proposed two alternatives and
> basically I'm fine all 3 which are in this thread.

I would go with %2pE.
Rationale:
 - we are not going to change size
 - E is just a guard against _possible_ broken data

--=20
With Best Regards,
Andy Shevchenko
