From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v6 03/11] x86: define IA32_FEATURE_CONTROL.SGX_ENABLE
Date: Tue, 28 Nov 2017 09:13:18 -0800
Message-ID: <1511889198.9392.56.camel@intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
         <20171125193132.24321-4-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:26102 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751623AbdK1RRd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 12:17:33 -0500
In-Reply-To: <20171125193132.24321-4-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Len Brown <len.brown@intel.com>, Kyle Huey <me@kylehuey.com>, Haim Cohen <haim.cohen@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, Jim Mattson <jmattson@google.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>

On Sat, 2017-11-25 at 21:29 +0200, Jarkko Sakkinen wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> When IA32_FEATURE_CONTROL.SGX_ENABLE and IA32_FEATURE_CONTROL.LOCK are
> set by the pre-boot firmware, SGX is usable by the OS.

This implies that only pre-boot firmware can write feature control, which is not
true.  What about:

    SGX instructions (ENCLS and ENCLU) are usable if and only if SGX_ENABLE is
    set in the IA32_FEATURE_CONTROL MSR and said MSR is locked.

> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  arch/x86/include/asm/msr-index.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-
> index.h
> index 17f5c12e1afd..b35cb98b5d60 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -435,6 +435,7 @@
>  #define FEATURE_CONTROL_LOCKED				(1<<0)
>  #define FEATURE_CONTROL_VMXON_ENABLED_INSIDE_SMX	(1<<1)
>  #define FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX	(1<<2)
> +#define FEATURE_CONTROL_SGX_ENABLE                      (1<<18)
>  #define FEATURE_CONTROL_LMCE				(1<<20)
>  
>  #define MSR_IA32_APICBASE		0x0000001b
