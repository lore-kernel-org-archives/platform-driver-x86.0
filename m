From: Darren Hart <dvhart@infradead.org>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Fri, 28 Apr 2017 08:49:54 -0700
Message-ID: <20170428154954.GA7257@fury>
References: <20170424113103.0de3ea31@endymion>
 <20170424140218.GR16239@windriver.com>
 <20170427214843.GB29261@fury>
 <1493335126.69096.481.camel@linux.intel.com>
 <20170428075514.dmywqqe5lpad67w5@hirez.programming.kicks-ass.net>
 <20170428152021.51d3b9c5@endymion>
 <20170428134658.debsavx7vjkj3zgz@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:60273 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1426286AbdD1Pt7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 11:49:59 -0400
Content-Disposition: inline
In-Reply-To: <20170428134658.debsavx7vjkj3zgz@hirez.programming.kicks-ass.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jean Delvare <jdelvare@suse.de>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

On Fri, Apr 28, 2017 at 03:46:58PM +0200, Peter Zijlstra wrote:
> On Fri, Apr 28, 2017 at 03:20:21PM +0200, Jean Delvare wrote:
> > Hi Peter,
> > 
> > On Fri, 28 Apr 2017 09:55:14 +0200, Peter Zijlstra wrote:
> > > On Thu, Apr 27, 2017 at 04:18:46PM -0700, Srinivas Pandruvada wrote:
> > > 
> > > > Before to this patch, only intel_pstate driver called these two
> > > > sched_xx() functions. intel_pstate can be only be built-in, so no
> > > > effort was made to export these functions when they were developed to
> > > > add ITMT support.
> > > > But turbo_max_3 driver driver will only load on a subset of non HWP
> > > > Broadwell systems, making module is not a bad idea. To do that we can
> > > > export these two sched_xx() functions as they are only related to ITMT
> > > > function anyway.
> > > > If Peter agrees, I can send a patch to change this.
> > > 
> > > I would really hate to expose sched_set_itmt_core_prio() to modules. Too
> > > much potential for trainwrecks.
> > 
> > These functions are already available. Not exporting them only forces
> > users to be built-in. This doesn't prevent anything, and in practice
> > makes things worse.
> 
> How are they available? The only way a module can access this is by
> grubbing around kernel internals, basically doing a manual link stage.

Well it's a rare thing, but I don't agree. The driver can use this function
already, to do so it just builds itself in and not as a module. So as Jean
points out, the only affect this policy has is to encourage people not to build
as modules, which makes the job of the distributions all that much harder.

Further, we (the kernel community) have made it abundantly clear that we
couldn't care less about out of tree drivers, so they shouldn't even be part of
this discussion. So the only code that matters is in-tree drivers, and they can
already use this....

Now for my part, I'm starting to take the very unpopular position that the
"stable-abi-nonsense" isn't all that it's cracked up to be, and we would see
better upstream behavior if we provided a couple of layers of APIs, core and
subsystem, and guaranteed some term of stability for them so leaf node drivers
could be developed without such a strong binding to the kernel. But - I suspect
I'm fairly alone in this position among kernel maintainers - but if that's the
case, then this argument for *not* exporting a function seems to be coming from
the wrong side of this divide.

> 
> Its obvious that anybody doing something that like that gets to keep
> whatever pieces they end up with.
> 
> Exporting a symbol OTOH will announce that its OK to use; something very
> much not the case here. I really don't want joe-random module tinkerer
> to _ever_ even consider using this function.

What makes this one so special? It is really unclear to me what criteria we use
to decide which functions we export and which we do not. Given that any in tree
driver can use most any function, this policy doesn't appear to be able to have
a positive impact on in-tree drivers.

> In fact, if I could I would restrict / remove a number of functions
> already exported. I'd love to have something like
> 
>   EXPORT_SYMBOL_MOD(symbol, "modnames");
> 
> That only allows those whitelisted modules to touch that symbol.
> 
> Randomly exporting everything just because one stupid little module
> thinks it might need it, hell no.
> 
> I would really rather sooner delete this driver than export that symbol.
> 

So what makes the driver stupid? Is it doing something fundamentally wrong? If
so, then perhaps I failed to spot it and never should have merged it? If not,
then the fault doesn't lie with the driver.

Like I said, it's rare that I will disagree with Peter, but as things stand, I
don't have the context that I would need to support this policy independently.
So the next time something similar comes up, we'll be right back here. So I
either need to dig up that context, or we may need to address the issue
differently.

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
