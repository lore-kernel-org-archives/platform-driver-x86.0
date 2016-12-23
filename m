From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: use
 brightness_set_blocking for LED-setting callbacks
Date: Sat, 24 Dec 2016 00:17:32 +1030
Message-ID: <20161223134732.GC12369@marvin.atrad.com.au>
References: <20161223090008.10445-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161223090008.10445-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Dec 23, 2016 at 10:00:08AM +0100, Micha?? K??pie?? wrote:
> All LED-setting functions in fujitsu-laptop are currently assigned to
> the brightness_set callback, which is incorrect because they can sleep
> (due to their use of call_fext_func(), which in turn issues ACPI calls)
> and the documentation (in include/linux/leds.h) clearly states they must
> not.  Assign them to brightness_set_blocking instead and change them to
> match the expected function prototype.
> 
> This change makes it possible to use Fujitsu-specific LEDs with "heavy"
> triggers, like disk-activity or phy0rx.
> 
> Fixes: 3a407086090b ("fujitsu-laptop: Add BL power, LED control and radio state information")
> Fixes: 4f62568c1fcf ("fujitsu-laptop: Support radio LED")
> Fixes: d6b88f64b0d4 ("fujitsu-laptop: Add support for eco LED")
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> ---
> Even back in 2.6.29, when the first Fujitsu-specific LED was introduced,
> the brightness_set callback was annotated with the following text: "Must
> not sleep, use a workqueue if needed".  To make things easier for LED
> drivers, the LED core introduced (in 3.19) brightness_set_sync, which
> was later renamed to brightness_set_blocking (in 4.5).  It allows easy
> use of brightness-setting callbacks that may sleep, which is exactly
> what we need here.
> 
> Without this patch, here is a quick way to lock your system up within
> seconds:
> 
>     # echo disk-activity > "/sys/class/leds/fujitsu::radio_led/trigger"
>     # dd if=/dev/sda of=/dev/null bs=1M count=10000
> 
> Applying this patch allowed me to successfully perform the above stress
> test without a visible influence on system stability on a Lifebook E744
> with an SSD.

Great catch.  Yes, we've known about this limitation for a while, and the
inability to use the LEDs with high rate triggers was also noted earlier
this year.  This patch is a welcome development to address that particular
issue.

> Two notes about the patch itself:
> 
>   - As fujitsu-laptop is already at odds with checkpatch rules, I
>     decided to stick with its current coding style so that the
>     functional changes introduced by this patch do not blend with
>     changes related to coding style.

No problem.  I am planning to do a coding style cleanup in the near-ish term
future.  Having a consistent style across the whole file when the time comes
will make this easier.  That is, the above approach is fine in the
circumstances.

>   - In logolamp_set(), returning the result of the second
>     call_fext_func() call as the function return value is obviously
>     pretty arbitrary, but nobody has cared about these return values at
>     all since day one, so I decided to keep this patch simple.  I can
>     submit another one which properly handles call_fext_func() failures
>     in that function, if you think that would be helpful.

I would welcome such a patch if you wish to submit it.  My fujitsu hardware
does not have a logo lamp so I am not in a position to develop or test such
a change, but I agree that it is something we should address.

Since my Fujitsu hardware also lacks LEDs I can't runtime test this patch. 
However, the rationale makes sense and the patch looks sound.

Acked-by: Jonathan Woithe <jwoithe@just42.net>

Thanks for your contribution.

Regards
  jonathan

