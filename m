From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v6 05/11] x86: add SGX MSRs to msr-index.h
Date: Tue, 28 Nov 2017 09:22:48 -0800
Message-ID: <1511889768.9392.63.camel@intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
         <20171125193132.24321-6-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:65036 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751495AbdK1R1D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 12:27:03 -0500
In-Reply-To: <20171125193132.24321-6-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Haim Cohen <haim.cohen@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Len Brown <len.brown@intel.com>, Kyle Huey <me@kylehuey.com>, Tom Lendacky <thomas.lendacky@amd.com>, Kan Liang <Kan.liang@intel.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>

On Sat, 2017-11-25 at 21:29 +0200, Jarkko Sakkinen wrote:
> From: Haim Cohen <haim.cohen@intel.com>
> 
> These MSRs hold the SHA256 checksum of the currently configured root
> key for enclave signatures.

The commit message doesn't talk about the launch control bit in the
feature control MSR.

> 
> Signed-off-by: Haim Cohen <haim.cohen@intel.com>
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  arch/x86/include/asm/msr-index.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/x86/include/asm/msr-index.h
> b/arch/x86/include/asm/msr-index.h
> index b35cb98b5d60..22e27d46d046 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -436,6 +436,7 @@
>  #define FEATURE_CONTROL_VMXON_ENABLED_INSIDE_SMX	(1<<1)
>  #define FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX	(1<<2)
>  #define FEATURE_CONTROL_SGX_ENABLE                      (1<<18)
> +#define FEATURE_CONTROL_SGX_LAUNCH_CONTROL_ENABLE	(1<<17)
>  #define FEATURE_CONTROL_LMCE				(1<<20)
>  
>  #define MSR_IA32_APICBASE		0x0000001b
> @@ -502,6 +503,12 @@
>  #define PACKAGE_THERM_INT_LOW_ENABLE		(1 << 1)
>  #define PACKAGE_THERM_INT_PLN_ENABLE		(1 << 24)
>  
> +/* Intel SGX MSRs */
> +#define MSR_IA32_SGXLEPUBKEYHASH0	0x0000008C
> +#define MSR_IA32_SGXLEPUBKEYHASH1	0x0000008D
> +#define MSR_IA32_SGXLEPUBKEYHASH2	0x0000008E
> +#define MSR_IA32_SGXLEPUBKEYHASH3	0x0000008F
> +
>  /* Thermal Thresholds Support */
>  #define THERM_INT_THRESHOLD0_ENABLE    (1 << 15)
>  #define THERM_SHIFT_THRESHOLD0        8
