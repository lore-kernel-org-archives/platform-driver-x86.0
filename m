From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Mon, 24 Apr 2017 10:02:18 -0400
Message-ID: <20170424140218.GR16239@windriver.com>
References: <20170424113103.0de3ea31@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:35850 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1171947AbdDXODH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2017 10:03:07 -0400
Content-Disposition: inline
In-Reply-To: <20170424113103.0de3ea31@endymion>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

[intel_turbo_max_3 non-modularity] On 24/04/2017 (Mon 11:31) Jean Delvare wrote:

> Hi all,
> 
> I see that the intel_turbo_max_3 driver was originally supposed to be
> modular, and then support for that possibility was removed. Is there
> any fundamental reason why this driver can't be built as a module?

Re-reading the thread, it was stated that the driver needed exports of
some scheduler functions that weren't currently exported.  To me, that
means one of two things -- the driver is poking at scheduler internals
that it shouldn't be and needs to be modified accordingly, or that
someone needs to convince the sched folks that there is valid use cases
for exports of these functions, and _then_ enable modularity.

I didn't try to build it as a module, so I can't say what the sched
dependencies were, or if they looked valid.  But I have seen the sched
folks being not impressed at how certain arch specific PM/freq stuff has
been implemented in the past, which is why I mention it as a possibility.

P.
