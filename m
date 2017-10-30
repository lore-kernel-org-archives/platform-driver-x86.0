From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Fix radio LED detection
Date: Mon, 30 Oct 2017 16:13:53 +0200
Message-ID: <CAHp75Vf-kohM2sTeDsoT2dPbHSQDd0eGU0FDA9Ua+CXrxvzigg@mail.gmail.com>
References: <20171025042946.13225-1-kernel@kempniu.pl> <CAHp75Vc50cjeYCp9dOfRxAaRJnjN2E5aMRA_iBHXz43=m9UUtw@mail.gmail.com>
 <20171029212806.GA8470@kmp-mobile.hq.kempniu.pl> <CAHp75VdJqWTgFhM8dcxkQzUfE7kEvTXQgaz04FVqgXayu8tLkg@mail.gmail.com>
 <20171030121257.GA28737@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:43473 "EHLO
        mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751700AbdJ3ONy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Oct 2017 10:13:54 -0400
In-Reply-To: <20171030121257.GA28737@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Harvey <harv@gmx.de>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Oct 30, 2017 at 2:12 PM, Jonathan Woithe <jwoithe@just42.net> wrote:
> On Mon, Oct 30, 2017 at 01:21:50PM +0200, Andy Shevchenko wrote:
>> On Sun, Oct 29, 2017 at 11:28 PM, Micha?? K??pie?? <kernel@kempniu.pl> wrote:
>> >> On Wed, Oct 25, 2017 at 7:29 AM, Micha?? K??pie?? <kernel@kempniu.pl> wrote:
>> >> > Radio LED detection method implemented in commit 4f62568c1fcf
>> >> > ("fujitsu-laptop: Support radio LED") turned out to be incorrect as it
>> >> > causes a radio LED to be erroneously detected on a Fujitsu Lifebook E751
>> >> > which has a slide switch (and thus no radio LED).  Use bit 17 of
>> >> > flags_supported (the value returned by method S000 of ACPI device
>> >> > FUJ02E3) to determine whether a radio LED is present as it seems to be a
>> >> > more reliable indicator, based on comparing DSDT tables of four Fujitsu
>> >> > Lifebook models (E744, E751, S7110, S8420).
>> >> >
>> >>
>> >> Pushed to my review and testing queue, thanks!
>> >
>> > I forgot that this patch can also be tagged with:
>> >
>> > Fixes: 4f62568c1fcf ("fujitsu-laptop: Support radio LED")
>>
>> Added.
>>
>> Do you consider this an important fix? We are at -rc7 now, I'm not
>> sure it's so critical. Tell me if you consider otherwise.
>
> I agree - from my perspective I wouldn't have thought it so critical as to
> push it out this late in the development cycle.  It's not a regression as
> such and is largely cosmetic.  Others may argue differently though.
>

Got it!

> BTW, it looks like you may have missed my Reviewed-by tag on this patch,
> sent on 25 Oct.  There was also a Tested-by added by Heinrich Siebmanns on
> the same day:
>
> Reviewed-by: Jonathan Woithe <jwoithe@just42.net>
> Tested-by: Heinrich Siebmanns <harv@gmx.de>

The first one is indeed missed and sorry, can't touch the change
anymore (it is published now).
The second one is there.

So, I applied a patch with tags that were parsed by patchwork at that time.
Since Heinrich's ones are there, perhaps something happened to your
tag that it wasn't recognized, sorry.

> Or perhaps such peripheral tags aren't carried forward on patches like this,
> in which case it's a moot point.

It's okay to have them.

-- 
With Best Regards,
Andy Shevchenko
