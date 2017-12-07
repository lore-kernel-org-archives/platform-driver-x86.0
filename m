From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v7 4/8] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Thu, 7 Dec 2017 18:12:39 +0200
Message-ID: <20171207161239.ai7ewjjpi7ivlac6@linux.intel.com>
References: <20171207015614.7914-1-jarkko.sakkinen@linux.intel.com>
 <20171207015614.7914-5-jarkko.sakkinen@linux.intel.com>
 <37306EFA9975BE469F115FDE982C075BC6B39193@ORSMSX108.amr.corp.intel.com>
 <20171207160548.doovfdh2lqg5brm3@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171207160548.doovfdh2lqg5brm3@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Christopherson, Sean J" <sean.j.christopherson@intel.com>
Cc: "intel-sgx-kernel-dev@lists.01.org" <intel-sgx-kernel-dev@lists.01.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Dec 07, 2017 at 06:05:48PM +0200, Jarkko Sakkinen wrote:
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
> 
> > Querying list.next to determine if an encl_page is resident in the EPC
> > is ugly and unintuitive, and depending on list's internal state seems
> > dangerous.  Why not use a flag in the encl_page, e.g. as in the patch
> > I submitted almost 8 months ago for combining epc_page and va_page into
> > a union?  And, the encl's SGX_ENCL_SECS_EVICTED flag can be dropped if
> > a flag is added to indicate whether or not any encl_page is resident in
> > the EPC.
> > 
> > https://lists.01.org/pipermail/intel-sgx-kernel-dev/2017-April/000570.html
> 
> I think it is better to just zero list entry and do list_empty test. You
> correct that checking that with poison is ugly.
> 
> Last flag bit wll be needed for the SGX_ENCL_PAGE_TRIM. It is useful to
> have the flag in the enclave in order to be able to pack struct
> sgx_encl_page.

Most of the discussion was in the first version of that patch set. If
you think that I miss to apply something relevant, please ping me rather
than wait eight months.

/Jarkko
