From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform:x86 decouple telemetry driver from the optional
 IPC resources
Date: Thu, 14 Apr 2016 22:05:53 -0700
Message-ID: <20160415050553.GF3232@f23x64.localdomain>
References: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
 <CAHp75VeKgVwOQ7U9=a92hcts8tPJriRtNJ3h2nHL_BXVXc7D5Q@mail.gmail.com>
 <570A5948.8000405@linux.intel.com>
 <20160415003236.GA3232@f23x64.localdomain>
 <57104F92.9060908@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42087 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966AbcDOFF4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 15 Apr 2016 01:05:56 -0400
Content-Disposition: inline
In-Reply-To: <57104F92.9060908@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Li, Aubrey" <aubrey.li@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, qipeng.zha@intel.com, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Apr 15, 2016 at 10:18:58AM +0800, Li, Aubrey wrote:

Hi Aubrey,

> >>>>         res = platform_get_resource(pdev, IORESOURCE_MEM,
> >>>>                                     PLAT_RESOURCE_ISP_DATA_INDEX);
> >>>> -       if (!res) {
> >>>> -               dev_err(&pdev->dev, "Failed to get res of punit ISP data\n");
> >>>> -               return -ENXIO;
> >>>> +       ++punit_res;
> >>>> +       if (res) {
> >>>> +               *punit_res = *res;
> >>>> +               dev_info(&pdev->dev, "punit ISP data res: %pR\n", res);
> >>>
> >>> Okay, what if you re-arrange this to some helper first
> >>>
> >>
> >> Thanks for the idea, but I don't like a helper here, did you see
> >> anything harmful of the current implementation?
> > 
> > In both arguments, we need to identify the WHY.
> > 
> > I imagine Andy is trying to reduce the copy and paste potential for error as
> > well as error introduction in future patches. There are... 7 or so cases with
> > near identical usage, that's a compelling argument for a refactor such as the
> > helper Andy suggests.
> > 
> > Aubrey, you said you don't like it. Why is that? Will it not save enough lines
> > of code to be worth it? Are you concerned about revalidating the change?
> 
> dev_info with different strings makes the helper useless, or more
> complex than desired if we have to write a helper here.
> 
> Also, we have necessary resource above, which returns directly if there
> is a error. For the coding style consistency in a routine, I really
> don't like we call platform_get_resource() directly at first and then
> put it into a helper later. The current implementation is
> straightforward and clean.

Both of those could be addressed with arguments, macros, etc. However, that
becomes subjective quickly, and I appreciate the incremental functional fix
here. I think this bit is fine as is.

...

> >>>> diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platform/x86/intel_punit_ipc.c
> >>>> index bd87540..a47a41f 100644
> >>>> --- a/drivers/platform/x86/intel_punit_ipc.c
> >>>> +++ b/drivers/platform/x86/intel_punit_ipc.c
> >>>> @@ -227,6 +227,11 @@ static int intel_punit_get_bars(struct platform_device *pdev)
> >>>>         struct resource *res;
> >>>>         void __iomem *addr;
> >>>>
> >>>> +       /*
> >>>> +        * The following resources are required
> >>>> +        * - BIOS_IPC BASE_DATA
> >>>> +        * - BIOS_IPC BASE_IFACE
> >>>> +        */
> >>>>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >>>>         addr = devm_ioremap_resource(&pdev->dev, res);
> >>>>         if (IS_ERR(addr))
> >>>> @@ -239,29 +244,40 @@ static int intel_punit_get_bars(struct platform_device *pdev)
> >>>>                 return PTR_ERR(addr);
> >>>>         punit_ipcdev->base[BIOS_IPC][BASE_IFACE] = addr;
> >>>>
> >>>> +       /*
> >>>> +        * The following resources are optional
> >>>> +        * - ISPDRIVER_IPC BASE_DATA
> >>>> +        * - ISPDRIVER_IPC BASE_IFACE
> >>>> +        * - GTDRIVER_IPC BASE_DATA
> >>>> +        * - GTDRIVER_IPC BASE_IFACE
> >>>> +        */
> >>>>         res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> >>>> -       addr = devm_ioremap_resource(&pdev->dev, res);
> >>>> -       if (IS_ERR(addr))
> >>>> -               return PTR_ERR(addr);
> >>>> -       punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] = addr;
> >>>> +       if (res) {
> >>>> +               addr = devm_ioremap_resource(&pdev->dev, res);
> >>>> +               if (!IS_ERR(addr))
> >>>> +                       punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] = addr;
> >>>> +       }
> >>>
> >>> And here, what about just replacing return to dev_warn()?
> >>
> >> I don't think we need to continue the subsequent ops if an error address
> >> returns.
> > 
> > Why is that? Will the driver fail to provide any functionality? Or could it be
> > the other IFACEs could still be of some use?
> > 
> > This one does need a justification.
> > 
> We discussed this.
> - For the necessary resources, if we obtain an error address, we should
> return immediately.
> - For the optional resources, we keep quiet if we don't get them, that
> is, not throwing a warning out.

Andy, he's checking for "res" now too, which is a good extra check since
devm_ioremap_resource will issue a dev_err "invalid resource" if it's NULL, even
though in our case, that's expected for an optional resource. This adds the
extra nesting, and a dev_warn wouldn't be appropriate for an option resource.

I'm happy to queue this to fixes at this point. Andy, are you OK with the
resolution here?


-- 
Darren Hart
Intel Open Source Technology Center
