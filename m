From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v1] x86/platform/intel-mid: Revert "Make 'bt_sfi_data'
 const"
Date: Thu, 28 Dec 2017 12:12:16 +0100
Message-ID: <20171228111216.6ebgmcdert4lgkof@gmail.com>
References: <20171228100801.67744-1-andriy.shevchenko@linux.intel.com>
 <20171228102812.cm7yylrrq2omfw5y@gmail.com>
 <alpine.DEB.2.20.1712281133530.2220@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35898 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752905AbdL1LMU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Dec 2017 06:12:20 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1712281133530.2220@hadrien>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>


* Julia Lawall <julia.lawall@lip6.fr> wrote:

> 
> 
> On Thu, 28 Dec 2017, Ingo Molnar wrote:
> 
> >
> > * Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > The annoying static analyzer follow up patches make a pain rather then
> > > fixing issues.
> > >
> > > The one done by commit 276c87054751
> > >
> > > ("x86/platform/intel-mid: Make 'bt_sfi_data' const")
> > >
> > > made an obvious regression [BugLink] since the struct bt_sfi_data used
> > > as a temporary container for important data that is used to fill
> > > 'parent' and 'name' fields in struct platform_device_info.
> > >
> > > That's why revert the commit which had been apparently done w/o reading
> > > the code.
> > >
> > > BugLink: https://github.com/andy-shev/linux/issues/20
> > > Cc: Bhumika Goyal <bhumirks@gmail.com>
> > > Cc: julia.lawall@lip6.fr
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >  arch/x86/platform/intel-mid/device_libs/platform_bt.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/x86/platform/intel-mid/device_libs/platform_bt.c b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> > > index dc036e511f48..5a0483e7bf66 100644
> > > --- a/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> > > +++ b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> > > @@ -60,7 +60,7 @@ static int __init tng_bt_sfi_setup(struct bt_sfi_data *ddata)
> > >  	return 0;
> > >  }
> > >
> > > -static const struct bt_sfi_data tng_bt_sfi_data __initdata = {
> > > +static struct bt_sfi_data tng_bt_sfi_data __initdata = {
> > >  	.setup	= tng_bt_sfi_setup,
> > >  };
> >
> > This is nasty, why didn't the compiler warn about this bug?
> >
> > Normally when using a const data structure for a non-const purpose. (Unless
> > there's a type cast which loses the type - one of the many reasons why type casts
> > should be avoided.)
> 
> Indeed, because there is a cast:
> 
> #define ICPU(model, ddata)      \
>         { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (kernel_ulong_t)&ddata }
> 
> static const struct x86_cpu_id bt_sfi_cpu_ids[] = {
> 	ICPU(INTEL_FAM6_ATOM_MERRIFIELD, tng_bt_sfi_data),
>         {}
> };

So the type is the following, in include/linux/mod_devicetable.h:

struct x86_cpu_id {
        __u16 vendor;
        __u16 family;
        __u16 model;
        __u16 feature;  /* bit index */
        kernel_ulong_t driver_data;
};

Is there a syntactic method that would allow the conversion to kernel_ulong_t, but 
would preserve any const-ness?

Barring that, maybe we could convert driver_data to 'void *', fix up all users, 
and not force the type - this would allow the preservation of the const attribute, 
I think.

BTW., a quick grep suggests similar type casting patterns here:

arch/x86/platform/intel-mid/pwr.c:      { PCI_VDEVICE(INTEL, PCI_DEVICE_ID_PENWELL), (kernel_ulong_t)&pnw_info },
arch/x86/platform/intel-mid/pwr.c:      { PCI_VDEVICE(INTEL, PCI_DEVICE_ID_TANGIER), (kernel_ulong_t)&tng_info },

Thanks,

	Ingo
