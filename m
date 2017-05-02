From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 01/10] platform/x86: fujitsu-laptop: introduce fext_*()
 helper functions
Date: Tue, 2 May 2017 15:24:02 +0200
Message-ID: <20170502132402.GB6808@ozzy.nask.waw.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <20170424133334.7064-2-kernel@kempniu.pl>
 <20170501131315.GB25546@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:37805 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbdEBNYG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 May 2017 09:24:06 -0400
Received: by mail-wm0-f41.google.com with SMTP id m123so19958340wma.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 May 2017 06:24:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170501131315.GB25546@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> > @@ -272,9 +292,9 @@ static int bl_get_brightness(struct backlight_device *b)
> >  static int bl_update_status(struct backlight_device *b)
> >  {
> >  	if (b->props.power == FB_BLANK_POWERDOWN)
> > -		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
> > +		fext_backlight(0x1, 0x4, 0x3);
> >  	else
> > -		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
> > +		fext_backlight(0x1, 0x4, 0x0);
> >  
> >  	return set_lcd_level(b->props.brightness);
> >  }
> > @@ -610,22 +630,22 @@ static int logolamp_set(struct led_classdev *cdev,
> >  	if (brightness < LED_FULL)
> >  		always = FUNC_LED_OFF;
> >  
> > -	ret = call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, poweron);
> > +	ret = fext_leds(0x1, LOGOLAMP_POWERON, poweron);
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, always);
> > +	return fext_leds(0x1, LOGOLAMP_ALWAYS, always);
> >  }
> 
> I've only just noticed this.  For the led calls we have symbolic identifiers
> defined for the "features" parameter, but in the backlight case we are still
> using arbitrary numeric constants.  Although not necessary for this patch
> set, we should consider adding feature identifiers for the other fext_*() calls.
> Similarly for the "op" parameter where it makes sense to do so.

Good point, I will keep that in mind for the next patch series.

-- 
Best regards,
Michał Kępień
