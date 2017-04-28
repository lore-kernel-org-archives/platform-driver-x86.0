From: Jean Delvare <jdelvare@suse.de>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Fri, 28 Apr 2017 10:40:10 +0200
Message-ID: <20170428104010.2fc36751@endymion>
References: <20170424113103.0de3ea31@endymion>
        <20170424140218.GR16239@windriver.com>
        <20170427214843.GB29261@fury>
        <1493335126.69096.481.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43342 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1424968AbdD1IkP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 04:40:15 -0400
In-Reply-To: <1493335126.69096.481.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>

Hi Darren and Srinivas,

Thanks a lot for stepping in.

On Thu, 27 Apr 2017 16:18:46 -0700, Srinivas Pandruvada wrote:
> On Thu, 2017-04-27 at 14:48 -0700, Darren Hart wrote:
> > Reverting Paul's non-module patch and adding "tristate" "default m",
> > it builds cleanly, but fails modpost:

This was on my to-do list, thanks for saving me some time :-)

For the record, Paul's patch also added a few missing includes, which
should be preserved.

> > ERROR: "sched_set_itmt_core_prio"
> > [drivers/platform/x86/intel_turbo_max_3.ko] undefined!
> > ERROR: "sched_set_itmt_support"
> > [drivers/platform/x86/intel_turbo_max_3.ko] undefined!
> > 
> > Peter, Google is failing me for a statement from you on EXPORT_SYMBOL'ing sched_
> > functions, so can you weigh in here? Have you and Srinivas already discussed
> > this and determined it was unacceptable to export the two sched itmt related
> > functions above?
>
> Before to this patch, only intel_pstate driver called these two
> sched_xx() functions. intel_pstate can be only be built-in, so no
> effort was made to export these functions when they were developed to
> add ITMT support.

By the way, is there any fundamental reason why intel_pstate could not
be modularized? Or was it just another instance of needing functions
which were not exported yet? I know that the intel_pstate driver is
widely used nowadays, but still, this is a CPU-specific driver that
not all x86 users need, and it isn't slim. It would be nice to be able
to build it as a module too.

> But turbo_max_3 driver driver will only load on a subset of non HWP
> Broadwell systems, making module is not a bad idea. To do that we can

It was also my understanding that the scope of this driver was limited,
which is why I was worried that it could only be built-in.

> export these two sched_xx() functions as they are only related to ITMT
> function anyway.
> If Peter agrees, I can send a patch to change this.

That would be great.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
