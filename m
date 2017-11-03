From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] intel_ips: Convert timers to use timer_setup()
Date: Fri, 3 Nov 2017 14:26:38 +0200
Message-ID: <CAHp75VedYyfOA0A_2n+fLoScO-bWoj5_qtK7cnoZ3x2AG==uXw@mail.gmail.com>
References: <20171005005421.GA23936@beast> <CAHp75VdeS+dAQn_yE1gsgDzpv1+C5+c-AkgSgH5ScxAKFyRKWA@mail.gmail.com>
 <CAGXu5jJSnM7ZWqkyqVNpcmBKrGMfGx_C5wG5q63PF4SUV8HVwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jJSnM7ZWqkyqVNpcmBKrGMfGx_C5wG5q63PF4SUV8HVwQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 2, 2017 at 9:55 PM, Kees Cook <keescook@chromium.org> wrote:
> On Thu, Oct 5, 2017 at 1:41 AM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Thu, Oct 5, 2017 at 3:54 AM, Kees Cook <keescook@chromium.org> wrote:
>>> In preparation for unconditionally passing the struct timer_list pointer to
>>> all timer callbacks, switch to using the new timer_setup() and from_timer()
>>> to pass the timer pointer explicitly. Moves timer structure off stack and
>>> into struct ips_driver.
>>
>> Pushed to my testing queue, thanks!
>
> Hi,
>
> I don't see this in -next yet. Should the tip tree carry this conversion?

I thought it was a result of discussion since we lack of patch that
brought the core change.

However, because I merged Wolfram's immutable branch in order to apply
Hans' fix, I can carry your patch as well.

Either would be fine with me.

Going ahead, I applied it to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko
