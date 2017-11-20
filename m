From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 08/11] intel_sgx: in-kernel launch enclave
Date: Tue, 21 Nov 2017 00:48:26 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1711210045140.2348@nanos>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com> <20171113194528.28557-9-jarkko.sakkinen@linux.intel.com> <20171115115006.p2wkvfuojwgg26br@hirez.programming.kicks-ass.net> <20171120222535.7yqibz2rxltwvip7@linux.intel.com>
 <alpine.DEB.2.20.1711202334030.2348@nanos> <20171120234340.tnatm3qz5nrnjtmi@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60812 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751243AbdKTXsa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2017 18:48:30 -0500
In-Reply-To: <20171120234340.tnatm3qz5nrnjtmi@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 21 Nov 2017, Jarkko Sakkinen wrote:
> On Mon, Nov 20, 2017 at 11:43:22PM +0100, Thomas Gleixner wrote:
> > On Tue, 21 Nov 2017, Jarkko Sakkinen wrote:
> > > On Wed, Nov 15, 2017 at 12:50:06PM +0100, Peter Zijlstra wrote:
> > > > On Mon, Nov 13, 2017 at 09:45:25PM +0200, Jarkko Sakkinen wrote:
> > > > > TinyCrypt (https://github.com/01org/tinycrypt) is used as AES
> > > > > implementation, which is not timing resistant. Eventually this needs to
> > > > > be replaced with AES-NI based implementation that could be either
> > > > 
> > > > > - re-use existing AES-NI code in the kernel
> > > > 
> > > > This. That is an absolute must. We're not going to merge custom AES
> > > > implementations.
> > > 
> > > I'll post v6 update without update to this in order to get otherwise
> > > improved version out and work on it for v7.
> > > 
> > > My initial idea to sort this out would be to try to compile
> > > 
> > >   arch/x86/crypto/aesni-intel_asm.S
> > > 
> > > as part of the enclave binary and use it to run AES-256.
> > 
> > No. The kernel has a crypto API.
> 
> But you cannot call it from inside an enclave. A syscall will exit the
> enclave. The launch enclave requires AES-256 to be executed inside the
> enclave.

Color me confused.

The launch enclave is part of the kernel, at least that's what the subject
line claims. So why and how would it do a syscall? The kernel has it's
internal crypto API.

Thanks,

	tglx
