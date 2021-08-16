Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE1BC4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 07:44:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47E0561ACF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 07:44:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234475AbhHPHoh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Aug 2021 03:44:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50400 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234168AbhHPHof (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 03:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629099844;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QIX04iLjnCf2vT5vquc36H0oSWZk+G6f4T6BcmkOvGo=;
        b=gPMF0HHtfkWqKvuBdB0xbhzCONsD+Fzdxd8Ov3Gm/ZUkf2oDZQyvEAE4vtSbBQiYkMlbDq
        hQ2YyGyUgkuxdC5E8li17pA9bMH7uB5tDcLHsw6O453GY6UiBI2HD2CeMTQr7LmBi4TSas
        hY1Ap+6o7k3dY0O2r0BVXNuP37Qw8vU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-fQX_87fsMTKSJlnjrI2Qog-1; Mon, 16 Aug 2021 03:44:01 -0400
X-MC-Unique: fQX_87fsMTKSJlnjrI2Qog-1
Received: by mail-lf1-f70.google.com with SMTP id z26-20020a0565120c1a00b003cf39d5ed62so335978lfu.16
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Aug 2021 00:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QIX04iLjnCf2vT5vquc36H0oSWZk+G6f4T6BcmkOvGo=;
        b=jgF2vHAqBJwb+mvgyo46jyXDjWvt6Pxay7YwJDSltQMNvJ+hDM/qB4e+5CAS97Jye4
         D4aHX/Dmxp9JO+oXWbi0xPzNBCCn8/mnebYfxurpWVOpqUhvzjDOVoyU7gZevD+pHlY3
         vXp0ap80UA/FEbMBDsd2zjFerZbpPFTNEKPI1ImOrahwttUel7YcxfBFGqE+1zPEsQOy
         oMmFvF1nxlTaNMkLLom8xk1oZYbywlILbTu/Exf+SguNemx4iRodHj/amGskM6VTPgQQ
         YBLaEk8V0u6SXp23RPWNjWOVNPqogr10kz2h3Y4Ou1rW7VQgsSzQ/Y1gir0VavvRdT7x
         uEWg==
X-Gm-Message-State: AOAM532bDw70IqQJ0EhQt1wcYV6j9H4kSBAIHkCniDzDRMulRi3KeST9
        7sRKfHniPouTLMbPcjNZbTd7bKDmBGoh2OnsYqq/YokfaVDOlHaHWL5jCJbV5DRd6Y0DpG74vAh
        Y3VLB7tU7iCGvE0LOVcfDqRbZk+s6Ibkod/bD42xRWMsYLAv0lw==
X-Received: by 2002:a05:6512:3f82:: with SMTP id x2mr10397731lfa.108.1629099839759;
        Mon, 16 Aug 2021 00:43:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvRSNzROcYYK6EadpNVDBwFmCb8c3uDhuU5GBcLxcE6RgVpcKxQHBPHENxIALF2lINTj7GYITh8XLBqLNJrxw=
X-Received: by 2002:a05:6512:3f82:: with SMTP id x2mr10397716lfa.108.1629099839460;
 Mon, 16 Aug 2021 00:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210810095832.4234-1-hpa@redhat.com> <20210810095832.4234-19-hpa@redhat.com>
 <95801e67-f09e-64f3-abd6-f38a8f1f1d51@linaro.org> <2cc45082-692d-1a0e-cb44-7e2393c95152@redhat.com>
 <5a80a56e41369204b7729d25f72dfcdd09919033.camel@intel.com> <e76e99b1-e66b-6339-00a7-b3e2aa0ab8a8@redhat.com>
In-Reply-To: <e76e99b1-e66b-6339-00a7-b3e2aa0ab8a8@redhat.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Mon, 16 Aug 2021 15:43:48 +0800
Message-ID: <CAEth8oF29LwJq3iEdW5KNqYdZcV04F9L91857LaoX_V+q+vwCQ@mail.gmail.com>
Subject: Re: [PATCH 18/20] Move Intel thermal driver for menlow platform
 driver to intel/ directory to improve readability.
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "Thomas, Sujith" <sujith.thomas@intel.com>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Zha, Qipeng" <qipeng.zha@intel.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "Joseph, Jithu" <jithu.joseph@intel.com>,
        "irenic.rajneesh@gmail.com" <irenic.rajneesh@gmail.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "acelan.kao@canonical.com" <acelan.kao@canonical.com>,
        "Box, David E" <david.e.box@intel.com>,
        "Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
        "alex.hung@canonical.com" <alex.hung@canonical.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "Ma, Maurice" <maurice.ma@intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Aug 16, 2021 at 3:40 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 8/16/21 5:11 AM, Pandruvada, Srinivas wrote:
> > On Sun, 2021-08-15 at 16:08 +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 8/14/21 12:39 PM, Daniel Lezcano wrote:
> >>> On 10/08/2021 11:58, Kate Hsuan wrote:
> >>>
> >>>
> >>> Why not move it into drivers/thermal/intel ?
> >>
> >> This cleanup is really something which Intel should have been doing
> >> itself, but they have not done that, so now Kate has stepped up to
> >> do this.
> >>
> >> Figuring out if there is a better home for each of these drivers
> >> really falls outside of the scope of this. If Intel and specifically
> >> Sujith Thomas, the maintainer for that driver who is in the Cc,
> >> believe that drivers/thermal/intel is a better place then they
> >> can submit a patch for this themselves.
> >>
> >> If Intel does that right away, then this patch can be dropped from
> >> Kate's patch-set. Otherwise this can be moved a second time once
> >> someone from Intel gets around to it.
> > We can move to thermal/intel. I will submit a change to do that.
>
> Great, I see that you've already send a patch for this, thank you.
>
> Kate, please drop this patch from your series.
>
> Regards,
>
> Hans
>

Got it. I have dropped it.

--
BR,
Kate

>
>
> >>>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> >>>> ---
> >>>>  drivers/platform/x86/Kconfig                       |  8 --------
> >>>>  drivers/platform/x86/Makefile                      |  2 +-
> >>>>  drivers/platform/x86/intel/Kconfig                 |  1 +
> >>>>  drivers/platform/x86/intel/Makefile                |  2 ++
> >>>>  drivers/platform/x86/intel/menlow/Kconfig          | 14
> >>>> ++++++++++++++
> >>>>  drivers/platform/x86/intel/menlow/Makefile         |  6 ++++++
> >>>>  .../platform/x86/{ => intel/menlow}/intel_menlow.c |  0
> >>>>  7 files changed, 24 insertions(+), 9 deletions(-)
> >>>>  create mode 100644 drivers/platform/x86/intel/menlow/Kconfig
> >>>>  create mode 100644 drivers/platform/x86/intel/menlow/Makefile
> >>>>  rename drivers/platform/x86/{ => intel/menlow}/intel_menlow.c
> >>>> (100%)
> >>>>
> >>>> diff --git a/drivers/platform/x86/Kconfig
> >>>> b/drivers/platform/x86/Kconfig
> >>>> index b9c0d2d97793..50ded236a841 100644
> >>>> --- a/drivers/platform/x86/Kconfig
> >>>> +++ b/drivers/platform/x86/Kconfig
> >>>> @@ -632,15 +632,7 @@ config THINKPAD_LMI
> >>>>
> >>>>  source "drivers/platform/x86/intel/Kconfig"
> >>>>
> >>>> -config INTEL_MENLOW
> >>>> -       tristate "Thermal Management driver for Intel menlow
> >>>> platform"
> >>>> -       depends on ACPI_THERMAL
> >>>> -       select THERMAL
> >>>> -       help
> >>>> -         ACPI thermal management enhancement driver on
> >>>> -         Intel Menlow platform.
> >>>>
> >>>> -         If unsure, say N.
> >>>>
> >>>>  config INTEL_OAKTRAIL
> >>>>         tristate "Intel Oaktrail Platform Extras"
> >>>> diff --git a/drivers/platform/x86/Makefile
> >>>> b/drivers/platform/x86/Makefile
> >>>> index f4c6ced59da1..ea5f5dd3f78a 100644
> >>>> --- a/drivers/platform/x86/Makefile
> >>>> +++ b/drivers/platform/x86/Makefile
> >>>> @@ -67,7 +67,7 @@ obj-$(CONFIG_THINKPAD_LMI)    += think-lmi.o
> >>>>  obj-$(CONFIG_X86_PLATFORM_DRIVERS_INTEL)               += intel/
> >>>>
> >>>>
> >>>> -obj-$(CONFIG_INTEL_MENLOW)             += intel_menlow.o
> >>>> +
> >>>>  obj-$(CONFIG_INTEL_OAKTRAIL)           += intel_oaktrail.o
> >>>>  obj-$(CONFIG_INTEL_VBTN)               += intel-vbtn.o
> >>>>
> >>>> diff --git a/drivers/platform/x86/intel/Kconfig
> >>>> b/drivers/platform/x86/intel/Kconfig
> >>>> index 4efb5ad3e3e1..59c9b602c784 100644
> >>>> --- a/drivers/platform/x86/intel/Kconfig
> >>>> +++ b/drivers/platform/x86/intel/Kconfig
> >>>> @@ -36,6 +36,7 @@ source
> >>>> "drivers/platform/x86/intel/intel_speed_select_if/Kconfig"
> >>>>  source "drivers/platform/x86/intel/turbo_max_3/Kconfig"
> >>>>  source "drivers/platform/x86/intel/uncore_freq/Kconfig"
> >>>>  source "drivers/platform/x86/intel/int0002/Kconfig"
> >>>> +source "drivers/platform/x86/intel/menlow/Kconfig"
> >>>>
> >>>>
> >>>>  endif # X86_PLATFORM_DRIVERS_INTEL
> >>>> diff --git a/drivers/platform/x86/intel/Makefile
> >>>> b/drivers/platform/x86/intel/Makefile
> >>>> index fe5058c3af18..b2326554bd84 100644
> >>>> --- a/drivers/platform/x86/intel/Makefile
> >>>> +++ b/drivers/platform/x86/intel/Makefile
> >>>> @@ -12,6 +12,7 @@ obj-$(CONFIG_INTEL_HID_EVENT)         += hid/
> >>>>  obj-$(CONFIG_INTEL_WMI_SBL_FW_UPDATE)  += wmi/
> >>>>  obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)    += wmi/
> >>>>  obj-$(CONFIG_INTEL_INT0002_VGPIO)      += int0002/
> >>>> +obj-$(CONFIG_INTEL_MENLOW)             += menlow/
> >>>>
> >>>>
> >>>>  # Intel PMIC / PMC / P-Unit devices
> >>>> @@ -38,3 +39,4 @@ obj-
> >>>> $(CONFIG_INTEL_SPEED_SELECT_INTERFACE)    +=
> >>>> intel_speed_select_if/
> >>>>  obj-$(CONFIG_INTEL_TURBO_MAX_3)                        +=
> >>>> turbo_max_3/
> >>>>  obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)                +=
> >>>> uncore_freq/
> >>>>
> >>>> +
> >>>> diff --git a/drivers/platform/x86/intel/menlow/Kconfig
> >>>> b/drivers/platform/x86/intel/menlow/Kconfig
> >>>> new file mode 100644
> >>>> index 000000000000..b2920d259ff7
> >>>> --- /dev/null
> >>>> +++ b/drivers/platform/x86/intel/menlow/Kconfig
> >>>> @@ -0,0 +1,14 @@
> >>>> +# SPDX-License-Identifier: GPL-2.0-only
> >>>> +#
> >>>> +# Intel x86 Platform Specific Drivers
> >>>> +#
> >>>> +
> >>>> +config INTEL_MENLOW
> >>>> +       tristate "Thermal Management driver for Intel menlow
> >>>> platform"
> >>>> +       depends on ACPI_THERMAL
> >>>> +       select THERMAL
> >>>> +       help
> >>>> +         ACPI thermal management enhancement driver on
> >>>> +         Intel Menlow platform.
> >>>> +
> >>>> +         If unsure, say N.
> >>>> diff --git a/drivers/platform/x86/intel/menlow/Makefile
> >>>> b/drivers/platform/x86/intel/menlow/Makefile
> >>>> new file mode 100644
> >>>> index 000000000000..0e9fda9bff98
> >>>> --- /dev/null
> >>>> +++ b/drivers/platform/x86/intel/menlow/Makefile
> >>>> @@ -0,0 +1,6 @@
> >>>> +# SPDX-License-Identifier: GPL-2.0-only
> >>>> +#
> >>>> +# Intel x86 Platform Specific Drivers
> >>>> +#
> >>>> +
> >>>> +obj-$(CONFIG_INTEL_MENLOW)             += intel_menlow.o
> >>>> diff --git a/drivers/platform/x86/intel_menlow.c
> >>>> b/drivers/platform/x86/intel/menlow/intel_menlow.c
> >>>> similarity index 100%
> >>>> rename from drivers/platform/x86/intel_menlow.c
> >>>> rename to drivers/platform/x86/intel/menlow/intel_menlow.c
> >>>>
> >>>
> >>>
> >>
> >
>

