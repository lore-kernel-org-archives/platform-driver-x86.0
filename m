From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Fri, 28 Apr 2017 23:39:15 +0200
Message-ID: <20170428213915.cisp5owm5pqr7sav@hirez.programming.kicks-ass.net>
References: <20170424113103.0de3ea31@endymion>
 <20170424140218.GR16239@windriver.com>
 <20170427214843.GB29261@fury>
 <1493335126.69096.481.camel@linux.intel.com>
 <20170428075514.dmywqqe5lpad67w5@hirez.programming.kicks-ass.net>
 <20170428152021.51d3b9c5@endymion>
 <20170428134658.debsavx7vjkj3zgz@hirez.programming.kicks-ass.net>
 <20170428154954.GA7257@fury>
 <20170428163417.uwrd73vrnqjp6vck@hirez.programming.kicks-ass.net>
 <20170428205839.GB3960@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:33310 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033352AbdD1VjX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 17:39:23 -0400
Content-Disposition: inline
In-Reply-To: <20170428205839.GB3960@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Jean Delvare <jdelvare@suse.de>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

On Fri, Apr 28, 2017 at 01:58:39PM -0700, Darren Hart wrote:
> 
> OK, while I maintain there are some inconsistencies in our policies, I don't
> disagree that there are core kernel internals that should not be exposed to
> drivers (whether modular or not) and these seem like such functions.
> 
> Approaching this from that angle, as I mentioned just a moment ago, Peter would
> you be willing to entertain the idea of an interface which allows modular
> drivers to advise the scheduler on what they know of the system without giving
> them explicit control? And leaving any actuation on that information to the
> scheduler?

People are free to propose patches, they'll land in the regular
(terminally backlogged) queue to stare at :-)
