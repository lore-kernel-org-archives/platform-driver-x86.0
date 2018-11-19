From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 19 Nov 2018 17:06:55 +0200
Message-ID: <20181119150655.GA11843@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org
Cc: dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 16, 2018 at 03:01:25AM +0200, Jarkko Sakkinen wrote:
> Intel Software Guard eXtensions (SGX) is a set of CPU instructions that
> can be used by applications to set aside private regions of code and
> data. The code outside the enclave is disallowed to access the memory
> inside the enclave by the CPU access control.
> 
> SGX driver provides a ioctl API for loading and initializing enclaves.
> Address range for enclaves is reserved with mmap() and they are
> destroyed with munmap(). Enclave construction, measurement and
> initialization is done with the provided the ioctl API.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Co-developed-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Co-developed-by: Serge Ayoun <serge.ayoun@intel.com>
> Signed-off-by: Serge Ayoun <serge.ayoun@intel.com>
> Co-developed-by: Shay Katz-zamir <shay.katz-zamir@intel.com>
> Signed-off-by: Shay Katz-zamir <shay.katz-zamir@intel.com>
> Co-developed-by: Suresh Siddha <suresh.b.siddha@intel.com>
> Signed-off-by: Suresh Siddha <suresh.b.siddha@intel.com>

Question: should be dissolve the driver completely and move this code to
arch/x86/kernel/cpu/sgx/ (and rename intel_sgx.c as main.c)? Swapping
patch removes the possibility to compile this as a module anyway.

Would make also maintainer hierarchy more clear and clean albeit that
cannot be a guiding reason to do such change. Here's the current
MAINTAINERS entry in my master:

INTEL SGX
M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
M:	Sean Christopherson <sean.j.christopherson@intel.com>
L:	linux-sgx@vger.kernel.org
S:	Maintained
Q:	https://patchwork.kernel.org/project/intel-sgx/list/
T:	git https://github.com/jsakkine-intel/linux-sgx.git
F:	arch/x86/include/asm/sgx.h
F:	arch/x86/include/uapi/asm/sgx.h
F:	arch/x86/kernel/cpu/intel_sgx.c
F:	drivers/platform/x86/intel_sgx/*
K:	\bSGX_

If we do this, we would end up with this:

INTEL SGX
M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
M:	Sean Christopherson <sean.j.christopherson@intel.com>
L:	linux-sgx@vger.kernel.org
S:	Maintained
Q:	https://patchwork.kernel.org/project/intel-sgx/list/
T:	git https://github.com/jsakkine-intel/linux-sgx.git
F:	arch/x86/include/asm/sgx.h
F:	arch/x86/include/uapi/asm/sgx.h
F:	arch/x86/kernel/cpu/sgx/*
K:	\bSGX_

Then once the base code has been merged I would put my PRs to x86
maintainers for subsequent kernel releases.

/Jarkko
