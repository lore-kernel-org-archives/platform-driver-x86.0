From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/2] Telemetry: remove redundant macro definition
Date: Mon, 24 Jul 2017 12:24:32 +0300
Message-ID: <CAHp75VdV8o9-adsf7tpSs9BtYe8=MH2yHyQVbskbKm9_2q8XBA@mail.gmail.com>
References: <1500560474-24268-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <1500560474-24268-2-git-send-email-rajneesh.bhardwaj@intel.com>
 <5F7315E704FA0841B5DFCE90329B2BB462E90E8A@BGSMSX102.gar.corp.intel.com> <20170721230243.GA7888@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:33595 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751403AbdGXJYd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Jul 2017 05:24:33 -0400
In-Reply-To: <20170721230243.GA7888@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>, "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "andy@infradead.org" <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Murthy, Shanth" <shanth.murthy@intel.com>

On Sat, Jul 22, 2017 at 2:02 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Fri, Jul 21, 2017 at 03:29:39AM +0000, Chakravarty, Souvik K wrote:
>> Just missed the email from Darren.
>
> :-)
>
>> Reviewed-by: Souvik K Chakravarty <souvik.k.chakravarty@intel.com>
>
> Thank you Souvik.
>
> While these one liners are OK for trivial changes like this, please note that
> Andy and I depend on individual driver maintainers to provide thorough reviews,
> and it helps to document that review to help us understand what sorts of things
> you considered before approving the patch. Please keep this in mind in the
> future for more complex changes.
>
> This set is on Andy's queue, so the final review/follow-up will come from him.
>

Pushed both to testing, thanks!

> Thanks,
>
>>
>> > -----Original Message-----
>> > From: Chakravarty, Souvik K
>> > Sent: Friday, July 21, 2017 8:45 AM
>> > To: 'Rajneesh Bhardwaj' <rajneesh.bhardwaj@intel.com>; platform-driver-
>> > x86@vger.kernel.org
>> > Cc: dvhart@infradead.org; andy@infradead.org; linux-
>> > kernel@vger.kernel.org; Murthy, Shanth <shanth.murthy@intel.com>;
>> > Bhardwaj, Rajneesh <rajneesh.bhardwaj@intel.com>
>> > Subject: RE: [PATCH v2 2/2] Telemetry: remove redundant macro definition
>> >
>> > Both set of two looks good. +1.
>> >
>> > > -----Original Message-----
>> > > From: platform-driver-x86-owner@vger.kernel.org
>> > > [mailto:platform-driver- x86-owner@vger.kernel.org] On Behalf Of
>> > > Rajneesh Bhardwaj
>> > > Sent: Thursday, July 20, 2017 7:51 PM
>> > > To: platform-driver-x86@vger.kernel.org
>> > > Cc: dvhart@infradead.org; andy@infradead.org; linux-
>> > > kernel@vger.kernel.org; Murthy, Shanth <shanth.murthy@intel.com>;
>> > > Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>; Bhardwaj,
>> > > Rajneesh <rajneesh.bhardwaj@intel.com>
>> > > Subject: [PATCH v2 2/2] Telemetry: remove redundant macro definition
>> > >
>> > > Telemetry driver includes intel_telemetry.h which defines
>> > > TELEM_MAX_OS_ALLOCATED_EVENTS already.
>> > >
>> > > Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
>> > > ---
>> > >  drivers/platform/x86/intel_telemetry_pltdrv.c | 1 -
>> > >  1 file changed, 1 deletion(-)
>> > >
>> > > diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c
>> > > b/drivers/platform/x86/intel_telemetry_pltdrv.c
>> > > index 6393b3b1d5a6..e0424d5a795a 100644
>> > > --- a/drivers/platform/x86/intel_telemetry_pltdrv.c
>> > > +++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
>> > > @@ -46,7 +46,6 @@
>> > >  #define TELEM_SAMPLING_DEFAULT_PERIOD    0xD
>> > >
>> > >  #define TELEM_MAX_EVENTS_SRAM            28
>> > > -#define TELEM_MAX_OS_ALLOCATED_EVENTS    20
>> > >  #define TELEM_SSRAM_STARTTIME_OFFSET     8
>> > >  #define TELEM_SSRAM_EVTLOG_OFFSET        16
>> > >
>> > > --
>> > > 2.7.4
>>
>>
>
> --
> Darren Hart
> VMware Open Source Technology Center



-- 
With Best Regards,
Andy Shevchenko
