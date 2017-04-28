From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Fri, 28 Apr 2017 18:34:17 +0200
Message-ID: <20170428163417.uwrd73vrnqjp6vck@hirez.programming.kicks-ass.net>
References: <20170424113103.0de3ea31@endymion>
 <20170424140218.GR16239@windriver.com>
 <20170427214843.GB29261@fury>
 <1493335126.69096.481.camel@linux.intel.com>
 <20170428075514.dmywqqe5lpad67w5@hirez.programming.kicks-ass.net>
 <20170428152021.51d3b9c5@endymion>
 <20170428134658.debsavx7vjkj3zgz@hirez.programming.kicks-ass.net>
 <20170428154954.GA7257@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:37708 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424128AbdD1QeZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 12:34:25 -0400
Content-Disposition: inline
In-Reply-To: <20170428154954.GA7257@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Jean Delvare <jdelvare@suse.de>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

On Fri, Apr 28, 2017 at 08:49:54AM -0700, Darren Hart wrote:
> On Fri, Apr 28, 2017 at 03:46:58PM +0200, Peter Zijlstra wrote:

> > How are they available? The only way a module can access this is by
> > grubbing around kernel internals, basically doing a manual link stage.
> 
> Well it's a rare thing, but I don't agree. The driver can use this function
> already, to do so it just builds itself in and not as a module.

And _that_ is the crucial difference. It means that the source needs to
be available to whomever builds the kernel.

It means that whoever builds the kernel can validate behaviour.

All that goes out the window the moment you expose an interface to
modules.

> Further, we (the kernel community) have made it abundantly clear that we
> couldn't care less about out of tree drivers, so they shouldn't even be part of
> this discussion. So the only code that matters is in-tree drivers, and they can
> already use this....

I don't much care for out-of-tree crap (as you well know), but the fact
is that it exists and people do use it. Heck some binary only modules
are even quite common/popular :-(

So I think its realistic to be weary of our module interface.

> What makes this one so special?

It can completely mess up the load-balancer if used in creative ways. I
just don't want to spend a minute having to worry about that.
