From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v3 1/4] platform/x86: fujitsu-laptop: register backlight
 device in a separate function
Date: Fri, 10 Mar 2017 21:12:10 +1030
Message-ID: <20170310104210.GB21396@marvin.atrad.com.au>
References: <20170307101516.9852-1-kernel@kempniu.pl>
 <20170307101516.9852-2-kernel@kempniu.pl>
 <20170310090849.GA13521@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:40050 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935105AbdCJKmq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2017 05:42:46 -0500
Content-Disposition: inline
In-Reply-To: <20170310090849.GA13521@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michael

On Fri, Mar 10, 2017 at 10:08:49AM +0100, Micha?? K??pie?? wrote:
> > Move code responsible for backlight device registration to a separate
> > function in order to simplify error handling and decrease indentation.
> > Simplify initialization of struct backlight_properties.  Use
> > KBUILD_MODNAME as device name to avoid repeating the same string literal
> > throughout the module.
> > 
> > Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> > ---
> >  drivers/platform/x86/fujitsu-laptop.c | 38 ++++++++++++++++++++---------------
> >  1 file changed, 22 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> > index e12cc3504d48..185c929898d9 100644
> > --- a/drivers/platform/x86/fujitsu-laptop.c
> > +++ b/drivers/platform/x86/fujitsu-laptop.c
> > @@ -685,6 +685,25 @@ static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
> >  
> >  /* ACPI device for LCD brightness control */
> >  
> > +static int fujitsu_backlight_register(void)
> > +{
> > +	struct backlight_properties props = {
> > +		.brightness = fujitsu_bl->brightness_level,
> > +		.max_brightness = fujitsu_bl->max_brightness - 1,
> > +		.type = BACKLIGHT_PLATFORM
> > +	};
> > +	struct backlight_device *bd;
> > +
> > +	bd = backlight_device_register(KBUILD_MODNAME, NULL, NULL,
> > +				       &fujitsu_bl_ops, &props);
> 
> I have only just now noticed that this effectively breaks userspace
> interface as KBUILD_MODNAME is "fujitsu_laptop" while the previously
> used device name was "fujitsu-laptop" (underscore vs. hyphen).

Ah yes, I noticed that too, as you see from the review I just sent through. 
Sorry, I didn't see the above post until after I'd sent the review in.  It's
no big deal though.

> Jonathan, as this series is already long overdue, I suggest the
> following course of action: please review these patches anyway and if
> you find no other issues, please provide your Reviewed-by etc. as you
> normally would.  Once you do that, I will post v4 which will use
> "fujitsu-laptop" for backlight device name and will contain your v3
> review tags.  Does that sound reasonable?

As per my review comments, I am happy with the patch series so long as the
backlight device name reverts to "fujitsu-laptop".  Your suggested course of
action sounds fine to me.  Alternatively, I could quickly and easily add
tags to a v4 post if that is seen to be more appropriate by Darren/Andy. 
I'm easy either way.

Regards
  jonathan
