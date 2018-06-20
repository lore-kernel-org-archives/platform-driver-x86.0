From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v11 08/13] x86, sgx: added ENCLS wrappers
Date: Wed, 20 Jun 2018 06:12:35 -0700
Message-ID: <1529500355.9779.51.camel@intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
         <20180608171216.26521-9-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608171216.26521-9-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org
Cc: dave.hansen@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 2018-06-08 at 19:09 +0200, Jarkko Sakkinen wrote:
> This commit adds wrappers for Intel(R) SGX ENCLS opcode functionality.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  arch/x86/include/asm/sgx.h | 198 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 198 insertions(+)
> 
> diff --git a/arch/x86/include/asm/sgx.h b/arch/x86/include/asm/sgx.h
> index fa3e6e0eb8af..a2f727f85b91 100644
> --- a/arch/x86/include/asm/sgx.h
> +++ b/arch/x86/include/asm/sgx.h
> @@ -10,6 +10,10 @@
>  #ifndef _ASM_X86_SGX_H
>  #define _ASM_X86_SGX_H
>  
> +#include <asm/sgx_arch.h>
> +#include <asm/asm.h>
> +#include <linux/bitops.h>
> +#include <linux/err.h>
>  #include <linux/types.h>
>  
>  #define SGX_CPUID 0x12
> @@ -20,6 +24,200 @@ enum sgx_cpuid {
>  	SGX_CPUID_EPC_BANKS	= 2,
>  };
>  
> +enum sgx_commands {

This should be something like "sgx_encls_leafs" and probably moved
to sgx_arch.h (as Dave alluded to, these are architectural values).
"sgx_commands" is not accurate (they're only the cpl0 "commands")
and will have collision issues in the future, e.g. with the ENCLV
instruction and its leafs.

> +	ECREATE	= 0x0,
> +	EADD	= 0x1,
> +	EINIT	= 0x2,
> +	EREMOVE	= 0x3,
> +	EDGBRD	= 0x4,
> +	EDGBWR	= 0x5,
> +	EEXTEND	= 0x6,

Even though it's not used in the code (yet...), I think ELDB,
leaf 0x7, should be defined here for completeness.

> +	ELDU	= 0x8,
> +	EBLOCK	= 0x9,
> +	EPA	= 0xA,
> +	EWB	= 0xB,
> +	ETRACK	= 0xC,
> +	EAUG	= 0xD,
> +	EMODPR	= 0xE,
> +	EMODT	= 0xF,
> +};
