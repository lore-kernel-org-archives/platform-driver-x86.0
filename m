From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Thu, 27 Apr 2017 16:18:46 -0700
Message-ID: <1493335126.69096.481.camel@linux.intel.com>
References: <20170424113103.0de3ea31@endymion>
         <20170424140218.GR16239@windriver.com> <20170427214843.GB29261@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:57509 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S936461AbdD0XSs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Apr 2017 19:18:48 -0400
In-Reply-To: <20170427214843.GB29261@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Jean Delvare <jdelvare@suse.de>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>

On Thu, 2017-04-27 at 14:48 -0700, Darren Hart wrote:
> On Mon, Apr 24, 2017 at 10:02:18AM -0400, Paul Gortmaker wrote:
> > 
> > [intel_turbo_max_3 non-modularity] On 24/04/2017 (Mon 11:31) Jean
> > Delvare wrote:
> > 
[...]

> > > 
> > Re-reading the thread, it was stated that the driver needed exports
> > of
> > some scheduler functions that weren't currently exported.  To me,
> > that
> > means one of two things -- the driver is poking at scheduler
> > internals
> > that it shouldn't be and needs to be modified accordingly, or that
> > someone needs to convince the sched folks that there is valid use
> > cases
> > for exports of these functions, and _then_ enable modularity.
> > 
> > I didn't try to build it as a module, so I can't say what the sched
> > dependencies were, or if they looked valid.  But I have seen the
> > sched
> 
> Reverting Paul's non-module patch and adding "tristate" "default m",
> it builds
> cleanly, but fails modpost:
> 
> ERROR: "sched_set_itmt_core_prio"
> [drivers/platform/x86/intel_turbo_max_3.ko] undefined!
> ERROR: "sched_set_itmt_support"
> [drivers/platform/x86/intel_turbo_max_3.ko] undefined!
> 
> Peter, Google is failing me for a statement from you on
> EXPORT_SYMBOL'ing sched_
> functions, so can you weigh in here? Have you and Srinivas already
> discussed
> this and determined it was unacceptable to export the two sched itmt
> related
> functions above?
Before to this patch, only intel_pstate driver called these two
sched_xx() functions. intel_pstate can be only be built-in, so no
effort was made to export these functions when they were developed to
add ITMT support.
But turbo_max_3 driver driver will only load on a subset of non HWP
Broadwell systems, making module is not a bad idea. To do that we can
export these two sched_xx() functions as they are only related to ITMT
function anyway.
If Peter agrees, I can send a patch to change this.


Thanks,
Srinivas
