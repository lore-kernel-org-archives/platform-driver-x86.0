From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 17 Dec 2018 19:49:35 +0200
Message-ID: <20181217174935.GA12617@linux.intel.com>
References: <20181128104941.GA23077@wind.enjellic.com>
 <20181128192228.GC9023@linux.intel.com>
 <20181210104908.GA23132@wind.enjellic.com>
 <20181212180036.GC6333@linux.intel.com>
 <20181214235917.GA14049@wind.enjellic.com>
 <20181215000627.GA5799@linux.intel.com>
 <20181217132859.GA31936@linux.intel.com>
 <20181217133928.GA32706@linux.intel.com>
 <20181217140811.GA4601@linux.intel.com>
 <20181217173106.GB12491@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217173106.GB12491@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: "Dr. Greg" <greg@enjellic.com>, Andy Lutomirski <luto@amacapital.net>, Andy Lutomirski <luto@kernel.org>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>LKML <linux>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 17, 2018 at 09:31:06AM -0800, Sean Christopherson wrote:
> This doesn't work as-is.  sgx_encl_release() needs to use sgx_free_page()
> and not __sgx_free_page() so that we get a WARN() if the page can't be
> freed.  sgx_invalidate() needs to use __sgx_free_page() as freeing a page
> can fail due to running concurrently with reclaim.  I'll play around with
> the code a bit, there's probably a fairly clean way to share code between
> the two flows.

Hmm... but why issue a warning in that case? It should be legit
behaviour.

> sgx_encl_release_worker() calls do_unmap() without checking the validity
> of the page tables[1].  As is, the code doesn't even guarantee mm_struct
> itself is valid.
> 
> The easiest fix I can think of is to add a SGX_ENCL_MM_RELEASED flag
> that is set along with SGX_ENCL_DEAD in sgx_mmu_notifier_release(), and
> only call do_unmap() if SGX_ENCL_MM_RELEASED is false.  Note that this
> means we cant unregister the mmu_notifier until after do_unmap(), but
> that's true no matter what since we're relying on the mmu_notifier to
> hold a reference to mm_struct.  Patch attached.

OK, the fix change makes sense but I'm thinking that would it be a
better idea just to set mm NULL and check that instead?

/Jarkko
