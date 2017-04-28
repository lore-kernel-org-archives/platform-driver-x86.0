From: Darren Hart <dvhart@infradead.org>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Fri, 28 Apr 2017 15:51:53 -0700
Message-ID: <20170428225153.GB32336@fury>
References: <20170424113103.0de3ea31@endymion>
 <20170424140218.GR16239@windriver.com>
 <20170428094930.6ba0ba1f@endymion>
 <20170428174437.GO23334@windriver.com>
 <20170428204949.GA3960@fury>
 <20170428213434.lljyvywigcguupjm@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:57314 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1035982AbdD1Wv4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 18:51:56 -0400
Content-Disposition: inline
In-Reply-To: <20170428213434.lljyvywigcguupjm@hirez.programming.kicks-ass.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Jean Delvare <jdelvare@suse.de>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

On Fri, Apr 28, 2017 at 11:34:34PM +0200, Peter Zijlstra wrote:
> On Fri, Apr 28, 2017 at 01:49:49PM -0700, Darren Hart wrote:
> > > > Non-modular drivers do not scale. This is a serious issue considering
> > > > the growth rate of the kernel.
> > > 
> > > Again, this is an oversimplification that doesn't reflect reality.
> > > There are many valid reasons why some drivers be built-in only.  The
> > > whole world isn't a distro looking to say "=m" to every config option
> > > simply because they don't have the time or resources to actually triage
> > > them all and see what is relevant for their use case(es).
> > > 
> > 
> > The point is valid though, and something we need to be keeping an eye on,
> > especially with all the non-architectural SoC feature drivers we're seeing code
> > roll in for. I appreciate you raising the concern Jean.
> 
> FWIW:
> 
> There's things like ACPI-Processor-Idle and intel_idle that need to be
> built-in for correctness sake.
> 
> They can mark the TSC unstable, and this should be done before we run
> userspace, which with unstable TSC could see wobbly time before we kill
> the TSC.
> 
> This is a somewhat non-obvious case, and on the face of it those could
> be modular drivers. But building them as modules gets them loaded far
> too late if ever.
> 
> These are subtle things and easily overlooked.

Thanks Peter, I will be sure to do my due diligence in determining why something
may be bool before applying incoming patches to change that. This isn't clearly
documented in intel_idle for example, but it is at least explicitly described in
the git log for the Kconfig.

-- 
Darren Hart
VMware Open Source Technology Center
