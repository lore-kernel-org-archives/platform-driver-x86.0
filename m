From: Darren Hart <dvhart@infradead.org>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Fri, 28 Apr 2017 13:49:49 -0700
Message-ID: <20170428204949.GA3960@fury>
References: <20170424113103.0de3ea31@endymion>
 <20170424140218.GR16239@windriver.com>
 <20170428094930.6ba0ba1f@endymion>
 <20170428174437.GO23334@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:44625 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1422881AbdD1Utx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 16:49:53 -0400
Content-Disposition: inline
In-Reply-To: <20170428174437.GO23334@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Jean Delvare <jdelvare@suse.de>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

On Fri, Apr 28, 2017 at 01:44:37PM -0400, Paul Gortmaker wrote:
> [Re: intel_turbo_max_3 non-modularity] On 28/04/2017 (Fri 09:49) Jean Delvare wrote:
> 
> > Hi Paul,
> > 
> > On Mon, 24 Apr 2017 10:02:18 -0400, Paul Gortmaker wrote:
> > > [intel_turbo_max_3 non-modularity] On 24/04/2017 (Mon 11:31) Jean Delvare wrote:
> > > 
> > > > I see that the intel_turbo_max_3 driver was originally supposed to be
> > > > modular, and then support for that possibility was removed. Is there
> > > > any fundamental reason why this driver can't be built as a module?
> > > 
> > > Re-reading the thread, it was stated that the driver needed exports of
> > > some scheduler functions that weren't currently exported.  To me, that
> > > means one of two things -- the driver is poking at scheduler internals
> > > that it shouldn't be and needs to be modified accordingly, or that
> > > someone needs to convince the sched folks that there is valid use cases
> > > for exports of these functions, and _then_ enable modularity.
> > > 
> > > I didn't try to build it as a module, so I can't say what the sched
> > > dependencies were, or if they looked valid.  But I have seen the sched
> > > folks being not impressed at how certain arch specific PM/freq stuff has
> > > been implemented in the past, which is why I mention it as a possibility.
> > 
> > Thanks for the explanations. I understand that the purpose of your
> > patch (commit af050abb5c2e, "platform/x86: intel_turbo_max_3: make it
> > explicitly non-modular") was to get things square, and I have seen many
> > similar patches from you in the past. However please realize that going
> > for the easiest solution (dropping modular support altogether) isn't
> > always the best thing to do.
> 
> I don't think saying that "always using the easiest solution" is at all
> an accurate characterization.  I've nearly always indicated that
> conversion to tristate was an option _if_ there was a use case and/or if
> maintainers wanted that; and indeed I've converted several drivers to
> tristate when requested.  I've also indicated many times why converting
> to tristate can't be the default choice.  I won't repeat them all again
> here.
> 
> Also, as you've now seen, the scheduler exports that I warned about are
> indeed contentious, so the non-modular path taken here was valid, given
> that background knowledge.

All true. I appreciate the contributions, please keep them coming :-)

> 
> > 
> > It's the same story as fixing compiler warnings. One should either
> > look for the right way to fix them, or leave things as they are, to
> > give others a chance to step in. Similar to compiler warnings,
> > half-modular code is also an opportunity to make things better. In my
> > experience, once the code is cleanly non-modular, the chances that
> > someone looks into why it is so and whether it could be modularized
> > get significantly lower.
> 
> I'd counter that the dead code would remain there untouched.  At least
> this way we are aware of what is dead code, and by shining a light on
> that, we can decide whether to remove it or properly modularize it; and
> now because of doing this we do indeed have more modular drivers than we
> had before.
> 
> > 
> > Non-modular drivers do not scale. This is a serious issue considering
> > the growth rate of the kernel.
> 
> Again, this is an oversimplification that doesn't reflect reality.
> There are many valid reasons why some drivers be built-in only.  The
> whole world isn't a distro looking to say "=m" to every config option
> simply because they don't have the time or resources to actually triage
> them all and see what is relevant for their use case(es).
> 

The point is valid though, and something we need to be keeping an eye on,
especially with all the non-architectural SoC feature drivers we're seeing code
roll in for. I appreciate you raising the concern Jean.

To Paul's point, several things should just be off in Generic distro kernels,
and I think SILEAD_DMI is particularly good example of something that can be off
in all such kernels with a high probability of impacting 0 users. This
particular driver (turbo_max_3) however, is one that I would think Intel would
want to see enabled.

+Srinivas
+Peter Z

I'm not going to win this argument with Peter Z on exporting those two
functions, he's taken a strong position on that with specific reasons, and
that's his call to make. My advice to Srinivas would be to discuss the needs of
the driver with Peter and see if some sort of abstraction which can be
EXPORT_SYMBOL'd can be added, which provides the necessary functionality, but
doesn't expose so much control of scheduler internals (load balancing) to all
modules. Something similar to what Steven Rostedt did with sched_clock()
(local_trace_clock()). Once that is available, we can make this one modular.

Failing that, this discussion needs to move to the scheduler as there is nothing
we can do about it here other than delete the driver, which I'm not inclined to do.

-- 
Darren Hart
VMware Open Source Technology Center
