From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform:x86 decouple telemetry driver from the optional
 IPC resources
Date: Fri, 22 Apr 2016 00:13:56 +0300
Message-ID: <CAHp75VdTYajOmA09icFF5x6d-Qib_XjNFgM_vTzh8+mhEahb2g@mail.gmail.com>
References: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
	<CAHp75VeKgVwOQ7U9=a92hcts8tPJriRtNJ3h2nHL_BXVXc7D5Q@mail.gmail.com>
	<570A5948.8000405@linux.intel.com>
	<20160415003236.GA3232@f23x64.localdomain>
	<57104F92.9060908@linux.intel.com>
	<20160415050553.GF3232@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34861 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752431AbcDUVN6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Apr 2016 17:13:58 -0400
In-Reply-To: <20160415050553.GF3232@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "Li, Aubrey" <aubrey.li@linux.intel.com>, qipeng.zha@intel.com, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Apr 15, 2016 at 8:05 AM, Darren Hart <dvhart@infradead.org> wrote:

>> >>>> +       /*
>> >>>> +        * The following resources are optional
>> >>>> +        * - ISPDRIVER_IPC BASE_DATA
>> >>>> +        * - ISPDRIVER_IPC BASE_IFACE
>> >>>> +        * - GTDRIVER_IPC BASE_DATA
>> >>>> +        * - GTDRIVER_IPC BASE_IFACE
>> >>>> +        */
>> >>>>         res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
>> >>>> -       addr = devm_ioremap_resource(&pdev->dev, res);
>> >>>> -       if (IS_ERR(addr))
>> >>>> -               return PTR_ERR(addr);
>> >>>> -       punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] = addr;
>> >>>> +       if (res) {
>> >>>> +               addr = devm_ioremap_resource(&pdev->dev, res);
>> >>>> +               if (!IS_ERR(addr))
>> >>>> +                       punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] = addr;
>> >>>> +       }
>> >>>
>> >>> And here, what about just replacing return to dev_warn()?
>> >>
>> >> I don't think we need to continue the subsequent ops if an error address
>> >> returns.
>> >
>> > Why is that? Will the driver fail to provide any functionality? Or could it be
>> > the other IFACEs could still be of some use?
>> >
>> > This one does need a justification.
>> >
>> We discussed this.
>> - For the necessary resources, if we obtain an error address, we should
>> return immediately.
>> - For the optional resources, we keep quiet if we don't get them, that
>> is, not throwing a warning out.
>
> Andy, he's checking for "res" now too, which is a good extra check since
> devm_ioremap_resource will issue a dev_err "invalid resource" if it's NULL, even
> though in our case, that's expected for an optional resource. This adds the
> extra nesting, and a dev_warn wouldn't be appropriate for an option resource.
>
> I'm happy to queue this to fixes at this point. Andy, are you OK with the
> resolution here?

Gmail hided this mail from me by some reason. I'm fine with the resolution.

-- 
With Best Regards,
Andy Shevchenko
