From: "Christopherson, Sean J" <sean.j.christopherson@intel.com>
Subject: RE: [intel-sgx-kernel-dev] [PATCH v5 06/11] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Tue, 19 Dec 2017 18:52:02 +0000
Message-ID: <37306EFA9975BE469F115FDE982C075BCDEE4562@ORSMSX114.amr.corp.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-7-jarkko.sakkinen@linux.intel.com>
 <1510682106.3313.24.camel@intel.com>
 <20171114202835.64rl35asldh3jgui@linux.intel.com>
 <1510770027.11044.37.camel@intel.com>
 <37306EFA9975BE469F115FDE982C075BC6B3B5E6@ORSMSX108.amr.corp.intel.com>
 <20171215150020.e3vq5fh2rtydzhkt@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:1136 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751009AbdLSSwF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 13:52:05 -0500
In-Reply-To: <20171215150020.e3vq5fh2rtydzhkt@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "intel-sgx-kernel-dev@lists.01.org" <intel-sgx-kernel-dev@lists.01.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Friday, 2017-12-15, Jarkko Sakkinen wrote:
> > Resurrecting this thread now that I have a system with launch control
> > and have been able to measure the performance impact...
> > 
> > Regenerating the EINIT token every time adds somewhere in the vicinity
> > of ~5% overhead to creating an enclave, versus generating a token once
> > and reusing it in each EINIT call.  This isn't a huge issue since real
> > world usage models likely won't be re-launching enclaves at a high rate,
> > but it is measurable.
> 
> We can cache tokens in future in the kernel space, can't we?

Yes, but why?  Deferring to userspace is less complex and likely
more performant.

Tokens are large enough that there would need to be some form of
limit on the number of tokens, which brings up questions about
how to account tokens, the cache eviction scheme, whether or not
the size of the cache should be controllable from userspace, etc...

Userspace caching can likely provide better performance because
the user/application knows the usage model and life expectancy of
its tokens, i.e. userspace can make informed decisions about when
to discard a token, how much memory to dedicate to caching tokens,
etc...  And in the case of VMs, userspace can reuse tokens across
reboots (of the VM), e.g. by saving tokens to disk.
