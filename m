From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v1] x86/platform/intel-mid: Revert "Make 'bt_sfi_data'
 const"
Date: Thu, 28 Dec 2017 13:53:41 +0100
Message-ID: <20171228125341.46xng2mzagksfyhr@gmail.com>
References: <20171228100801.67744-1-andriy.shevchenko@linux.intel.com>
 <20171228102812.cm7yylrrq2omfw5y@gmail.com>
 <1514463164.7000.328.camel@linux.intel.com>
 <20171228121711.xwydozmtj5jhwkgj@gmail.com>
 <alpine.DEB.2.20.1712281323410.2220@hadrien>
 <20171228122931.ie5dggc43g6zjkkc@gmail.com>
 <alpine.DEB.2.20.1712281333390.2220@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1712281333390.2220@hadrien>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>
List-Id: platform-driver-x86.vger.kernel.org


* Julia Lawall <julia.lawall@lip6.fr> wrote:

> > > [...] There does seem to be a few cases where the field actually does hold an
> > > integer.  I guess this is not a problem?
> >
> > Could you point to such an example?
> 
> drivers/thermal/intel_soc_dts_thermal.c:#define BYT_SOC_DTS_APIC_IRQ	86
> 
> and then:
> 
> static const struct x86_cpu_id soc_thermal_ids[] = {
>         { X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_SILVERMONT1, 0,
>                 BYT_SOC_DTS_APIC_IRQ},
>         {}
> };
> 
> and finally:
> 
>  soc_dts_thres_irq = (int)match_cpu->driver_data;
> 
> Also:
> 
> arch/x86/kernel/apic/apic.c
> 
> #define DEADLINE_MODEL_MATCH_REV(model, rev)    \
> 	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)rev
> }
> 
> DEADLINE_MODEL_MATCH_REV ( INTEL_FAM6_BROADWELL_X,      0x0b000020),
> DEADLINE_MODEL_MATCH_REV ( INTEL_FAM6_HASWELL_CORE,     0x22),
> etc. (all 2-digit numbers in the remaining case).

Ok - I think in these cases the resulting long->pointer type conversion is a _lot_ 
less dangerous than the pointer->long conversion which caused the regression.

So unless the resulting code is excessively ugly, this feels like the right 
approach to me.

Thanks,

	Ingo
