From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 17 Dec 2018 21:36:56 +0200
Message-ID: <20181217193656.GB29785@linux.intel.com>
References: <20181214235917.GA14049@wind.enjellic.com>
 <20181215000627.GA5799@linux.intel.com>
 <20181217132859.GA31936@linux.intel.com>
 <20181217133928.GA32706@linux.intel.com>
 <20181217140811.GA4601@linux.intel.com>
 <20181217173106.GB12491@linux.intel.com>
 <20181217174935.GA12617@linux.intel.com>
 <20181217180957.GC12491@linux.intel.com>
 <20181217182319.GA13288@linux.intel.com>
 <20181217184625.GE12491@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217184625.GE12491@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: "Dr. Greg" <greg@enjellic.com>, Andy Lutomirski <luto@amacapital.net>, Andy Lutomirski <luto@kernel.org>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-sgx@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Svahn, Kai" <kai.svahn@intel.com>, mark.shanahan@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>LKML <linux>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 17, 2018 at 10:46:25AM -0800, Sean Christopherson wrote:
> On Mon, Dec 17, 2018 at 08:23:19PM +0200, Jarkko Sakkinen wrote:
> > On Mon, Dec 17, 2018 at 10:09:57AM -0800, Sean Christopherson wrote:
> > > No, EREMOVE should never fail if the enclave is being released, i.e. all
> > > references to the enclave are gone.  And failure during sgx_encl_release()
> > > means we leaked an EPC page, which warrants a WARN.
> > 
> > Right that what I was suspecting as swapper should hold a ref to the
> > enclave while it is working on it. It is a programming error when this
> > happens.
> > 
> > Maybe change the boolean parameter to flags parameter have a flag to
> > use sgx_free_page()?
> 
> I tried that approach when I first split it to __sgx_free_page() and
> sgx_free_page(), but IMO the code is more difficult to read and harder
> to maintain since sgx_free_page() should be used except under special
> circumstances, e.g. race with reclaim or the freeing is "untrusted",
> i.e. requested by userspace via sgx_ioc_enclave_remove_pages().

I mean inside sgx_invalidate() call either __sgx_free_page() or
sgx_free_page() depending on a flag.

/Jarkko
