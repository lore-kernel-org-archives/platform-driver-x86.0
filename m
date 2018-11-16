From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v17 02/23] x86/cpufeatures: Add Intel-defined SGX feature
 bit
Date: Fri, 16 Nov 2018 15:28:40 +0100
Message-ID: <20181116142840.GI20313@zn.tnic>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-3-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116010412.23967-3-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Kai Huang <kai.huang@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Fenghua Yu <fenghua.yu@intel.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 16, 2018 at 03:01:09AM +0200, Jarkko Sakkinen wrote:
> From: Kai Huang <kai.huang@linux.intel.com>
> 
> X86_FEATURE_SGX reflects whether or not the CPU supports Intel's
> Software Guard eXtensions (SGX).
> 
> Signed-off-by: Kai Huang <kai.huang@linux.intel.com>
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  arch/x86/include/asm/cpufeatures.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index 28c4a502b419..da7fed4939a3 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -236,6 +236,7 @@
>  /* Intel-defined CPU features, CPUID level 0x00000007:0 (EBX), word 9 */
>  #define X86_FEATURE_FSGSBASE		( 9*32+ 0) /* RDFSBASE, WRFSBASE, RDGSBASE, WRGSBASE instructions*/
>  #define X86_FEATURE_TSC_ADJUST		( 9*32+ 1) /* TSC adjustment MSR 0x3B */
> +#define X86_FEATURE_SGX			( 9*32+ 2) /* Software Guard Extensions */
>  #define X86_FEATURE_BMI1		( 9*32+ 3) /* 1st group bit manipulation extensions */
>  #define X86_FEATURE_HLE			( 9*32+ 4) /* Hardware Lock Elision */
>  #define X86_FEATURE_AVX2		( 9*32+ 5) /* AVX2 instructions */
> -- 

Reviewed-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
