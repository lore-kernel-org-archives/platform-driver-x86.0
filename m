From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] x86/platform/intel-mid: Revert "Make 'bt_sfi_data'
 const"
Date: Thu, 28 Dec 2017 14:12:44 +0200
Message-ID: <1514463164.7000.328.camel@linux.intel.com>
References: <20171228100801.67744-1-andriy.shevchenko@linux.intel.com>
         <20171228102812.cm7yylrrq2omfw5y@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:6422 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751258AbdL1MMs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Dec 2017 07:12:48 -0500
In-Reply-To: <20171228102812.cm7yylrrq2omfw5y@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, julia.lawall@lip6.fr

On Thu, 2017-12-28 at 11:28 +0100, Ingo Molnar wrote:
> * Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > The annoying static analyzer follow up patches make a pain rather
> > then
> > fixing issues.
> > 
> > The one done by commit 276c87054751
> > 
> > ("x86/platform/intel-mid: Make 'bt_sfi_data' const")
> > 
> > made an obvious regression [BugLink] since the struct bt_sfi_data
> > used
> > as a temporary container for important data that is used to fill
> > 'parent' and 'name' fields in struct platform_device_info.
> > 
> > That's why revert the commit which had been apparently done w/o
> > reading
> > the code.
> > 
> > BugLink: https://github.com/andy-shev/linux/issues/20
> > Cc: Bhumika Goyal <bhumirks@gmail.com>
> > Cc: julia.lawall@lip6.fr
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  arch/x86/platform/intel-mid/device_libs/platform_bt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> > b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> > index dc036e511f48..5a0483e7bf66 100644
> > --- a/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> > +++ b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> > @@ -60,7 +60,7 @@ static int __init tng_bt_sfi_setup(struct
> > bt_sfi_data *ddata)
> >  	return 0;
> >  }
> >  
> > -static const struct bt_sfi_data tng_bt_sfi_data __initdata = {
> > +static struct bt_sfi_data tng_bt_sfi_data __initdata = {
> >  	.setup	= tng_bt_sfi_setup,
> >  };
> 
> This is nasty, why didn't the compiler warn about this bug?
> 
> Normally when using a const data structure for a non-const purpose.
> (Unless 
> there's a type cast which loses the type - one of the many reasons why
> type casts 
> should be avoided.)

Now I'm trying to get this.

First of all, the new dependency to hci_bcm makes this one not compiled
at all.

Second, there is a cast as you truthfully predicted...

I would say that revert is needed, but it seems it wasn't a culprit for
the bug (rather the new dependency is). So, it might need rewording of
the commit message to low tone of the accusations.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
