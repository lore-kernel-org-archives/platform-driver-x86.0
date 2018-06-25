From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v11 09/13] x86, sgx: basic routines for enclave page
 cache
Date: Mon, 25 Jun 2018 12:21:55 +0300
Message-ID: <b024272a9f0318b188025f679928ff9cbffd71e4.camel@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
         <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
         <1529508365.9779.63.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529508365.9779.63.camel@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org
Cc: dave.hansen@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2018-06-20 at 08:26 -0700, Sean Christopherson wrote:
> >  bool sgx_enabled __ro_after_init = false;
> >  EXPORT_SYMBOL(sgx_enabled);
> > +bool sgx_lc_enabled __ro_after_init;
> > +EXPORT_SYMBOL(sgx_lc_enabled);
> > +atomic_t sgx_nr_free_pages = ATOMIC_INIT(0);
> > +EXPORT_SYMBOL(sgx_nr_free_pages);
> > +struct sgx_epc_bank sgx_epc_banks[SGX_MAX_EPC_BANKS];
> > +EXPORT_SYMBOL(sgx_epc_banks);
> > +int sgx_nr_epc_banks;
> > +EXPORT_SYMBOL(sgx_nr_epc_banks);
> > +LIST_HEAD(sgx_active_page_list);
> > +EXPORT_SYMBOL(sgx_active_page_list);
> > +DEFINE_SPINLOCK(sgx_active_page_list_lock);
> > +EXPORT_SYMBOL(sgx_active_page_list_lock);
> 
> I don't think we should be exporting anything other than sgx_enabled
> and sgx_lc_enabled.  The only external use of a symbol that can't be
> trivially (re)moved is in the driver's sgx_pm_suspend() in sgx_main.c,
> which uses the sgx_active_page_list to invalidate enclaves.  And that
> behavior seems unsafe, e.g. an enclave could theoretically have zero
> pages on the active list and so could be missed in the suspend flow.

Fully agreed. Just forgotten cruft...

/Jarkko
