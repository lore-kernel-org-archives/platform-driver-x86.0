From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Fri, 28 Apr 2017 13:44:37 -0400
Message-ID: <20170428174437.GO23334@windriver.com>
References: <20170424113103.0de3ea31@endymion>
 <20170424140218.GR16239@windriver.com>
 <20170428094930.6ba0ba1f@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:63573 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2999309AbdD1RpS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 13:45:18 -0400
Content-Disposition: inline
In-Reply-To: <20170428094930.6ba0ba1f@endymion>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

[Re: intel_turbo_max_3 non-modularity] On 28/04/2017 (Fri 09:49) Jean Delvare wrote:

> Hi Paul,
> 
> On Mon, 24 Apr 2017 10:02:18 -0400, Paul Gortmaker wrote:
> > [intel_turbo_max_3 non-modularity] On 24/04/2017 (Mon 11:31) Jean Delvare wrote:
> > 
> > > I see that the intel_turbo_max_3 driver was originally supposed to be
> > > modular, and then support for that possibility was removed. Is there
> > > any fundamental reason why this driver can't be built as a module?
> > 
> > Re-reading the thread, it was stated that the driver needed exports of
> > some scheduler functions that weren't currently exported.  To me, that
> > means one of two things -- the driver is poking at scheduler internals
> > that it shouldn't be and needs to be modified accordingly, or that
> > someone needs to convince the sched folks that there is valid use cases
> > for exports of these functions, and _then_ enable modularity.
> > 
> > I didn't try to build it as a module, so I can't say what the sched
> > dependencies were, or if they looked valid.  But I have seen the sched
> > folks being not impressed at how certain arch specific PM/freq stuff has
> > been implemented in the past, which is why I mention it as a possibility.
> 
> Thanks for the explanations. I understand that the purpose of your
> patch (commit af050abb5c2e, "platform/x86: intel_turbo_max_3: make it
> explicitly non-modular") was to get things square, and I have seen many
> similar patches from you in the past. However please realize that going
> for the easiest solution (dropping modular support altogether) isn't
> always the best thing to do.

I don't think saying that "always using the easiest solution" is at all
an accurate characterization.  I've nearly always indicated that
conversion to tristate was an option _if_ there was a use case and/or if
maintainers wanted that; and indeed I've converted several drivers to
tristate when requested.  I've also indicated many times why converting
to tristate can't be the default choice.  I won't repeat them all again
here.

Also, as you've now seen, the scheduler exports that I warned about are
indeed contentious, so the non-modular path taken here was valid, given
that background knowledge.

> 
> It's the same story as fixing compiler warnings. One should either
> look for the right way to fix them, or leave things as they are, to
> give others a chance to step in. Similar to compiler warnings,
> half-modular code is also an opportunity to make things better. In my
> experience, once the code is cleanly non-modular, the chances that
> someone looks into why it is so and whether it could be modularized
> get significantly lower.

I'd counter that the dead code would remain there untouched.  At least
this way we are aware of what is dead code, and by shining a light on
that, we can decide whether to remove it or properly modularize it; and
now because of doing this we do indeed have more modular drivers than we
had before.

> 
> Non-modular drivers do not scale. This is a serious issue considering
> the growth rate of the kernel.

Again, this is an oversimplification that doesn't reflect reality.
There are many valid reasons why some drivers be built-in only.  The
whole world isn't a distro looking to say "=m" to every config option
simply because they don't have the time or resources to actually triage
them all and see what is relevant for their use case(es).

Paul.
