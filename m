From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v5 06/11] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Wed, 20 Dec 2017 01:11:13 +0200
Message-ID: <1513725073.2206.13.camel@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
         <20171113194528.28557-7-jarkko.sakkinen@linux.intel.com>
         <1510682106.3313.24.camel@intel.com>
         <20171114202835.64rl35asldh3jgui@linux.intel.com>
         <1510770027.11044.37.camel@intel.com>
         <37306EFA9975BE469F115FDE982C075BC6B3B5E6@ORSMSX108.amr.corp.intel.com>
         <20171215150020.e3vq5fh2rtydzhkt@linux.intel.com>
         <37306EFA9975BE469F115FDE982C075BCDEE4562@ORSMSX114.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <37306EFA9975BE469F115FDE982C075BCDEE4562@ORSMSX114.amr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Christopherson, Sean J" <sean.j.christopherson@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "intel-sgx-kernel-dev@lists.01.org" <intel-sgx-kernel-dev@lists.01.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2017-12-19 at 18:52 +0000, Christopherson, Sean J wrote:
> > We can cache tokens in future in the kernel space, can't we?
> 
> Yes, but why?  Deferring to userspace is less complex and likely
> more performant.

That's quite strong argument especially if you are making that for
systems running multiple independent workloads and not just a single
application.

> Tokens are large enough that there would need to be some form of
> limit on the number of tokens, which brings up questions about
> how to account tokens, the cache eviction scheme, whether or not
> the size of the cache should be controllable from userspace, etc...

Leaving caching decisions to the kernel also gives more freedoms to
do global decisions.

> Userspace caching can likely provide better performance because
> the user/application knows the usage model and life expectancy of
> its tokens, i.e. userspace can make informed decisions about when
> to discard a token, how much memory to dedicate to caching tokens,
> etc...  And in the case of VMs, userspace can reuse tokens across
> reboots (of the VM), e.g. by saving tokens to disk.

I'm not really convinced that your argument is sound if you consider the
whole range of x86 systems that can run enclaves especially if the
system is running multiple irrelated applications.

And you are ignoring everything else but the performance, which is does
not make any sense. The current design governs the Linux kernel to have
the ultimate power, which enclaves to run with the minimized proprietary
risk. I think that is something worth of emphasizing too.

Whether the token caching is left to kernel or user space will most
definitely introduce some non-trivial performance problems to solve
with some unexpected workloads that we cannot imagine right now. That's
why the governance should be the driver. Not the performance. Those
issues can and must be sorted out in any case.

/Jarkko
