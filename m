From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] apple-gmux: Add suspend/resume support for the backlight
Date: Thu, 10 May 2012 09:23:20 -0700
Message-ID: <20120510162320.GA32040@ubuntu-mba>
References: <1334850935-6659-1-git-send-email-seth.forshee@canonical.com>
 <1336666012.27520.159.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:53237 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751386Ab2EJQXa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 May 2012 12:23:30 -0400
Content-Disposition: inline
In-Reply-To: <1336666012.27520.159.camel@shinybook.infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

On Thu, May 10, 2012 at 09:06:52AM -0700, David Woodhouse wrote:
> On Thu, 2012-04-19 at 10:55 -0500, Seth Forshee wrote:
> > --- a/drivers/platform/x86/apple-gmux.c
> > +++ b/drivers/platform/x86/apple-gmux.c
> > @@ -87,6 +87,9 @@ static int gmux_update_status(struct backlight_device *bd)
> >         struct apple_gmux_data *gmux_data = bl_get_data(bd);
> >         u32 brightness = bd->props.brightness;
> >  
> > +       if (bd->props.state & BL_CORE_SUSPENDED)
> > +               brightness = 0;
> > +
> >         /*
> >          * Older gmux versions require writing out lower bytes first then
> >          * setting the upper byte to 0 to flush the values. Newer versions
> 
> Is this part necessary? It's about to be turned off *anyway*, and
> turning it off sooner will achieve little other than to make it harder
> to debug suspend failures, surely?

No, I suppose it isn't strictly necessary. I added it to avoid having
the backlight turned off when the lid is closed and then turned back on
while suspending.

Seth
