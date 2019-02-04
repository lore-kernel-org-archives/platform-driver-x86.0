From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 06/10] x86/cpu: Add Icelake to Intel family
Date: Mon, 4 Feb 2019 17:34:08 +0000 (GMT)
Message-ID: <alpine.DEB.2.21.1902041731500.3006@nanos.tec.linutronix.de>
References: <20190201073234.13280-1-rajneesh.bhardwaj@linux.intel.com> <20190201073234.13280-7-rajneesh.bhardwaj@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201073234.13280-7-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "David E. Box" <david.e.box@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 1 Feb 2019, Rajneesh Bhardwaj wrote:

> Add CPUID of Icelake (ICL) mobile processors to Intel family list. The
> Information related to ICL CPUID is referenced from below Coreboot
> project link.
> 
> https://github.com/coreboot/coreboot/blob/5ebcea3aaaa3cd358bc5bccaa156b13a6ef25df6/src/soc/intel/common/block/include/intelblocks/mp_init.h

Coreboot files are hardly authoritive information about CPUIDs.

> diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel-family.h
> index 0dd6b0f4000e..12b65bdb3d80 100644
> --- a/arch/x86/include/asm/intel-family.h
> +++ b/arch/x86/include/asm/intel-family.h
> @@ -52,6 +52,8 @@
>  
>  #define INTEL_FAM6_CANNONLAKE_MOBILE	0x66
>  
> +#define INTEL_FAM6_ICELAKE_MOBILE       0x7E

Please use TABs instead of a random number of spaces.

Thanks,

	tglx
