From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Patch v2] x86/cpu: Add Ice Lake NNPI to Intel family
Date: Wed, 12 Jun 2019 19:29:18 +0300
Message-ID: <20190612162918.GP9224@smile.fi.intel.com>
References: <20190606012419.13250-1-rajneesh.bhardwaj@linux.intel.com>
 <20190612095233.GE9224@smile.fi.intel.com>
 <73eb1ba5-dc29-53ee-487d-d22700b874a1@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <73eb1ba5-dc29-53ee-487d-d22700b874a1@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, bp@suse.de, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Kan Liang <kan.liang@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, platform-driver-x86@vger.kernel.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Linux PM <linux-pm@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 12, 2019 at 07:51:26AM -0700, Dave Hansen wrote:
> On 6/12/19 2:52 AM, Andy Shevchenko wrote:
> >>  #define INTEL_FAM6_ICELAKE_MOBILE	0x7E
> >> +#define INTEL_FAM6_ICELAKE_NNPI		0x9D
> > What "I" stands for?
> > 
> > For me sounds like it's redundant here or something like NNP_DLI would be
> > better (because somewhere we have _NP as for Network Processor).
> 
> Let's not bikeshed this too much.  These things aren't used that widely
> and mostly they're just used for figuring out the processor generation.
>  It's exceedingly rare to have something like:
> 
> 
> 	if (model == INTEL_FAM6_ICELAKE_MOBILE)
> 		foo();
> 	else if (model == INTEL_FAM6_ICELAKE_NNPI)
> 		bar();
> 
> where what you suggest would matter.
> 
> Preserving the ability to google "ice lake nnpi" is pretty important, so
> preserving the Intel name makes a lot of sense here when possible.

What I'm talking is a consistency among suffixes. If there is a real
abbreviation (NNPI) which anybody can google, I'm totally for it to be used.

> Do we *HAVE* an Ice Lake network processor?

Not Ice Lake, something else.

-- 
With Best Regards,
Andy Shevchenko
