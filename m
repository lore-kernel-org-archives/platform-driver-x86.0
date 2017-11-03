From: Guillaume =?utf-8?Q?Dou=C3=A9zan-Grard?= <gdouezangrard@gmail.com>
Subject: Re: [PATCH v2 4/4] platform/x86: topstar-laptop: add optional WLAN
 LED workaround
Date: Fri, 3 Nov 2017 16:07:35 +0100
Message-ID: <20171103150735.GA13165@localhost>
References: <cover.1509229280.git.gdouezangrard@gmail.com>
 <4bfdea8bba83cd8f7fcdfdeee283f24574e4866d.1509229280.git.gdouezangrard@gmail.com>
 <CAHp75VdN2PDDKsAM8qp1ssZB+K_zgwvJBKK7UEVvsSHV_cK73g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:47201 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750707AbdKCPHn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2017 11:07:43 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VdN2PDDKsAM8qp1ssZB+K_zgwvJBKK7UEVvsSHV_cK73g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Nov 03, 2017 at 02:50:52PM +0200, Andy Shevchenko wrote:
> On Sun, Oct 29, 2017 at 1:53 AM, Guillaume Douézan-Grard
> <gdouezangrard@gmail.com> wrote:
> > Topstar U931 laptops provide an LED synced with the WLAN adapter
> > hard-blocking state. Unfortunately, some models seem to be defective,
> > making impossible to hard-block the adapter with the WLAN switch and
> > thus the LED is useless.
> >
> > An ACPI method is available to programmatically control this switch and
> > it indirectly allows to control the LED.
> >
> > This commit registers the LED within the corresponding subsystem, making
> > possible for instance to use an rfkill-based trigger to synchronize the
> > LED with the soft-blocking state.
> >
> > This feature is disabled by default and can be enabled with the
> > `led_workaround` module parameter.
> 
> >  #include <linux/platform_device.h>
> >  #include <linux/input.h>
> >  #include <linux/input/sparse-keymap.h>
> > +#include <linux/leds.h>
> 
> Yep, exact place, esp. after moving platform_device to the right place.
> 
> > +static bool led_workaround;
> > +module_param_named(led_workaround, led_workaround, bool, 0444);
> > +MODULE_PARM_DESC(led_workaround,
> > +               "Enables software-based WLAN LED control on systems with defective hardware switch");
> 
> So, this is most problematic piece in the series.
> 
> We are not encouraging module parameters. Why do we need one? Can't be
> detected automatically (perhaps based on DMI strings)?

Darren told me that. I tried to answer this question in the cover letter:

"These are barebone laptops, sold under quite a lot of brands and
configurations, with different firmwares and so on. I can only say for sure
that this issue is present for all the models sold under a specific brand,
that's why I'm reluctant to enable this by default with a DMI check."

In my case for instance, the DMI info has not been filled in by the retailler
since I only have the ODM base board information to identify a model.

> -- 
> With Best Regards,
> Andy Shevchenko

For now, I will prepare a new version containing the other needed changes you
pointed at for the other patches.

Thanks for your time,
