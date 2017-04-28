From: Jean Delvare <jdelvare@suse.de>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Fri, 28 Apr 2017 15:20:21 +0200
Message-ID: <20170428152021.51d3b9c5@endymion>
References: <20170424113103.0de3ea31@endymion>
        <20170424140218.GR16239@windriver.com>
        <20170427214843.GB29261@fury>
        <1493335126.69096.481.camel@linux.intel.com>
        <20170428075514.dmywqqe5lpad67w5@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:47861 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S968709AbdD1NUZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 09:20:25 -0400
In-Reply-To: <20170428075514.dmywqqe5lpad67w5@hirez.programming.kicks-ass.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

Hi Peter,

On Fri, 28 Apr 2017 09:55:14 +0200, Peter Zijlstra wrote:
> On Thu, Apr 27, 2017 at 04:18:46PM -0700, Srinivas Pandruvada wrote:
> 
> > Before to this patch, only intel_pstate driver called these two
> > sched_xx() functions. intel_pstate can be only be built-in, so no
> > effort was made to export these functions when they were developed to
> > add ITMT support.
> > But turbo_max_3 driver driver will only load on a subset of non HWP
> > Broadwell systems, making module is not a bad idea. To do that we can
> > export these two sched_xx() functions as they are only related to ITMT
> > function anyway.
> > If Peter agrees, I can send a patch to change this.
> 
> I would really hate to expose sched_set_itmt_core_prio() to modules. Too
> much potential for trainwrecks.

These functions are already available. Not exporting them only forces
users to be built-in. This doesn't prevent anything, and in practice
makes things worse.

I don't really buy the argument of not letting legitimate users access
something they need in the name of preventing hypothetical abusers from
breaking things. If that ever happens, they will get the pain they
deserve. How do you care? If you want to put any limitations on what
people should be using these functions for, let's just document it?

> Also, this driver is dinky, making it a modules doesn't save anything
> much,

Not buying this either, sorry. Yes, size is one thing to consider for
such decisions, but that's only one factor. Amongst other factors is
how many users need the code in question. With:

static const struct x86_cpu_id itmt_legacy_cpu_ids[] = {
	ICPU(INTEL_FAM6_BROADWELL_X),
	{}
};
MODULE_DEVICE_TABLE(x86cpu, itmt_legacy_cpu_ids);

and

	if (boot_cpu_has(X86_FEATURE_HWP))
		return -ENODEV;

it is pretty clear to me that the share of users that will need this
driver is fairly limited.

If you would only consider the code size then there are several hundreds
of in-tree device drivers that shouldn't be modularized either, as they
are the same size or less. But you have to think globally, not
per-driver. Generic distribution kernels can only fly as long as all
hardware-specific code can be modularized.

-- 
Jean Delvare
SUSE L3 Support
