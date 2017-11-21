From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 08/11] intel_sgx: in-kernel launch enclave
Date: Wed, 22 Nov 2017 00:36:25 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1711220033040.2399@nanos>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com> <20171113194528.28557-9-jarkko.sakkinen@linux.intel.com> <20171115115006.p2wkvfuojwgg26br@hirez.programming.kicks-ass.net> <20171120222535.7yqibz2rxltwvip7@linux.intel.com>
 <alpine.DEB.2.20.1711202334030.2348@nanos> <20171120234340.tnatm3qz5nrnjtmi@linux.intel.com> <alpine.DEB.2.20.1711210045140.2348@nanos> <20171121122338.s5kzemsyrfmesc43@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:36410 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751449AbdKUXga (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2017 18:36:30 -0500
In-Reply-To: <20171121122338.s5kzemsyrfmesc43@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 21 Nov 2017, Jarkko Sakkinen wrote:

> On Tue, Nov 21, 2017 at 12:48:26AM +0100, Thomas Gleixner wrote:
> > The launch enclave is part of the kernel, at least that's what the subject
> > line claims. So why and how would it do a syscall? The kernel has it's
> > internal crypto API.
> 
> It's part of the kernel in the way as lets say code arch/x86/realmode
> is. It's hosted by kernel but it does not run in the same address space
> as the kernel.
> 
> These constraints apply for enclaves:
> 
> 1. They only run in ring-3.
> 2. They can only execute code inside their address range.

Can you please explain the whole thing so people not fully familiar with
the inner workings of your stuff can understand it? You are providing only
tiny bits of cryptic information on each question. That's going to take
ages ...

Thanks,

	tglx
