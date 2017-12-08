From: "Christopherson, Sean J" <sean.j.christopherson@intel.com>
Subject: RE: [intel-sgx-kernel-dev] [PATCH v7 4/8] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Fri, 8 Dec 2017 15:31:38 +0000
Message-ID: <37306EFA9975BE469F115FDE982C075BC6B39E18@ORSMSX108.amr.corp.intel.com>
References: <20171207015614.7914-1-jarkko.sakkinen@linux.intel.com>
 <20171207015614.7914-5-jarkko.sakkinen@linux.intel.com>
 <37306EFA9975BE469F115FDE982C075BC6B39193@ORSMSX108.amr.corp.intel.com>
 <20171207160548.doovfdh2lqg5brm3@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:36441 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753656AbdLHPbl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 10:31:41 -0500
In-Reply-To: <20171207160548.doovfdh2lqg5brm3@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: "intel-sgx-kernel-dev@lists.01.org" <intel-sgx-kernel-dev@lists.01.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>

Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
> On Thu, Dec 07, 2017 at 02:46:39PM +0000, Christopherson, Sean J wrote:
> > > +	for (i = 0; i < 2; i++) {
> > > +		va_page = list_first_entry(&encl->va_pages,
> > > +					   struct sgx_va_page, list);
> > > +		va_offset = sgx_alloc_va_slot(va_page);
> > > +		if (va_offset < PAGE_SIZE)
> > > +			break;
> > > +
> > > +		list_move_tail(&va_page->list, &encl->va_pages);
> > > +	}
> > 
> > This is broken, there is no guarantee that the next VA page will have
> > a free slot.  You have to walk over all VA pages to guarantee a slot
> > is found, e.g. this caused EWB and ELDU errors.
> 
> I did run some extensive stress tests on this and did not experience any
> issues. Full VA pages are always put to the end. Please point me to the
> test where this breaks so that I can fix the issue if it persists.

Three VA pages in the enclave: A, B and C.  Evict all pages in the
enclave, i.e. consume all slots in A, B and C.  The list can be in
any order at this point, but for the sake of argument let's say the
order is C->A->B, i.e. C was originally the last VA page in the list.
Fault in page X, whose VA is in B.  Evict X.  This code looks at C
and A, and finds no available slot, but continues with VA page A and
a va_offset of PAGE_SIZE.
