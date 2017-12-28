From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v1] x86/platform/intel-mid: Revert "Make 'bt_sfi_data'
 const"
Date: Thu, 28 Dec 2017 13:37:58 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1712281333390.2220@hadrien>
References: <20171228100801.67744-1-andriy.shevchenko@linux.intel.com> <20171228102812.cm7yylrrq2omfw5y@gmail.com> <1514463164.7000.328.camel@linux.intel.com> <20171228121711.xwydozmtj5jhwkgj@gmail.com> <alpine.DEB.2.20.1712281323410.2220@hadrien>
 <20171228122931.ie5dggc43g6zjkkc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:45268
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753343AbdL1MiA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Dec 2017 07:38:00 -0500
In-Reply-To: <20171228122931.ie5dggc43g6zjkkc@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>



On Thu, 28 Dec 2017, Ingo Molnar wrote:

>
> * Julia Lawall <julia.lawall@lip6.fr> wrote:
>
> >
> >
> > On Thu, 28 Dec 2017, Ingo Molnar wrote:
> >
> > >
> > > * Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > On Thu, 2017-12-28 at 11:28 +0100, Ingo Molnar wrote:
> > > > > * Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > > The annoying static analyzer follow up patches make a pain rather
> > > > > > then
> > > > > > fixing issues.
> > > > > >
> > > > > > The one done by commit 276c87054751
> > > > > >
> > > > > > ("x86/platform/intel-mid: Make 'bt_sfi_data' const")
> > > > > >
> > > > > > made an obvious regression [BugLink] since the struct bt_sfi_data
> > > > > > used
> > > > > > as a temporary container for important data that is used to fill
> > > > > > 'parent' and 'name' fields in struct platform_device_info.
> > > > > >
> > > > > > That's why revert the commit which had been apparently done w/o
> > > > > > reading
> > > > > > the code.
> > > > > >
> > > > > > BugLink: https://github.com/andy-shev/linux/issues/20
> > > > > > Cc: Bhumika Goyal <bhumirks@gmail.com>
> > > > > > Cc: julia.lawall@lip6.fr
> > > > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > > ---
> > > > > >  arch/x86/platform/intel-mid/device_libs/platform_bt.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> > > > > > b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> > > > > > index dc036e511f48..5a0483e7bf66 100644
> > > > > > --- a/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> > > > > > +++ b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> > > > > > @@ -60,7 +60,7 @@ static int __init tng_bt_sfi_setup(struct
> > > > > > bt_sfi_data *ddata)
> > > > > >  	return 0;
> > > > > >  }
> > > > > >
> > > > > > -static const struct bt_sfi_data tng_bt_sfi_data __initdata = {
> > > > > > +static struct bt_sfi_data tng_bt_sfi_data __initdata = {
> > > > > >  	.setup	= tng_bt_sfi_setup,
> > > > > >  };
> > > > >
> > > > > This is nasty, why didn't the compiler warn about this bug?
> > > > >
> > > > > Normally when using a const data structure for a non-const purpose.
> > > > > (Unless
> > > > > there's a type cast which loses the type - one of the many reasons why
> > > > > type casts
> > > > > should be avoided.)
> > > >
> > > > Now I'm trying to get this.
> > > >
> > > > First of all, the new dependency to hci_bcm makes this one not compiled
> > > > at all.
> > > >
> > > > Second, there is a cast as you truthfully predicted...
> > > >
> > > > I would say that revert is needed, but it seems it wasn't a culprit for
> > > > the bug (rather the new dependency is). So, it might need rewording of
> > > > the commit message to low tone of the accusations.
> > >
> > > Your fix is absolutely needed and welcome, but I'd first like to see a build error
> > > or build warning that avoids the introduction of this class of problems in the
> > > future - then apply your fix in a separate patch.
> > >
> > > Constification patches are useful in general, and such breakages are hard to debug
> >
> > I will try to make the type adjustment.
>
> Assuming it's all a natural improvement to the affected code. I'm really just
> guessing blindly here - reality might interfere!
>
> > [...] There does seem to be a few cases where the field actually does hold an
> > integer.  I guess this is not a problem?
>
> Could you point to such an example?

drivers/thermal/intel_soc_dts_thermal.c:#define BYT_SOC_DTS_APIC_IRQ	86

and then:

static const struct x86_cpu_id soc_thermal_ids[] = {
        { X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_SILVERMONT1, 0,
                BYT_SOC_DTS_APIC_IRQ},
        {}
};

and finally:

 soc_dts_thres_irq = (int)match_cpu->driver_data;

Also:

arch/x86/kernel/apic/apic.c

#define DEADLINE_MODEL_MATCH_REV(model, rev)    \
	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)rev
}

DEADLINE_MODEL_MATCH_REV ( INTEL_FAM6_BROADWELL_X,      0x0b000020),
DEADLINE_MODEL_MATCH_REV ( INTEL_FAM6_HASWELL_CORE,     0x22),
etc. (all 2-digit numbers in the remaining case).

julia
