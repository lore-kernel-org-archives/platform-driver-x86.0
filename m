From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/2] hp-wmi: Fix detection for dock and tablet mode
Date: Thu, 13 Apr 2017 16:07:49 -0700
Message-ID: <20170413230749.GA11189@fury>
References: <20170409135608.15621-1-carlo@caione.org>
 <20170409135608.15621-3-carlo@caione.org>
 <20170413182150.GI2064@fury>
 <CAL9uMOG_3Ov6+bgDoHWYUgSKG9YbXs-vk0XsnOYAt+rDV48e7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:52019 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751657AbdDMXHw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 Apr 2017 19:07:52 -0400
Content-Disposition: inline
In-Reply-To: <CAL9uMOG_3Ov6+bgDoHWYUgSKG9YbXs-vk0XsnOYAt+rDV48e7w@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlo Caione <carlo@endlessm.com>
Cc: Carlo Caione <carlo@caione.org>, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Linux Upstreaming Team <linux@endlessm.com>

On Thu, Apr 13, 2017 at 10:09:43PM +0200, Carlo Caione wrote:
> On Thu, Apr 13, 2017 at 8:21 PM, Darren Hart <dvhart@infradead.org> wrote:
> > On Sun, Apr 09, 2017 at 03:56:08PM +0200, Carlo Caione wrote:
> >> From: Carlo Caione <carlo@endlessm.com>
> 
> /cut
> >> @@ -644,6 +646,7 @@ static int __init hp_wmi_input_setup(void)
> >>  {
> >>       acpi_status status;
> >>       int err;
> >> +     int val;
> >>
> >>       hp_wmi_input_dev = input_allocate_device();
> >>       if (!hp_wmi_input_dev)
> >> @@ -654,17 +657,26 @@ static int __init hp_wmi_input_setup(void)
> >>       hp_wmi_input_dev->id.bustype = BUS_HOST;
> >>
> >>       __set_bit(EV_SW, hp_wmi_input_dev->evbit);
> >> -     __set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
> >> -     __set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
> >> +
> >> +     /* Dock */
> >> +     val = hp_wmi_dock_state();
> >> +     if (!(val < 0)) {
> >> +             __set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
> >> +             input_report_switch(hp_wmi_input_dev, SW_DOCK, val);
> >> +     }
> >
> > In general, these are fine and can go in. I did want to get your opinion on one
> > thought though.
> >
> > This adds some complexity to deal with what appears to be an unknown failure
> > mode (the query fails, we don't know why, so we don't set the bit on the input
> > dev for that feature). Since we don't know why it fails, can we be confident it
> > will always fail?
> 
> That's not exactly true, at least for the firmware I have on the
> laptop I'm working on.
> 
> For this hardware (can we assume for all the HP models?) when the WMI
> calls returns the value of 0x04, that means that the query
> (HPWMI_HARDWARE_QUERY in this case) is not implemented at all in the
> SSDT.
> In general reading the disassembled AML code when the WMI query fails
> and returns a positive value this can be:
> - 0x04: Query ID is unknown / not implemented but valid
> - 0x02: Wrong signature
> - 0x05: Wrong / invalid query number (?)
> 
> The problem here is that: (1) this is my personal interpretation of
> the AML code obtained by disassembling the SSDT and (2) we cannot be
> sure that this is the same on all the HP firmwares around.
> For sure in general in all the cases I extracted from the SSDT table
> on this hardware if the call failed the first time all the chances are
> that it is going to fail also in the future.
> 
> In [1] is the SSDT table, the WMI method is WMAA if you want to check
> my interpretation.
> 
> > Could it succeed at init here, but then fail later and leave
> > us in the same situation we are in now?
> 
> I think that this is really unlikely
> 
> > If so, have you considered just returning 0 on error and using a WARN_ONCE print
> > statement to report the error? This would simplify a lot of this logic that
> > you're adding in here to handle something we could just report and ignore.
> 
> Yes, I thought to report just 0 but in that case we are advertising to
> userspace fake capabilities for the hardware, like dockability or
> laptop mode that in most cases are not even implemented on the
> hardware (like on this laptop).

OK, I'm convinced that this approach is correct.

> 
> > That being said, your version avoids the input_report_switch() in the event of a
> > failure at init. In practice, I don't know if this is worth the added
> > complexity.
> >
> > Your thoughts?
> 
> AFAICT we can fail in hp_wmi_perform_query (as written in the comment
> to the function):
> 1) with -EINVAL if the query was not successful or the output buffer
> size exceeds buffersize. In this case I don't see how the next calls
> could be successful.


EINVAL is being used to broadly here. If the input values are incorrect, then
yes -EINVAL is the right response. However, if the query was unsuccessful, that
is more appropriately -EIO.

If the handle/method doesn't exist, that would be -ENXIO.

However, your changes make the driver self-consistent and I'll apply them as is
to testing.

You, me, or someone could prepare a follow up series to clean this driver up a
bit.

> 2) with a positive error code returned from the WMI method. Given my
> interpretation of this positive code reported before I don't see why
> we should fail only on init and not on all the subsequent calls
> 
> So I'm still convinced that my implementation is correct and that
> probably adding complexity on top is not really worth it. But of
> course this is your call as maintainer :)

Thanks for the additional context.

> 
> Thanks,
> 
> [1] https://paste.fedoraproject.org/paste/bBnqUlazz1tAjKsJKq7NHl5M1UNdIGYhyRLivL9gydE=
> 
> -- 
> Carlo Caione  |  +39.340.80.30.096  |  Endless
> 

-- 
Darren Hart
VMware Open Source Technology Center
