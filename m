From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v5 06/11] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Wed, 15 Nov 2017 10:20:27 -0800
Message-ID: <1510770027.11044.37.camel@intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
         <20171113194528.28557-7-jarkko.sakkinen@linux.intel.com>
         <1510682106.3313.24.camel@intel.com>
         <20171114202835.64rl35asldh3jgui@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:22385 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753114AbdKOSYH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Nov 2017 13:24:07 -0500
In-Reply-To: <20171114202835.64rl35asldh3jgui@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Tue, 2017-11-14 at 22:28 +0200, Jarkko Sakkinen wrote:
> On Tue, Nov 14, 2017 at 09:55:06AM -0800, Sean Christopherson wrote:
> > 
> > What do you mean by bottlenecks?  Assuming you're referring to performance
> > bottlenecks, this statement is flat out false.  Moving the launch enclave
> > into
> > the kernel introduces performance bottlenecks, e.g. as implemented, a single
> > LE
> > services all EINIT requests and is protected by a mutex.  That is the very
> > definition of a bottleneck.
> I guess the text does not do a good job describing what I meant. Maybe I
> should refine it? Your argument about mutex is correct.
> 
> The use of "bottleneck" does not specifically refer to performance. I'm
> worried about splitting the tasks needed to launch an enclave between
> kernel and user space. It could become difficult to manage when more
> SGX features are added. That is what I was referring when I used the
> word "bottleneck".
> 
> I suppose you think I should refine the commit message?
> 
> About the perf bottleneck. Given that all the data is already in
> sgx_le_ctx the driver could for example have own LE process for every
> opened /dev/sgx. Is your comment also suggesting to refine this or
> could it be postponed?

More that I don't understand why the driver doesn't allow userspace to provide
an EINIT token, and reciprocally, doesn't provide the token back to userspace. 
IMO, the act of generating an EINIT token is orthogonal to deciding whether or
not to run the enclave.  Running code in a kernel-owned enclave is not specific
to SGX, e.g. paranoid kernels could run other sensitive tasks in an enclave.
Being forced to run an enclave to generate an EINIT token is an unfortunate
speed bump that exists purely because hardware doesn't provide the option to
disable launch control entirely.

In other words, accepting a token via the IOCTL doesn't mean the driver has to
use it, e.g. it can always ignore the token, enforce periodic reverification,
check that the token was created by the driver, etc...  And using the token
doesn't preclude the driver from re-running its verification checks outside of
the launch enclave.


> The driver architecture already allows to scale this but it is not
> nearly as bad issue as the one Dave pointed out.
> 
> /Jarkko
> _______________________________________________
> intel-sgx-kernel-dev mailing list
> intel-sgx-kernel-dev@lists.01.org
> https://lists.01.org/mailman/listinfo/intel-sgx-kernel-dev
