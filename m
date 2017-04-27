From: Darren Hart <dvhart@infradead.org>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Thu, 27 Apr 2017 14:48:43 -0700
Message-ID: <20170427214843.GB29261@fury>
References: <20170424113103.0de3ea31@endymion>
 <20170424140218.GR16239@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42097 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1162258AbdD0Vss (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Apr 2017 17:48:48 -0400
Content-Disposition: inline
In-Reply-To: <20170424140218.GR16239@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Jean Delvare <jdelvare@suse.de>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>

On Mon, Apr 24, 2017 at 10:02:18AM -0400, Paul Gortmaker wrote:
> [intel_turbo_max_3 non-modularity] On 24/04/2017 (Mon 11:31) Jean Delvare wrote:
> 
> > Hi all,
> > 
> > I see that the intel_turbo_max_3 driver was originally supposed to be
> > modular, and then support for that possibility was removed. Is there
> > any fundamental reason why this driver can't be built as a module?

Thanks for asking the question Jean,

+Srinivas
+Peterz

> 
> Re-reading the thread, it was stated that the driver needed exports of
> some scheduler functions that weren't currently exported.  To me, that
> means one of two things -- the driver is poking at scheduler internals
> that it shouldn't be and needs to be modified accordingly, or that
> someone needs to convince the sched folks that there is valid use cases
> for exports of these functions, and _then_ enable modularity.
> 
> I didn't try to build it as a module, so I can't say what the sched
> dependencies were, or if they looked valid.  But I have seen the sched

Reverting Paul's non-module patch and adding "tristate" "default m", it builds
cleanly, but fails modpost:

ERROR: "sched_set_itmt_core_prio" [drivers/platform/x86/intel_turbo_max_3.ko] undefined!
ERROR: "sched_set_itmt_support" [drivers/platform/x86/intel_turbo_max_3.ko] undefined!

Peter, Google is failing me for a statement from you on EXPORT_SYMBOL'ing sched_
functions, so can you weigh in here? Have you and Srinivas already discussed
this and determined it was unacceptable to export the two sched itmt related
functions above?

Thanks,

> folks being not impressed at how certain arch specific PM/freq stuff has
> been implemented in the past, which is why I mention it as a possibility.
> 
> P.
> --
> 
> > 
> > I am asking because the description of the driver says:
> > 
> > "This driver is only required when the system is not using Hardware
> > P-States (HWP). In HWP mode, priority can be read from ACPI tables."
> > 
> > This pretty much implies that this driver will be useless on a wide
> > range (maybe even the majority?) of systems. Given this, not being
> > forced to build the driver into the kernel would seem preferable.
> > 
> > Thanks, -- Jean Delvare SUSE L3 Support
> 

-- 
Darren Hart
VMware Open Source Technology Center
