From: Jean Delvare <jdelvare@suse.de>
Subject: Re: intel_turbo_max_3 non-modularity
Date: Fri, 28 Apr 2017 09:49:30 +0200
Message-ID: <20170428094930.6ba0ba1f@endymion>
References: <20170424113103.0de3ea31@endymion>
        <20170424140218.GR16239@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40387 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1424586AbdD1Hte (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 03:49:34 -0400
In-Reply-To: <20170424140218.GR16239@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

Hi Paul,

On Mon, 24 Apr 2017 10:02:18 -0400, Paul Gortmaker wrote:
> [intel_turbo_max_3 non-modularity] On 24/04/2017 (Mon 11:31) Jean Delvare wrote:
> 
> > I see that the intel_turbo_max_3 driver was originally supposed to be
> > modular, and then support for that possibility was removed. Is there
> > any fundamental reason why this driver can't be built as a module?
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
> folks being not impressed at how certain arch specific PM/freq stuff has
> been implemented in the past, which is why I mention it as a possibility.

Thanks for the explanations. I understand that the purpose of your
patch (commit af050abb5c2e, "platform/x86: intel_turbo_max_3: make it
explicitly non-modular") was to get things square, and I have seen many
similar patches from you in the past. However please realize that going
for the easiest solution (dropping modular support altogether) isn't
always the best thing to do.

It's the same story as fixing compiler warnings. One should either look
for the right way to fix them, or leave things as they are, to give
others a chance to step in. Similar to compiler warnings, half-modular
code is also an opportunity to make things better. In my experience,
once the code is cleanly non-modular, the chances that someone looks
into why it is so and whether it could be modularized get significantly
lower.

Non-modular drivers do not scale. This is a serious issue considering
the growth rate of the kernel.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
