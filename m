From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 11/11] intel_sgx: driver documentation
Date: Tue, 21 Nov 2017 00:46:23 +0200
Message-ID: <20171120224623.hpx7zcorrwo4ivhh@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-12-jarkko.sakkinen@linux.intel.com>
 <20171114083647.uxlaov56s2xw3pua@pd.tnic>
 <20171114204948.f6g2m62kx5gr5xtw@linux.intel.com>
 <20171115115412.uqdy3y74w4sdnzlo@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:54102 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751149AbdKTWq2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2017 17:46:28 -0500
Content-Disposition: inline
In-Reply-To: <20171115115412.uqdy3y74w4sdnzlo@hirez.programming.kicks-ass.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Wed, Nov 15, 2017 at 12:54:12PM +0100, Peter Zijlstra wrote:
> On Tue, Nov 14, 2017 at 10:49:48PM +0200, Jarkko Sakkinen wrote:
> > In these cases IA32_FEATURE_CONTROL[17] would be zeroed before locking
> > the feature control, which would mean that the kernel could not write
> > new values with wrmsr for the root key hash.
> 
> > The question is whether we want to allow this or not. If the answer is
> > no, a check can be added to the driver initialization code whether 17 is
> > set, and if not, it driver would fail to initialize.
> 
> That has my vote; I would not trust a firmware/BIOS key.

Please note that it does not have a key to look inside the enclave. The
enclave is protected by two means:

1. The CPU asserts the memory accesses to it.
2. The CPU encrypts/decrypts in L1 in order to protect from physical
   attacks and peripherals that have potential spy the bus.

/Jarkko
