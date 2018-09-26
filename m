From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v14 09/19] x86/mm: x86/sgx: Signal SEGV_SGXERR for #PFs
 w/ PF_SGX
Date: Wed, 26 Sep 2018 10:35:16 -0700
Message-ID: <20180926173516.GA10920@linux.intel.com>
References: <20180925130845.9962-1-jarkko.sakkinen@linux.intel.com>
 <20180925130845.9962-10-jarkko.sakkinen@linux.intel.com>
 <CALCETrVAhiwv+g5fzVO3ZSHZgcQKbeeG8r3HUcXO9k7Gi94NdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrVAhiwv+g5fzVO3ZSHZgcQKbeeG8r3HUcXO9k7Gi94NdQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@kernel.org>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, linux-sgx@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 25, 2018 at 03:53:48PM -0700, Andy Lutomirski wrote:
> Minor nit:
> 
> On Tue, Sep 25, 2018 at 6:12 AM Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
> >
> > From: Sean Christopherson <sean.j.christopherson@intel.com>
> >
> 
> > by (c) as the kernel doesn't really have any other reasonable option,
> > e.g. we could kill the task or panic, but neither is warranted.
> 
> Not killing the task is quite nice, but...
> 
> > +       /*
> > +        * Access is blocked by the Enclave Page Cache Map (EPCM),
> > +        * i.e. the access is allowed by the PTE but not the EPCM.
> > +        * This usually happens when the EPCM is yanked out from
> > +        * under us, e.g. by hardware after a suspend/resume cycle.
> > +        * In any case, there is nothing that can be done by the
> > +        * kernel to resolve the fault (short of killing the task).
> 
> Maybe s/killing the task/sending a signal/?

My intent was to document that, unlike all other page faults, the
kernel can't fix the source of the fault even if it were omniscient.

How about this?  With formatting changes since it's long-winded...

        /*
         * Access is blocked by the Enclave Page Cache Map (EPCM), i.e. the
         * access is allowed by the PTE but not the EPCM.  This usually happens
         * when the EPCM is yanked out from under us, e.g. by hardware after a
         * suspend/resume cycle.  In any case, software, i.e. the kernel, can't
         * fix the source of the fault as the EPCM can't be directly modified
         * by software.  Handle the fault as an access error in order to signal
         * userspace, e.g. so that userspace can rebuild their enclave(s), even
         * though userspace may not have actually violated access permissions.
         */
