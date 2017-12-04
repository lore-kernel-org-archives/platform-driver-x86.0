From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 06/11] intel_sgx: driver for Intel Software Guard
 Extensions
Date: Mon, 4 Dec 2017 10:59:50 +0200
Message-ID: <20171204085950.dnjsec6xdihhpwbb@linux.intel.com>
References: <20171125193132.24321-7-jarkko.sakkinen@linux.intel.com>
 <20171130173200.GA11190@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:2775 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753414AbdLDI74 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Dec 2017 03:59:56 -0500
Content-Disposition: inline
In-Reply-To: <20171130173200.GA11190@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Thu, Nov 30, 2017 at 09:32:01AM -0800, Sean Christopherson wrote:
> On Sat, Nov 25, 2017 at 09:29:24PM +0200, Jarkko Sakkinen wrote:
> > +static void *sgx_try_alloc_page(void)
> > +{
> > +       struct sgx_epc_bank *bank;
> > +       void *page = NULL;
> > +       int i;
> > +
> > +       for (i = 0; i < sgx_nr_epc_banks; i++) {
> > +               bank = &sgx_epc_banks[i];
> > +
> > +               down_write(&bank->lock);
> 
> Is a R/W semaphore actually preferable to a spinlock?  Concurrent
> free calls don't seem that interesting/beneficial because freeing
> an enclave's pages isn't multiplexed across multiple CPUs, unlike
> the allocation of EPC pages.

I get about ~10-15% performance increase on high stress. It is benefical
to spinlock.

> As a whole, I'm not a fan of packing the EPC page pointers into an
> array rather than encapsulating them in a struct+list.  The primary
> benefit I see for the array approach is that it saves ~8 bytes per
> free EPC page, but at a cost of increased memory usage for in-use
> pages and severely restricting the ability to enhance/modify how
> EPC pages are tracked, reclaimed, etc...

This is not true. You can put EPC page descriptor to any structure you
want.

list_head can be dropped from struct sgx_enc_page too.

> The main issue is that the array approach relies on the caller to
> handle reclaim.  This effectively makes it impossible to reclaim
> pages from multiple processes, requires other consumers e.g. KVM
> to implement their own reclaim logic and kthread, and prevents
> cgroup accounting because the cgroup can't initiate reclaim.

Not really following here.

/Jarkko
