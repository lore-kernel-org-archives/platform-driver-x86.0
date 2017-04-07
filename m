From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2 03/11] platform/x86: fujitsu-laptop: merge
 set_lcd_level_alt() into set_lcd_level()
Date: Fri, 7 Apr 2017 21:33:35 +0930
Message-ID: <20170407120335.GC15240@marvin.atrad.com.au>
References: <20170405064910.3162-1-kernel@kempniu.pl>
 <20170405064910.3162-4-kernel@kempniu.pl>
 <20170407115347.GB15240@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:37002 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932938AbdDGMEJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2017 08:04:09 -0400
Content-Disposition: inline
In-Reply-To: <20170407115347.GB15240@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 07, 2017 at 09:23:47PM +0930, I wrote:
> On Wed, Apr 05, 2017 at 08:49:02AM +0200, Micha?? K??pie?? wrote:
> > diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> > index 59107a599d22..2f563aa00592 100644
> > --- a/drivers/platform/x86/fujitsu-laptop.c
> > +++ b/drivers/platform/x86/fujitsu-laptop.c
> > @@ -360,41 +360,26 @@ static int set_lcd_level(int level)
> >  {
> >  	acpi_status status = AE_OK;
> >  	acpi_handle handle = NULL;
> > -
> > -	vdbg_printk(FUJLAPTOP_DBG_TRACE, "set lcd level via SBLL [%d]\n",
> > -		    level);
> > -
> > -	if (level < 0 || level >= fujitsu_bl->max_brightness)
> > -		return -EINVAL;
> > -
> > -	status = acpi_get_handle(fujitsu_bl->acpi_handle, "SBLL", &handle);
> > -	if (ACPI_FAILURE(status)) {
> > -		vdbg_printk(FUJLAPTOP_DBG_ERROR, "SBLL not present\n");
> > -		return -ENODEV;
> > +	char *method;
> > +
> > +	switch (use_alt_lcd_levels) {
> > +	case 1:
> > +		method = "SBL2";
> > +		break;
> > +	default:
> > +		method = "SBLL";
> > +		break;
> >  	}
> 
> This is not necessary something actionable, but I am wondering about the
> rationale of using a switch statement here given that there really are only
> two options.  In my mind at least a simple "if" clause would be clearer and
> easier to read (with or without the braces):
> 
>   if (use_alt_lcd_levels) {
>           method = "SBL2";
>   } else {
>           method = "SBLL";
>   }

Ah, the reason for the use of the switch was to prepare the way for patch 
06/11 which adds an autodetection value to the definition of
use_alt_lcd_levels.  All good.

Regards
  jonathan
