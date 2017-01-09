From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2 2/2] platform/x86: fujitsu-laptop: simplify
 logolamp_get()
Date: Tue, 10 Jan 2017 00:05:57 +1030
Message-ID: <20170109133557.GB31198@marvin.atrad.com.au>
References: <20170109131417.9677-1-kernel@kempniu.pl>
 <20170109131417.9677-2-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170109131417.9677-2-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 09, 2017 at 02:14:17PM +0100, Micha?? K??pie?? wrote:
> Now that call_fext_func() is invoked by logolamp_set() for both
> LOGOLAMP_POWERON and LOGOLAMP_ALWAYS for every brightness value,
> logolamp_get() can be simplified to decrease indentation and number of
> local variables.
> 
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>

Seems sensible to me.

Acked-by: Jonathan Woithe <jwoithe@just42.net>

> ---
> Changes from v1:
> 
>   - This patch was not present in v1.
>     
> One thing worth noting is that in case call_fext_func() returns an
> error, logolamp_get() will still return LED_OFF, just like the original
> version.
> 
>  drivers/platform/x86/fujitsu-laptop.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 34b8481fb0ed..7fa082558a42 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -319,17 +319,17 @@ static int eco_led_set(struct led_classdev *cdev,
>  
>  static enum led_brightness logolamp_get(struct led_classdev *cdev)
>  {
> -	enum led_brightness brightness = LED_OFF;
> -	int poweron, always;
> -
> -	poweron = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_POWERON, 0x0);
> -	if (poweron == FUNC_LED_ON) {
> -		brightness = LED_HALF;
> -		always = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_ALWAYS, 0x0);
> -		if (always == FUNC_LED_ON)
> -			brightness = LED_FULL;
> -	}
> -	return brightness;
> +	int ret;
> +
> +	ret = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_ALWAYS, 0x0);
> +	if (ret == FUNC_LED_ON)
> +		return LED_FULL;
> +
> +	ret = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_POWERON, 0x0);
> +	if (ret == FUNC_LED_ON)
> +		return LED_HALF;
> +
> +	return LED_OFF;
>  }
>  
>  static enum led_brightness kblamps_get(struct led_classdev *cdev)
> -- 
> 2.11.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
