From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v14 09/19] x86/mm: x86/sgx: Signal SEGV_SGXERR for #PFs w/ PF_SGX
Date: Wed, 26 Sep 2018 15:37:45 -0700
Message-ID: <CALCETrXyjRh1sBk1V21iTtjdhiWGCYsHnUNktkJC5xFiZy6c9A@mail.gmail.com>
References: <20180925130845.9962-1-jarkko.sakkinen@linux.intel.com>
 <20180925130845.9962-10-jarkko.sakkinen@linux.intel.com> <CALCETrVAhiwv+g5fzVO3ZSHZgcQKbeeG8r3HUcXO9k7Gi94NdQ@mail.gmail.com>
 <20180926173516.GA10920@linux.intel.com> <2D60780F-ADB4-48A4-AB74-15683493D369@amacapital.net>
 <9835e288-ba98-2f9e-ac73-504db9512bb9@intel.com> <20180926204400.GA11446@linux.intel.com>
 <b7e14c6e-fc05-93fa-eef9-5e3f06ab4729@intel.com> <CALCETrXByb2UVuZ6AXUeOd8y90NAikbZuvdN3wf_TjHZ+CxNhA@mail.gmail.com>
 <992b1d6d-cc0f-776f-d938-2a1f7cad52c8@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <992b1d6d-cc0f-776f-d938-2a1f7cad52c8@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Christopherson, Sean J" <sean.j.christopherson@intel.com>, Andrew Lutomirski <luto@kernel.org>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, nhorman@redhat.com, npmccallum@redhat.com, "Ayoun, Serge" <serge.ayoun@intel.com>, shay.katz-zamir@intel.com, linux-sgx@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 26, 2018 at 2:45 PM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 09/26/2018 02:15 PM, Andy Lutomirski wrote:
> > Could we perhaps have a little vDSO entry (or syscall, I suppose) that
> > runs an enclave an returns an error code, and rig up the #PF handler
> > to check if the error happened in the vDSO entry and fix it up rather
> > than sending a signal?
>
> Yeah, signals suck.
>
> So, instead of doing the enclave entry instruction (EENTER is it?), the
> app would do the vDSO call.  It would have some calling convention, like
> "set %rax to 0 before entering".  Then, we just teach the page fault
> handler about the %RIP in the vDSO that can fault and how to move one
> instruction later, munge %RIP to a value that tells about the error,
> then return from the fault.  It would basically be like the kernel
> exception tables, but for userspace.  Right?

Yeah.  Maybe like this:

xorl %eax,%eax
eenter_insn:
ENCLU[whatever]
eenter_landing_pad:
ret

And the kernel would use the existing vdso2c vdso-symbol-finding
mechanism to do the fixup.

>
> How would a syscall work, though?  I assume we can't just enter the
> enclave from ring0.

My understanding of how AEX works is a bit vague, but maybe a syscall
could reuse the mechanism?  The vDSO approach seems considerably
simpler.

We do need to make sure that a fault that happens on or after return
from an AEX event does the right thing.  But I'm still vague on how
that works, sigh.

--Andy
