From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v7 4/8] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Thu, 14 Dec 2017 14:42:56 +0200
Message-ID: <20171214124256.muofgcwiz4js454p@linux.intel.com>
References: <20171207015614.7914-1-jarkko.sakkinen@linux.intel.com>
 <20171207015614.7914-5-jarkko.sakkinen@linux.intel.com>
 <37306EFA9975BE469F115FDE982C075BC6B39193@ORSMSX108.amr.corp.intel.com>
 <20171207160548.doovfdh2lqg5brm3@linux.intel.com>
 <37306EFA9975BE469F115FDE982C075BC6B39E18@ORSMSX108.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:47267 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751839AbdLNMnB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Dec 2017 07:43:01 -0500
Content-Disposition: inline
In-Reply-To: <37306EFA9975BE469F115FDE982C075BC6B39E18@ORSMSX108.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Christopherson, Sean J" <sean.j.christopherson@intel.com>
Cc: "intel-sgx-kernel-dev@lists.01.org" <intel-sgx-kernel-dev@lists.01.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>

On Fri, Dec 08, 2017 at 03:31:38PM +0000, Christopherson, Sean J wrote:
> Three VA pages in the enclave: A, B and C.  Evict all pages in the
> enclave, i.e. consume all slots in A, B and C.  The list can be in
> any order at this point, but for the sake of argument let's say the
> order is C->A->B, i.e. C was originally the last VA page in the list.
> Fault in page X, whose VA is in B.  Evict X.  This code looks at C
> and A, and finds no available slot, but continues with VA page A and
> a va_offset of PAGE_SIZE.


#PF handler moves B to the beginning of list when X if faulted so the
list would be at that point

B->C->A

And thus C would get VA slot from B.

/Jarkko
