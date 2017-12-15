From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v5 06/11] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Fri, 15 Dec 2017 17:00:20 +0200
Message-ID: <20171215150020.e3vq5fh2rtydzhkt@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-7-jarkko.sakkinen@linux.intel.com>
 <1510682106.3313.24.camel@intel.com>
 <20171114202835.64rl35asldh3jgui@linux.intel.com>
 <1510770027.11044.37.camel@intel.com>
 <37306EFA9975BE469F115FDE982C075BC6B3B5E6@ORSMSX108.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:14169 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752660AbdLOPAX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Dec 2017 10:00:23 -0500
Content-Disposition: inline
In-Reply-To: <37306EFA9975BE469F115FDE982C075BC6B3B5E6@ORSMSX108.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Christopherson, Sean J" <sean.j.christopherson@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "intel-sgx-kernel-dev@lists.01.org" <intel-sgx-kernel-dev@lists.01.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Wed, Dec 13, 2017 at 11:18:29PM +0000, Christopherson, Sean J wrote:
> Resurrecting this thread now that I have a system with launch control
> and have been able to measure the performance impact...
> 
> Regenerating the EINIT token every time adds somewhere in the vicinity
> of ~5% overhead to creating an enclave, versus generating a token once
> and reusing it in each EINIT call.  This isn't a huge issue since real
> world usage models likely won't be re-launching enclaves at a high rate,
> but it is measurable.

We can cache tokens in future in the kernel space, can't we?

/Jarkko
