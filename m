From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v11 07/13] x86, sgx: detect Intel SGX
Date: Mon, 18 Jun 2018 14:36:35 -0700
Message-ID: <CALCETrU+s97soHtiC3p3hkdwqZhEMdjPyJByskb99a+Z8PZjpA@mail.gmail.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-8-jarkko.sakkinen@linux.intel.com> <4fc3b6b0-6e4b-3d5f-4d54-2bf7539c7a17@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4fc3b6b0-6e4b-3d5f-4d54-2bf7539c7a17@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, X86 ML <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, npmccallum@redhat.com, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, intel-sgx-kernel-dev@lists.01.org, "H. Peter Anvin" <hpa@zytor.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jun 18, 2018 at 8:11 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> > +config INTEL_SGX_CORE
> > +     prompt "Intel SGX core functionality
> > +     depends on X86_64 && CPU_SUP_INTEL
> > +     help
> > +     Intel Software Guard eXtensions (SGX) is a set of CPU instructions
> > +     that allows ring 3 applications to create enclaves; private regions
> > +     of memory that are protected, by hardware, from unauthorized access
> > +     and/or modification.
>
> That semicolon needs to be a colon.  The second half of that sentence is
> not a stand-alone statement.
>
> > +     This option enables kernel recognition of SGX, high-level management
> > +     of the Enclave Page Cache (EPC), tracking and writing of SGX Launch
> > +     Enclave Hash MSRs, and allows for virtualization of SGX via KVM. By
> > +     iteslf, this option does not provide SGX support to userspace.
> > +
> > +     For details, see Documentation/x86/intel_sgx.rst
> > +
> > +     If unsure, say N.
> > +
> >  config EFI
> >       bool "EFI runtime service support"
> >       depends on ACPI
> > diff --git a/arch/x86/include/asm/sgx.h b/arch/x86/include/asm/sgx.h
> > new file mode 100644
> > index 000000000000..fa3e6e0eb8af
> > --- /dev/null
> > +++ b/arch/x86/include/asm/sgx.h
> > @@ -0,0 +1,25 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> > +// Copyright(c) 2016-18 Intel Corporation.
> > +//
> > +// Authors:
> > +//
> > +// Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > +// Suresh Siddha <suresh.b.siddha@intel.com>
> > +// Sean Christopherson <sean.j.christopherson@intel.com>
> > +
> > +#ifndef _ASM_X86_SGX_H
> > +#define _ASM_X86_SGX_H
> > +
> > +#include <linux/types.h>
> > +
> > +#define SGX_CPUID 0x12
>
> Hey, I just saw 0x12 as a magic, hard-coded number earlier in these
> patches.  It seems cruel to hard-code it, and then also have a #define
> that isn't used.
>
> > +enum sgx_cpuid {
> > +     SGX_CPUID_CAPABILITIES  = 0,
> > +     SGX_CPUID_ATTRIBUTES    = 1,
> > +     SGX_CPUID_EPC_BANKS     = 2,
> > +};
>
> These are cpuid *leaves*, right?  Please make this clear that these are
> hardware-defined values and not some kind of software construct.
>
> > +bool sgx_enabled __ro_after_init = false;
> > +EXPORT_SYMBOL(sgx_enabled);
> > +
> > +static __init bool sgx_is_enabled(void)
> > +{
> > +     unsigned long fc;
> > +
> > +     if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
> > +             return false;
>
> Not necessary. CPUID does this part for you.

More to the point, if a non-Intel vendor chooses to support SGX, then
the driver should allow it.

>
> > +     if (!boot_cpu_has(X86_FEATURE_SGX))
> > +             return false;
> > +
> > +     if (!boot_cpu_has(X86_FEATURE_SGX1))
> > +             return false;
> > +
> > +     rdmsrl(MSR_IA32_FEATURE_CONTROL, fc);
> > +     if (!(fc & FEATURE_CONTROL_LOCKED))
> > +             return false;
> > +
> > +     if (!(fc & FEATURE_CONTROL_SGX_ENABLE))
> > +             return false;
>
> Comments, please.  Why would this happen?  What would it mean?

Let's add actual pr_info() statements to document this, like:

SGX: disabled by firmware
SGX: disabled because CPU does not support flexible launch control
SGX: disabled because firmware does not support flexible launch control
SGX: disabled because the phase of the moon is wrong
SGX: enabled; using SGX1
SGX: enabled, using SGX2

If the CPU doesn't support SGX at all, then I see no reason to print anything.

etc.

(Is the feature actually called flexible launch control?  I may have
made that up.)
