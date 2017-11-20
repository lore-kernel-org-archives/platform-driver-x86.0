From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel_ips: Convert timers to use timer_setup()
Date: Mon, 20 Nov 2017 11:45:23 -0800
Message-ID: <20171120194523.GF379@fury>
References: <20171005005421.GA23936@beast>
 <CAHp75VdeS+dAQn_yE1gsgDzpv1+C5+c-AkgSgH5ScxAKFyRKWA@mail.gmail.com>
 <CAGXu5jJSnM7ZWqkyqVNpcmBKrGMfGx_C5wG5q63PF4SUV8HVwQ@mail.gmail.com>
 <CAHp75VedYyfOA0A_2n+fLoScO-bWoj5_qtK7cnoZ3x2AG==uXw@mail.gmail.com>
 <CAGXu5j+nuz0URjjxyLZHBek-yw7+Loqr0QQb_D6Vzj=h7zUWmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:52180 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752057AbdKTTp0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2017 14:45:26 -0500
Content-Disposition: inline
In-Reply-To: <CAGXu5j+nuz0URjjxyLZHBek-yw7+Loqr0QQb_D6Vzj=h7zUWmg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>

On Fri, Nov 17, 2017 at 05:30:48PM -0800, Kees Cook wrote:
> On Fri, Nov 3, 2017 at 5:26 AM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Thu, Nov 2, 2017 at 9:55 PM, Kees Cook <keescook@chromium.org> wrote:
> >> On Thu, Oct 5, 2017 at 1:41 AM, Andy Shevchenko
> >> <andy.shevchenko@gmail.com> wrote:
> >>> On Thu, Oct 5, 2017 at 3:54 AM, Kees Cook <keescook@chromium.org> wrote:
> >>>> In preparation for unconditionally passing the struct timer_list pointer to
> >>>> all timer callbacks, switch to using the new timer_setup() and from_timer()
> >>>> to pass the timer pointer explicitly. Moves timer structure off stack and
> >>>> into struct ips_driver.
> >>>
> >>> Pushed to my testing queue, thanks!
> >>
> >> Hi,
> >>
> >> I don't see this in -next yet. Should the tip tree carry this conversion?
> >
> > I thought it was a result of discussion since we lack of patch that
> > brought the core change.
> >
> > However, because I merged Wolfram's immutable branch in order to apply
> > Hans' fix, I can carry your patch as well.
> >
> > Either would be fine with me.
> >
> > Going ahead, I applied it to my review and testing queue, thanks!
> 
> Hi again!
> 
> I'm just checking on this patch -- I haven't seen it in a pull request
> to Linus yet (for the merge window he's threatened will be small).
> This is one of the remaining conversion patches I need in v4.15. Is
> this still planned to be merged for v4.15?

Hi Kees,

It went out the day after your note above in the platform-drivers-x86-v4.15-1
pull request. We're working through some issues with this pull request with
Linus now, but yes, it will make 4.15.

-- 
Darren Hart
VMware Open Source Technology Center
