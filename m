From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v2 06/10] x86/cpu: Add Icelake to Intel family
Date: Wed, 13 Feb 2019 16:23:26 +0100
Message-ID: <20190213152326.GA1883@zn.tnic>
References: <20190213150810.32750-1-rajneesh.bhardwaj@linux.intel.com>
 <20190213150810.32750-7-rajneesh.bhardwaj@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190213150810.32750-7-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, "David E. Box" <david.e.box@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 13, 2019 at 08:38:06PM +0530, Rajneesh Bhardwaj wrote:
> Add CPUID of Icelake (ICL) mobile processors to Intel family list. The
> information related to ICL CPUID is referenced from below Coreboot
> project link.
> 
> https://github.com/coreboot/coreboot/blob/5ebcea3aaaa3cd358bc5bccaa156b13a6ef25df6/src/soc/intel/common/block/include/intelblocks/mp_init.h
> 

I believe tglx was suggesting you should drop this link. If you can't
reference an official document, then you don't need any reference.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
