From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Patch v2] x86/cpu: Add Ice Lake NNPI to Intel family
Date: Wed, 12 Jun 2019 12:52:33 +0300
Message-ID: <20190612095233.GE9224@smile.fi.intel.com>
References: <20190606012419.13250-1-rajneesh.bhardwaj@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190606012419.13250-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, bp@suse.de, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Kan Liang <kan.liang@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, platform-driver-x86@vger.kernel.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Linux PM <linux-pm@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jun 06, 2019 at 06:54:19AM +0530, Rajneesh Bhardwaj wrote:
> Add the CPUID model number of Ice Lake Neural Network Processor for Deep
> Learning Inference (ICL-NNPI) to the Intel family list. Ice Lake NNPI uses
> model number 0x9D and this will be documented in a future version of Intel
> Software Development Manual.

>  #define INTEL_FAM6_ICELAKE_MOBILE	0x7E
> +#define INTEL_FAM6_ICELAKE_NNPI		0x9D

What "I" stands for?

For me sounds like it's redundant here or something like NNP_DLI would be
better (because somewhere we have _NP as for Network Processor).

-- 
With Best Regards,
Andy Shevchenko
