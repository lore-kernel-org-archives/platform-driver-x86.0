From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Fri, 28 Apr 2017 09:55:14 +0200
Message-ID: <20170428075514.dmywqqe5lpad67w5@hirez.programming.kicks-ass.net>
References: <20170424113103.0de3ea31@endymion>
 <20170424140218.GR16239@windriver.com>
 <20170427214843.GB29261@fury>
 <1493335126.69096.481.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:48106 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1164115AbdD1HzX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 03:55:23 -0400
Content-Disposition: inline
In-Reply-To: <1493335126.69096.481.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Jean Delvare <jdelvare@suse.de>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

On Thu, Apr 27, 2017 at 04:18:46PM -0700, Srinivas Pandruvada wrote:

> Before to this patch, only intel_pstate driver called these two
> sched_xx() functions. intel_pstate can be only be built-in, so no
> effort was made to export these functions when they were developed to
> add ITMT support.
> But turbo_max_3 driver driver will only load on a subset of non HWP
> Broadwell systems, making module is not a bad idea. To do that we can
> export these two sched_xx() functions as they are only related to ITMT
> function anyway.
> If Peter agrees, I can send a patch to change this.

I would really hate to expose sched_set_itmt_core_prio() to modules. Too
much potential for trainwrecks.

Also, this driver is dinky, making it a modules doesn't save anything
much,
