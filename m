From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v6 06/11] intel_sgx: driver for Intel Software Guard
 Extensions
Date: Tue, 28 Nov 2017 11:07:40 -0800
Message-ID: <20171128190739.GA22891@linux.intel.com>
References: <20171125193132.24321-7-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171125193132.24321-7-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

> diff --git a/arch/x86/include/asm/sgx_arch.h b/arch/x86/include/asm/sgx_arch.h
> new file mode 100644
> index 000000000000..515676031006
> --- /dev/null
> +++ b/arch/x86/include/asm/sgx_arch.h
> @@ -0,0 +1,268 @@

[...]

> +
> +#ifndef _ASM_X86_SGX_ARCH_H
> +#define _ASM_X86_SGX_ARCH_H

Still missing #include <linux/types.h>.

> +
> +#define SGX_SSA_GPRS_SIZE              182
> +#define SGX_SSA_MISC_EXINFO_SIZE       16
