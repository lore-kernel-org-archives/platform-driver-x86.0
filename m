From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] intel_ips: Convert timers to use timer_setup()
Date: Fri, 17 Nov 2017 17:30:48 -0800
Message-ID: <CAGXu5j+nuz0URjjxyLZHBek-yw7+Loqr0QQb_D6Vzj=h7zUWmg@mail.gmail.com>
References: <20171005005421.GA23936@beast> <CAHp75VdeS+dAQn_yE1gsgDzpv1+C5+c-AkgSgH5ScxAKFyRKWA@mail.gmail.com>
 <CAGXu5jJSnM7ZWqkyqVNpcmBKrGMfGx_C5wG5q63PF4SUV8HVwQ@mail.gmail.com> <CAHp75VedYyfOA0A_2n+fLoScO-bWoj5_qtK7cnoZ3x2AG==uXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:42832 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763881AbdKRBat (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2017 20:30:49 -0500
Received: by mail-it0-f65.google.com with SMTP id n134so6185288itg.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Nov 2017 17:30:49 -0800 (PST)
In-Reply-To: <CAHp75VedYyfOA0A_2n+fLoScO-bWoj5_qtK7cnoZ3x2AG==uXw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>

On Fri, Nov 3, 2017 at 5:26 AM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Nov 2, 2017 at 9:55 PM, Kees Cook <keescook@chromium.org> wrote:
>> On Thu, Oct 5, 2017 at 1:41 AM, Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Thu, Oct 5, 2017 at 3:54 AM, Kees Cook <keescook@chromium.org> wrote:
>>>> In preparation for unconditionally passing the struct timer_list pointer to
>>>> all timer callbacks, switch to using the new timer_setup() and from_timer()
>>>> to pass the timer pointer explicitly. Moves timer structure off stack and
>>>> into struct ips_driver.
>>>
>>> Pushed to my testing queue, thanks!
>>
>> Hi,
>>
>> I don't see this in -next yet. Should the tip tree carry this conversion?
>
> I thought it was a result of discussion since we lack of patch that
> brought the core change.
>
> However, because I merged Wolfram's immutable branch in order to apply
> Hans' fix, I can carry your patch as well.
>
> Either would be fine with me.
>
> Going ahead, I applied it to my review and testing queue, thanks!

Hi again!

I'm just checking on this patch -- I haven't seen it in a pull request
to Linus yet (for the merge window he's threatened will be small).
This is one of the remaining conversion patches I need in v4.15. Is
this still planned to be merged for v4.15?

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
