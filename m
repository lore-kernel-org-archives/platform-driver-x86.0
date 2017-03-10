From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v3 1/4] platform/x86: fujitsu-laptop: register backlight
 device in a separate function
Date: Fri, 10 Mar 2017 11:45:24 +0100
Message-ID: <20170310104524.GC13521@ozzy.nask.waw.pl>
References: <20170307101516.9852-1-kernel@kempniu.pl>
 <20170307101516.9852-2-kernel@kempniu.pl>
 <20170310090849.GA13521@ozzy.nask.waw.pl>
 <20170310104210.GB21396@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36221 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934984AbdCJKpe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2017 05:45:34 -0500
Received: by mail-lf0-f68.google.com with SMTP id g70so6535184lfh.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2017 02:45:33 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170310104210.GB21396@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> Hi Michael
> 
> On Fri, Mar 10, 2017 at 10:08:49AM +0100, Micha?? K??pie?? wrote:
> > > Move code responsible for backlight device registration to a separate
> > > function in order to simplify error handling and decrease indentation.
> > > Simplify initialization of struct backlight_properties.  Use
> > > KBUILD_MODNAME as device name to avoid repeating the same string literal
> > > throughout the module.
> > > 
> > > Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> > > ---
> > >  drivers/platform/x86/fujitsu-laptop.c | 38 ++++++++++++++++++++---------------
> > >  1 file changed, 22 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> > > index e12cc3504d48..185c929898d9 100644
> > > --- a/drivers/platform/x86/fujitsu-laptop.c
> > > +++ b/drivers/platform/x86/fujitsu-laptop.c
> > > @@ -685,6 +685,25 @@ static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
> > >  
> > >  /* ACPI device for LCD brightness control */
> > >  
> > > +static int fujitsu_backlight_register(void)
> > > +{
> > > +	struct backlight_properties props = {
> > > +		.brightness = fujitsu_bl->brightness_level,
> > > +		.max_brightness = fujitsu_bl->max_brightness - 1,
> > > +		.type = BACKLIGHT_PLATFORM
> > > +	};
> > > +	struct backlight_device *bd;
> > > +
> > > +	bd = backlight_device_register(KBUILD_MODNAME, NULL, NULL,
> > > +				       &fujitsu_bl_ops, &props);
> > 
> > I have only just now noticed that this effectively breaks userspace
> > interface as KBUILD_MODNAME is "fujitsu_laptop" while the previously
> > used device name was "fujitsu-laptop" (underscore vs. hyphen).
> 
> Ah yes, I noticed that too, as you see from the review I just sent through. 
> Sorry, I didn't see the above post until after I'd sent the review in.  It's
> no big deal though.
> 
> > Jonathan, as this series is already long overdue, I suggest the
> > following course of action: please review these patches anyway and if
> > you find no other issues, please provide your Reviewed-by etc. as you
> > normally would.  Once you do that, I will post v4 which will use
> > "fujitsu-laptop" for backlight device name and will contain your v3
> > review tags.  Does that sound reasonable?
> 
> As per my review comments, I am happy with the patch series so long as the
> backlight device name reverts to "fujitsu-laptop".  Your suggested course of
> action sounds fine to me.  Alternatively, I could quickly and easily add
> tags to a v4 post if that is seen to be more appropriate by Darren/Andy. 
> I'm easy either way.

Sure, we can do it this way as well.  I will post v4 shortly.

-- 
Best regards,
Michał Kępień
