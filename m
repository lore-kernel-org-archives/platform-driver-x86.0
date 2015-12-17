From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel-hid: new hid event driver for hotkeys
Date: Thu, 17 Dec 2015 15:01:07 -0800
Message-ID: <20151217230107.GB23048@malice.jf.intel.com>
References: <1450337402-4178-1-git-send-email-alex.hung@canonical.com>
 <20151217221553.GA23048@malice.jf.intel.com>
 <CALCETrUoEyVKxcUJU76=5yZzCuihxtFJsxu2vAUxLr38cR+e2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:46238 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751273AbbLQXBI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 Dec 2015 18:01:08 -0500
Content-Disposition: inline
In-Reply-To: <CALCETrUoEyVKxcUJU76=5yZzCuihxtFJsxu2vAUxLr38cR+e2Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org

On Thu, Dec 17, 2015 at 02:50:39PM -0800, Andy Lutomirski wrote:
> On Thu, Dec 17, 2015 at 2:15 PM, Darren Hart <dvhart@infradead.org> wrote:
> > On Thu, Dec 17, 2015 at 03:30:02PM +0800, Alex Hung wrote:
> >> This driver supports various hid events including hotkeys.
> >> Dell XPS 13 9350 requires it for wireless hotkey.
> >>
> >> Andy Lutomirski contributed greatly to this driver.
> >>
> >> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> >
> > Queued for testing.
> >
> > Andy, please provide your Reviewed-by if you're happy with it.
> 
> Reviewed-and-tested-by: Andy Lutomirski <luto@kernel.org>
> 
> Minor nits, though:
> 
> +        This driver provides supports for Intel HID event. Some laptops
> +        require this driver for hotkey supports.
> 
> Should that be "This driver provides support for the Intel HID Event
> hotkey interface.  Some laptops require this driver for hotkey
> support."?
> 
> Also, can we remove the word "Filter" a couple lines up in the Kconfig
> file?  I'd guess the the Windows equivalent is a "filter' driver in
> the Windows model, but it's not logically filtering anything, and
> there's nothing filter-like about the Linux driver.
> 
> (I think it's slightly sad that HID is in the name, too, but that's
> indeed what it seems to be called.)

These are minor, but I had similar thoughts. I'd be happy to see these included
and respun.

> 
> >
> > Alex, just one question maybe you can answer quickly and save me some time
> > below:
> >
> >
> >> +static int intel_hid_pl_suspend_handler(struct device *device)
> >> +{
> >> +     intel_hid_set_enable(device, 0);
> >> +     return 0;
> >> +}
> >> +
> >> +static int intel_hid_pl_resume_handler(struct device *device)
> >> +{
> >> +     intel_hid_set_enable(device, 1);
> >> +     return 0;
> >> +}
> >
> > Why not propagate the intel_hid_set_enable() return code? Is it because it just
> > doesn't really impact suspend/resume, even if we do get an error?
> 
> That was me, actually.  I definitely don't want to cause suspect to
> fail if the ACPI call fails.  At worst we'll report a spurious key
> event when we resume.
> 

OK, thanks for the clarification (reminder :-)

-- 
Darren Hart
Intel Open Source Technology Center
