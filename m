From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 08/11] intel_sgx: in-kernel launch enclave
Date: Tue, 21 Nov 2017 14:23:38 +0200
Message-ID: <20171121122338.s5kzemsyrfmesc43@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-9-jarkko.sakkinen@linux.intel.com>
 <20171115115006.p2wkvfuojwgg26br@hirez.programming.kicks-ass.net>
 <20171120222535.7yqibz2rxltwvip7@linux.intel.com>
 <alpine.DEB.2.20.1711202334030.2348@nanos>
 <20171120234340.tnatm3qz5nrnjtmi@linux.intel.com>
 <alpine.DEB.2.20.1711210045140.2348@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:45279 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752146AbdKUMXl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2017 07:23:41 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1711210045140.2348@nanos>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 21, 2017 at 12:48:26AM +0100, Thomas Gleixner wrote:
> The launch enclave is part of the kernel, at least that's what the subject
> line claims. So why and how would it do a syscall? The kernel has it's
> internal crypto API.

It's part of the kernel in the way as lets say code arch/x86/realmode
is. It's hosted by kernel but it does not run in the same address space
as the kernel.

These constraints apply for enclaves:

1. They only run in ring-3.
2. They can only execute code inside their address range.

/Jarkko
