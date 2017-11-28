From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v6 04/11] x86: define IA32_FEATUE_CONTROL.SGX_LC
Date: Tue, 28 Nov 2017 09:16:11 -0800
Message-ID: <1511889371.9392.58.camel@intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
         <20171125193132.24321-5-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171125193132.24321-5-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@suse.de>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, Piotr Luc <piotr.luc@intel.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 2017-11-25 at 21:29 +0200, Jarkko Sakkinen wrote:
> When IA32_FEATURE_CONTROL.SGX_LC identifies that the root key for
> enclave signatures can be configured either by the OS or pre-boot
> firmware.
> 
> If this the case, IA32_SGXLEPUBKEYHASHn MSRs (0 < n < 4) can be used
> to
> set the SHA256 of the root key. IA32_FEATURE_CONTROL bit 17 controls
> whether the MSRs are writable by the OS. The pre-boot firmware can
> decided whether to  set this bit before setting
> IA32_FEATURE_CONTROL.LOCK.

The commit message (feature control bit) doesn't match the patch (CPUID
bit).

> 
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  arch/x86/include/asm/cpufeatures.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/include/asm/cpufeatures.h
> b/arch/x86/include/asm/cpufeatures.h
> index 31a7d1c0f204..43130f3c18a1 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -298,6 +298,7 @@
>  #define X86_FEATURE_AVX512_VPOPCNTDQ (16*32+14) /* POPCNT for vectors
> of DW/QW */
>  #define X86_FEATURE_LA57	(16*32+16) /* 5-level page tables */
>  #define X86_FEATURE_RDPID	(16*32+22) /* RDPID instruction */
> +#define X86_FEATURE_SGX_LC	(16*32+30) /* supports SGX launch
> configuration */
>  
>  /* AMD-defined CPU features, CPUID level 0x80000007 (ebx), word 17 */
>  #define X86_FEATURE_OVERFLOW_RECOV (17*32+0) /* MCA overflow recovery
> support */
