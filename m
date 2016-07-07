From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel-vbtn: new driver for Intel Virtual Button
Date: Thu, 7 Jul 2016 15:01:42 -0700
Message-ID: <20160707220142.GA3927@f23x64.localdomain>
References: <1467337909-20985-1-git-send-email-acelan.kao@canonical.com>
 <20160701214952.GF60048@f23x64.localdomain>
 <CAMz9Wg9JpS7zdNQZ=Z-mO12Mtz8N-rX-GpWbuF3+ZtDHkiT=bQ@mail.gmail.com>
 <20160706195824.GB66341@f23x64.localdomain>
 <CAFv23Qmtz+HcpuWtmhBB+7gMhEBaWWDqzFNmzGmbuntBzE79FA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40108 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751926AbcGGWBp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jul 2016 18:01:45 -0400
Content-Disposition: inline
In-Reply-To: <CAFv23Qmtz+HcpuWtmhBB+7gMhEBaWWDqzFNmzGmbuntBzE79FA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On Thu, Jul 07, 2016 at 10:15:38AM +0800, AceLan Kao wrote:
> Hi Darren,
> 
> I reply your questions in-line.
> 
> 2016-07-07 3:58 GMT+08:00 Darren Hart <dvhart@infradead.org>:
> > On Mon, Jul 04, 2016 at 09:25:06AM +0800, AceLan Kao wrote:
> >> Hi Darren,
> >>
> >>
> >> This is the DSDT table from my machine,
> >> and this is the first time we have the machine which enabled virtual
> >> button feature.
> >>
> >> I've granted the permission to upstream the driver,
> >> our contact window is Zhang, Xiong Y from Intel.
> >
> > Thanks AceLan,
> >
> > A few questions.
> >
> > Which specific Dell XPS 13 are you using? Which model is reported via dmidecode?
> >
> > Which firmware version is it (also dmidecode)?
> For the above 2 questions, this is the latest model we are working on,
> and for the sake of confidential, I can't reveal its model name and/or
> other info to the public.
> 

I see, that might explain why it isn't present in the DSDT on my Skylake XPS 13.

> >
> > Your DSDT suggests the INT33D6 is only advertised to the OS if the OSYS variable
> > is >= 0x7DD, the value for "Windows 2013" set in _INI. Are you passing acpi_osi=
> > to the Linux kernel?
> No, we don't pass acpi_osi on most of our projects.
> 
> >
> > Given the similarities of this driver and the intel-hid driver, I wonder if
> > there is a possibility to augment the intel-hid driver to support this one
> > additional hotkey?. There are two ACPI object eval calls we would have to
> > special case and also decide how to deal with the suspend/resume handling
> > intel-hid employs, but otherwise, these drivers appear to do the same exact
> > thing.
> >
> > Rafael, we have a number of drivers in this subsystem which match on multiple
> > ACPI IDs. Any general guidance on the preference for one driver per HID versus
> > killing all the boilerplate and special casing a couple of things in a single
> > driver for two or more HIDs?
> >
> > Alex, AceLan, what was your motivation to do this as a new driver rather than
> > augmenting intel-hid?
> Yes, intel-vbtn and intel-hid do almost the same thing, but intel-vbtn
> use event code
> passed from notification handler to do his job
> (no need to use ACPI function to retrieve the event value),
> and the event code conflicts with the usage in intel-hid.
> ex. event code = 0xc0 in intel-vbtn is power button has been pressed,
>                      in intel-hid is used to checking the valid event
> And I believe we'll need a sysfs interface for user to configure the
> keyevent report by intel-vbtn,
> on tablet/phone, we will want to suspend directly while pressing the
> power button,
> and on laptop, we just need it behaves as a traditional power button.
> It's more clean/simple to have a standalone driver to handle this.
> 

Thanks for the clarification. I've queued this patch to testing for 4.8.

-- 
Darren Hart
Intel Open Source Technology Center
