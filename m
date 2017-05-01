From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 01/10] platform/x86: fujitsu-laptop: introduce fext_*()
 helper functions
Date: Mon, 1 May 2017 22:43:15 +0930
Message-ID: <20170501131315.GB25546@marvin.atrad.com.au>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <20170424133334.7064-2-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:59034 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755299AbdEANNu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 May 2017 09:13:50 -0400
Content-Disposition: inline
In-Reply-To: <20170424133334.7064-2-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 24, 2017 at 03:33:25PM +0200, Micha?? K??pie?? wrote:
> Stop invoking call_fext_func() directly to improve code clarity and save
> some horizontal space.  Adjust whitespace to make checkpatch happy.

A comment: this patch in and of itself does not seem to be worthwhile.  In
particular, the saving of horzontal space seems academic.  The value comes
when later patches build on it.

> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/fujitsu-laptop.c | 90 ++++++++++++++++++++---------------
>  1 file changed, 51 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 7f49d92914c9..3f232967af04 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -187,6 +187,26 @@ static int call_fext_func(int func, int op, int feature, int state)
>  	return value;
>  }
>  
> +static int fext_backlight(int op, int feature, int state)
> +{
> +	return call_fext_func(FUNC_BACKLIGHT, op, feature, state);
> +}
> +
> +static int fext_buttons(int op, int feature, int state)
> +{
> +	return call_fext_func(FUNC_BUTTONS, op, feature, state);
> +}
> +
> +static int fext_flags(int op, int feature, int state)
> +{
> +	return call_fext_func(FUNC_FLAGS, op, feature, state);
> +}
> +
> +static int fext_leds(int op, int feature, int state)
> +{
> +	return call_fext_func(FUNC_LEDS, op, feature, state);
> +}
> +
>  /* Hardware access for LCD brightness control */
>  
>  static int set_lcd_level(int level)
> @@ -272,9 +292,9 @@ static int bl_get_brightness(struct backlight_device *b)
>  static int bl_update_status(struct backlight_device *b)
>  {
>  	if (b->props.power == FB_BLANK_POWERDOWN)
> -		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
> +		fext_backlight(0x1, 0x4, 0x3);
>  	else
> -		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
> +		fext_backlight(0x1, 0x4, 0x0);
>  
>  	return set_lcd_level(b->props.brightness);
>  }
> @@ -610,22 +630,22 @@ static int logolamp_set(struct led_classdev *cdev,
>  	if (brightness < LED_FULL)
>  		always = FUNC_LED_OFF;
>  
> -	ret = call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, poweron);
> +	ret = fext_leds(0x1, LOGOLAMP_POWERON, poweron);
>  	if (ret < 0)
>  		return ret;
>  
> -	return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, always);
> +	return fext_leds(0x1, LOGOLAMP_ALWAYS, always);
>  }

I've only just noticed this.  For the led calls we have symbolic identifiers
defined for the "features" parameter, but in the backlight case we are still
using arbitrary numeric constants.  Although not necessary for this patch
set, we should consider adding feature identifiers for the other fext_*() calls.
Similarly for the "op" parameter where it makes sense to do so.

Regards
  jonathan
