From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v11 07/13] x86, sgx: detect Intel SGX
Date: Tue, 19 Jun 2018 16:33:43 +0300
Message-ID: <20180619133343.GI5609@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-8-jarkko.sakkinen@linux.intel.com>
 <4fc3b6b0-6e4b-3d5f-4d54-2bf7539c7a17@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4fc3b6b0-6e4b-3d5f-4d54-2bf7539c7a17@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andi Kleen <ak@linux.intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 08, 2018 at 10:36:14AM -0700, Dave Hansen wrote:
> > +config INTEL_SGX_CORE
> > +	prompt "Intel SGX core functionality
> > +	depends on X86_64 && CPU_SUP_INTEL
> > +	help
> > +	Intel Software Guard eXtensions (SGX) is a set of CPU instructions
> > +	that allows ring 3 applications to create enclaves; private regions
> > +	of memory that are protected, by hardware, from unauthorized access
> > +	and/or modification.
> 
> That semicolon needs to be a colon.  The second half of that sentence is
> not a stand-alone statement.
> 
> > +	This option enables kernel recognition of SGX, high-level management
> > +	of the Enclave Page Cache (EPC), tracking and writing of SGX Launch
> > +	Enclave Hash MSRs, and allows for virtualization of SGX via KVM. By
> > +	iteslf, this option does not provide SGX support to userspace.
> > +
> > +	For details, see Documentation/x86/intel_sgx.rst
> > +
> > +	If unsure, say N.
> > +
> >  config EFI
> >  	bool "EFI runtime service support"
> >  	depends on ACPI
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

It i then is a regression in the series. I'll fix it.

> > +enum sgx_cpuid {
> > +	SGX_CPUID_CAPABILITIES	= 0,
> > +	SGX_CPUID_ATTRIBUTES	= 1,
> > +	SGX_CPUID_EPC_BANKS	= 2,
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
> > +	unsigned long fc;
> > +
> > +	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
> > +		return false;
> 
> Not necessary. CPUID does this part for you.
> 
> > +	if (!boot_cpu_has(X86_FEATURE_SGX))
> > +		return false;
> > +
> > +	if (!boot_cpu_has(X86_FEATURE_SGX1))
> > +		return false;
> > +
> > +	rdmsrl(MSR_IA32_FEATURE_CONTROL, fc);
> > +	if (!(fc & FEATURE_CONTROL_LOCKED))
> > +		return false;
> > +
> > +	if (!(fc & FEATURE_CONTROL_SGX_ENABLE))
> > +		return false;
> 
> Comments, please.  Why would this happen?  What would it mean?

Thanks for the feedback! I'll refine the parts that you pointed out.

/Jarkko
