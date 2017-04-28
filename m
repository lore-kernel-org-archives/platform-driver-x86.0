From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Fri, 28 Apr 2017 15:46:58 +0200
Message-ID: <20170428134658.debsavx7vjkj3zgz@hirez.programming.kicks-ass.net>
References: <20170424113103.0de3ea31@endymion>
 <20170424140218.GR16239@windriver.com>
 <20170427214843.GB29261@fury>
 <1493335126.69096.481.camel@linux.intel.com>
 <20170428075514.dmywqqe5lpad67w5@hirez.programming.kicks-ass.net>
 <20170428152021.51d3b9c5@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:52516 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033499AbdD1NrE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 09:47:04 -0400
Content-Disposition: inline
In-Reply-To: <20170428152021.51d3b9c5@endymion>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

On Fri, Apr 28, 2017 at 03:20:21PM +0200, Jean Delvare wrote:
> Hi Peter,
> 
> On Fri, 28 Apr 2017 09:55:14 +0200, Peter Zijlstra wrote:
> > On Thu, Apr 27, 2017 at 04:18:46PM -0700, Srinivas Pandruvada wrote:
> > 
> > > Before to this patch, only intel_pstate driver called these two
> > > sched_xx() functions. intel_pstate can be only be built-in, so no
> > > effort was made to export these functions when they were developed to
> > > add ITMT support.
> > > But turbo_max_3 driver driver will only load on a subset of non HWP
> > > Broadwell systems, making module is not a bad idea. To do that we can
> > > export these two sched_xx() functions as they are only related to ITMT
> > > function anyway.
> > > If Peter agrees, I can send a patch to change this.
> > 
> > I would really hate to expose sched_set_itmt_core_prio() to modules. Too
> > much potential for trainwrecks.
> 
> These functions are already available. Not exporting them only forces
> users to be built-in. This doesn't prevent anything, and in practice
> makes things worse.

How are they available? The only way a module can access this is by
grubbing around kernel internals, basically doing a manual link stage.

Its obvious that anybody doing something that like that gets to keep
whatever pieces they end up with.

Exporting a symbol OTOH will announce that its OK to use; something very
much not the case here. I really don't want joe-random module tinkerer
to _ever_ even consider using this function.

In fact, if I could I would restrict / remove a number of functions
already exported. I'd love to have something like

  EXPORT_SYMBOL_MOD(symbol, "modnames");

That only allows those whitelisted modules to touch that symbol.

Randomly exporting everything just because one stupid little module
thinks it might need it, hell no.

I would really rather sooner delete this driver than export that symbol.