>  drivers/platform/x86/fujitsu-laptop.c | 42 +++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 61f39abf5dc8..82d67715ce76 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -177,43 +177,43 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event);
>  
>  #if IS_ENABLED(CONFIG_LEDS_CLASS)
>  static enum led_brightness logolamp_get(struct led_classdev *cdev);
> -static void logolamp_set(struct led_classdev *cdev,
> +static int logolamp_set(struct led_classdev *cdev,
>  			       enum led_brightness brightness);
>  
>  static struct led_classdev logolamp_led = {
>   .name = "fujitsu::logolamp",
>   .brightness_get = logolamp_get,
> - .brightness_set = logolamp_set
> + .brightness_set_blocking = logolamp_set
>  };
>  
>  static enum led_brightness kblamps_get(struct led_classdev *cdev);
> -static void kblamps_set(struct led_classdev *cdev,
> +static int kblamps_set(struct led_classdev *cdev,
>  			       enum led_brightness brightness);
>  
>  static struct led_classdev kblamps_led = {
>   .name = "fujitsu::kblamps",
>   .brightness_get = kblamps_get,
> - .brightness_set = kblamps_set
> + .brightness_set_blocking = kblamps_set
>  };
>  
>  static enum led_brightness radio_led_get(struct led_classdev *cdev);
> -static void radio_led_set(struct led_classdev *cdev,
> +static int radio_led_set(struct led_classdev *cdev,
>  			       enum led_brightness brightness);
>  
>  static struct led_classdev radio_led = {
>   .name = "fujitsu::radio_led",
>   .brightness_get = radio_led_get,
> - .brightness_set = radio_led_set
> + .brightness_set_blocking = radio_led_set
>  };
>  
>  static enum led_brightness eco_led_get(struct led_classdev *cdev);
> -static void eco_led_set(struct led_classdev *cdev,
> +static int eco_led_set(struct led_classdev *cdev,
>  			       enum led_brightness brightness);
>  
>  static struct led_classdev eco_led = {
>   .name = "fujitsu::eco_led",
>   .brightness_get = eco_led_get,
> - .brightness_set = eco_led_set
> + .brightness_set_blocking = eco_led_set
>  };
>  #endif
>  
> @@ -267,48 +267,48 @@ static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
>  #if IS_ENABLED(CONFIG_LEDS_CLASS)
>  /* LED class callbacks */
>  
> -static void logolamp_set(struct led_classdev *cdev,
> +static int logolamp_set(struct led_classdev *cdev,
>  			       enum led_brightness brightness)
>  {
>  	if (brightness >= LED_FULL) {
>  		call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, FUNC_LED_ON);
> -		call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, FUNC_LED_ON);
> +		return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, FUNC_LED_ON);
>  	} else if (brightness >= LED_HALF) {
>  		call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, FUNC_LED_ON);
> -		call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, FUNC_LED_OFF);
> +		return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, FUNC_LED_OFF);
>  	} else {
> -		call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, FUNC_LED_OFF);
> +		return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, FUNC_LED_OFF);
>  	}
>  }
>  
> -static void kblamps_set(struct led_classdev *cdev,
> +static int kblamps_set(struct led_classdev *cdev,
>  			       enum led_brightness brightness)
>  {
>  	if (brightness >= LED_FULL)
> -		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_ON);
> +		return call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_ON);
>  	else
> -		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
> +		return call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
>  }
>  
> -static void radio_led_set(struct led_classdev *cdev,
> +static int radio_led_set(struct led_classdev *cdev,
>  				enum led_brightness brightness)
>  {
>  	if (brightness >= LED_FULL)
> -		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, RADIO_LED_ON);
> +		return call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, RADIO_LED_ON);
>  	else
> -		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, 0x0);
> +		return call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, 0x0);
>  }
>  
> -static void eco_led_set(struct led_classdev *cdev,
> +static int eco_led_set(struct led_classdev *cdev,
>  				enum led_brightness brightness)
>  {
>  	int curr;
>  
>  	curr = call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0);
>  	if (brightness >= LED_FULL)
> -		call_fext_func(FUNC_LEDS, 0x1, ECO_LED, curr | ECO_LED_ON);
> +		return call_fext_func(FUNC_LEDS, 0x1, ECO_LED, curr | ECO_LED_ON);
>  	else
> -		call_fext_func(FUNC_LEDS, 0x1, ECO_LED, curr & ~ECO_LED_ON);
> +		return call_fext_func(FUNC_LEDS, 0x1, ECO_LED, curr & ~ECO_LED_ON);
>  }
>  
>  static enum led_brightness logolamp_get(struct led_classdev *cdev)
> -- 
> 2.11.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
