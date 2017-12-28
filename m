From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v1] x86/platform/intel-mid: Revert "Make 'bt_sfi_data'
 const"
Date: Thu, 28 Dec 2017 16:24:32 +0100
Message-ID: <20171228152431.2zmikdjurx6356ng@gmail.com>
References: <20171228100801.67744-1-andriy.shevchenko@linux.intel.com>
 <20171228102812.cm7yylrrq2omfw5y@gmail.com>
 <1514463164.7000.328.camel@linux.intel.com>
 <20171228121711.xwydozmtj5jhwkgj@gmail.com>
 <alpine.DEB.2.20.1712281323410.2220@hadrien>
 <20171228122931.ie5dggc43g6zjkkc@gmail.com>
 <alpine.DEB.2.20.1712281333390.2220@hadrien>
 <20171228125341.46xng2mzagksfyhr@gmail.com>
 <alpine.DEB.2.20.1712281453270.8594@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:39825 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753710AbdL1PYg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Dec 2017 10:24:36 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1712281453270.8594@hadrien>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>


* Julia Lawall <julia.lawall@lip6.fr> wrote:

> 
> 
> On Thu, 28 Dec 2017, Ingo Molnar wrote:
> 
> >
> > * Julia Lawall <julia.lawall@lip6.fr> wrote:
> >
> > > > > [...] There does seem to be a few cases where the field actually does hold an
> > > > > integer.  I guess this is not a problem?
> > > >
> > > > Could you point to such an example?
> > >
> > > drivers/thermal/intel_soc_dts_thermal.c:#define BYT_SOC_DTS_APIC_IRQ	86
> > >
> > > and then:
> > >
> > > static const struct x86_cpu_id soc_thermal_ids[] = {
> > >         { X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_SILVERMONT1, 0,
> > >                 BYT_SOC_DTS_APIC_IRQ},
> > >         {}
> > > };
> > >
> > > and finally:
> > >
> > >  soc_dts_thres_irq = (int)match_cpu->driver_data;
> > >
> > > Also:
> > >
> > > arch/x86/kernel/apic/apic.c
> > >
> > > #define DEADLINE_MODEL_MATCH_REV(model, rev)    \
> > > 	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)rev
> > > }
> > >
> > > DEADLINE_MODEL_MATCH_REV ( INTEL_FAM6_BROADWELL_X,      0x0b000020),
> > > DEADLINE_MODEL_MATCH_REV ( INTEL_FAM6_HASWELL_CORE,     0x22),
> > > etc. (all 2-digit numbers in the remaining case).
> >
> > Ok - I think in these cases the resulting long->pointer type conversion is a _lot_
> > less dangerous than the pointer->long conversion which caused the regression.
> >
> > So unless the resulting code is excessively ugly, this feels like the right
> > approach to me.
> 
> The problem is that this case will inevitably have a cast somewhere.

That's OK as long as the cast is dominantly (long)->(pointer), because that 
doesn't really risk losing the underlying type.

It's the (pointer)->(pointer) and (pointer)->(long) conversions that are the most 
dangerous ones.

> [...]  Many of the values put into the driver_data field really are const, so 
> the type has to be const void *.  When the value is extracted from the 
> structure, there will thus need to be a cast on it, and the current cast
> 
> ddata = (struct bt_sfi_data *)id->driver_data;
> 
> works fine, whether the original structure is const or not.

So since this data structure is not size critical, I'd really suggest using two or 
three fields:

	->driver_data.ptr
	->driver_data.const_ptr
	->driver_data.long

that way the fundamental types remains.

> 
> I also got a couple of complaints about non-pointer types:
> 
> arch/x86/kernel/apic/apic.c:621:9: warning: cast from pointer to integer
> of different size [-Wpointer-to-int-cast]
>    rev = (u32)m->driver_data;
> 
> drivers/thermal/intel_soc_dts_thermal.c:68:22: warning: cast from pointer
> to integer of different size [-Wpointer-to-int-cast]
>   soc_dts_thres_irq = (int)match_cpu->driver_data;

These could use driver_data.long or so?

Thanks,

	Ingo
