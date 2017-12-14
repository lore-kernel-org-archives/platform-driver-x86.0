From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v7 4/8] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Thu, 14 Dec 2017 15:03:14 +0200
Message-ID: <20171214130314.e57pmuo26khqkkqq@linux.intel.com>
References: <20171207015614.7914-1-jarkko.sakkinen@linux.intel.com>
 <20171207015614.7914-5-jarkko.sakkinen@linux.intel.com>
 <37306EFA9975BE469F115FDE982C075BC6B39193@ORSMSX108.amr.corp.intel.com>
 <20171207160548.doovfdh2lqg5brm3@linux.intel.com>
 <1513114348.27842.15.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:48222 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752295AbdLNNDW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Dec 2017 08:03:22 -0500
Content-Disposition: inline
In-Reply-To: <1513114348.27842.15.camel@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: "intel-sgx-kernel-dev@lists.01.org" <intel-sgx-kernel-dev@lists.01.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>

On Tue, Dec 12, 2017 at 01:32:28PM -0800, Sean Christopherson wrote:
> On Thu, 2017-12-07 at 18:05 +0200, Jarkko Sakkinen wrote:
> > On Thu, Dec 07, 2017 at 02:46:39PM +0000, Christopherson, Sean J wrote:
> > > 
> > > > 
> > > > +	for (i = 0; i < 2; i++) {
> > > > +		va_page = list_first_entry(&encl->va_pages,
> > > > +					   struct sgx_va_page, list);
> > > > +		va_offset = sgx_alloc_va_slot(va_page);
> > > > +		if (va_offset < PAGE_SIZE)
> > > > +			break;
> > > > +
> > > > +		list_move_tail(&va_page->list, &encl->va_pages);
> > > > +	}
> > > This is broken, there is no guarantee that the next VA page will have
> > > a free slot.  You have to walk over all VA pages to guarantee a slot
> > > is found, e.g. this caused EWB and ELDU errors.
> > I did run some extensive stress tests on this and did not experience any
> > issues. Full VA pages are always put to the end. Please point me to the
> > test where this breaks so that I can fix the issue if it persists.
> > 
> > > 
> > > Querying list.next to determine if an encl_page is resident in the EPC
> > > is ugly and unintuitive, and depending on list's internal state seems
> > > dangerous.  Why not use a flag in the encl_page, e.g. as in the patch
> > > I submitted almost 8 months ago for combining epc_page and va_page into
> > > a union?  And, the encl's SGX_ENCL_SECS_EVICTED flag can be dropped if
> > > a flag is added to indicate whether or not any encl_page is resident in
> > > the EPC.
> > > 
> > > https://lists.01.org/pipermail/intel-sgx-kernel-dev/2017-April/000570.html
> > I think it is better to just zero list entry and do list_empty test. You
> > correct that checking that with poison is ugly.
> 
> Except this whole approach breaks if you do list_del_init instead of
> list_del.  Inferring the residency of a page based on whether or not
> it's on a list AND how the page was removed from said list is fragile.
> And, the lack of an explicit flag makes it quite painful to debug any
> issues, e.g. it's difficult to identify the call site of list_del.
> 
> Case in point, I spent the better part of a day debugging a #PF BUG
> in sgx_eldu because it tried to directly deference an EPC page.  The
> list check in sgx_fault_page failed to detect an already-faulted page
> because sgx_isolate_pages calls list_del and releases the enclave's
> mutex long before the page is actually evicted.
> 
> 
> [  656.093093] BUG: unable to handle kernel paging request at 0000000480f23000
> [  656.095157] IP: sgx_eldu+0xc1/0x3c0 [intel_sgx]
> [  656.095760] PGD 469f6a067 P4D 469f6a067 PUD 0 
> [  656.096371] Oops: 0000 [#1] SMP
> [  656.096818] Modules linked in: intel_sgx scsi_transport_iscsi bridge stp llc
> [  656.097747] CPU: 3 PID: 5362 Comm: lsdt Not tainted 4.14.0+ #5
> [  656.098514] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
> [  656.099472] task: ffffa0af5c1b9d80 task.stack: ffffacd9473e0000
> [  656.100233] RIP: 0010:sgx_eldu+0xc1/0x3c0 [intel_sgx]
> [  656.100843] RSP: 0000:ffffacd9473e3c40 EFLAGS: 00010286
> [  656.101491] RAX: 0000000480f23000 RBX: ffffacd94a29d000 RCX: 0000000000000000
> [  656.102369] RDX: 0000000000000000 RSI: ffffa0af54424b90 RDI: 0000000485224000
> [  656.103225] RBP: ffffacd9473e3cf0 R08: ffffef4f5180c59c R09: ffffa0af54424b68
> [  656.104102] R10: ffffacd9473e3ab8 R11: 0000000000000040 R12: ffffef4f513e7980
> [  656.104970] R13: ffffa0af693fe5e0 R14: ffffef4f5180c580 R15: ffffa0af6c885a00
> [  656.105851] FS:  00007f42ea7fc700(0000) GS:ffffa0af7fcc0000(0000) knlGS:0000000000000000
> [  656.106767] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  656.107470] CR2: 0000000480f23000 CR3: 0000000467fc6004 CR4: 00000000003606e0
> [  656.108244] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  656.109060] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  656.109880] Call Trace:
> [  656.110224]  ? __wake_up_common_lock+0x8e/0xc0
> [  656.110740]  sgx_fault_page+0x1d5/0x390 [intel_sgx]
> [  656.111319]  ? sgx_fault_page+0x1d5/0x390 [intel_sgx]
> [  656.111917]  sgx_vma_fault+0x17/0x40 [intel_sgx]
> [  656.112517]  __do_fault+0x1c/0x60
> [  656.112916]  __handle_mm_fault+0x98c/0xeb0
> [  656.113385]  ? set_next_entity+0x109/0x6e0
> [  656.113876]  handle_mm_fault+0xcc/0x1c0
> [  656.114423]  __do_page_fault+0x262/0x4f0
> [  656.114956]  do_page_fault+0x2e/0xe0
> [  656.115488]  do_async_page_fault+0x1a/0x80
> [  656.116071]  async_page_fault+0x22/0x30
> [  656.118384] RIP: 0033:0x5db36e
> [  656.120406] RSP: 002b:00007f42ea7fbbf0 EFLAGS: 00000202
> [  656.121970] RAX: 0000000000000003 RBX: 00007f42e624e000 RCX: 00000000005db36e
> [  656.123512] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [  656.125023] RBP: 00007f42ea7fbc40 R08: 0000000000000000 R09: 0000000000000000
> [  656.126369] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> [  656.127581] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> [  656.128812] Code: 02 00 00 48 c7 85 68 ff ff ff 00 00 00 00 31 db 80 7d 8c 00
> [  656.132076] RIP: sgx_eldu+0xc1/0x3c0 [intel_sgx] RSP: ffffacd9473e3c40
> [  656.133211] CR2: 0000000480f23000
> [  656.133975] ---[ end trace e128b086ca834f1a ]---
> 
> > Last flag bit wll be needed for the SGX_ENCL_PAGE_TRIM. It is useful to
> > have the flag in the enclave in order to be able to pack struct
> > sgx_encl_page.
> > 
> > /Jarkko

You are correct. It is too fragile. I'll squeeze the flag in.

/Jarkko
