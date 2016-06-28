From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] fujitsu-laptop: Unify max brightness of exported leds
Date: Tue, 28 Jun 2016 10:58:01 -0700
Message-ID: <20160628175801.GG3837@f23x64.localdomain>
References: <20160623175250.GA22215@Matej-PC.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37261 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752133AbcF1R6B (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 13:58:01 -0400
Content-Disposition: inline
In-Reply-To: <20160623175250.GA22215@Matej-PC.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matej Groma <matejgroma@gmail.com>
Cc: jwoithe@just42.net, platform-driver-x86@vger.kernel.org

On Thu, Jun 23, 2016 at 07:52:53PM +0200, Matej Groma wrote:
> Set maximum brightness of leds that can only be turned off or on to 1.

Hi Matej,

Thank you for your patch. Please include all the maintainers and lists reported
by the get_maintainer.pl script.

Also, please provide a complete commit message. For details, see
Documentation/SubmittingPatches, Section 1, 14) The canonical patch format.

> 
> Signed-off-by: Matej Groma <matejgroma@gmail.com>
> ---
> Tested on Lifebook E756.
> 
>  drivers/platform/x86/fujitsu-laptop.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index ce41bc3..5542342 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -199,6 +199,7 @@ static void kblamps_set(struct led_classdev *cdev,
> 
>  static struct led_classdev kblamps_led = {
>   .name = "fujitsu::kblamps",
> + .max_brightness = 1,
>   .brightness_get = kblamps_get,
>   .brightness_set = kblamps_set
>  };
> @@ -209,6 +210,7 @@ static void radio_led_set(struct led_classdev *cdev,
> 
>  static struct led_classdev radio_led = {
>   .name = "fujitsu::radio_led",
> + .max_brightness = 1,
>   .brightness_get = radio_led_get,
>   .brightness_set = radio_led_set
>  };
> @@ -281,7 +283,7 @@ static void logolamp_set(struct led_classdev *cdev,
>  static void kblamps_set(struct led_classdev *cdev,
>  			       enum led_brightness brightness)
>  {
> -	if (brightness >= LED_FULL)
> +	if (brightness)
>  		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_ON);
>  	else
>  		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
> @@ -290,7 +292,7 @@ static void kblamps_set(struct led_classdev *cdev,
>  static void radio_led_set(struct led_classdev *cdev,
>  				enum led_brightness brightness)
>  {
> -	if (brightness >= LED_FULL)
> +	if (brightness)
>  		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, RADIO_LED_ON);
>  	else
>  		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, 0x0);
> @@ -316,7 +318,7 @@ static enum led_brightness kblamps_get(struct led_classdev *cdev)
>  	enum led_brightness brightness = LED_OFF;
> 
>  	if (call_fext_func(FUNC_LEDS, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
> -		brightness = LED_FULL;
> +		brightness = cdev->max_brightness;
> 
>  	return brightness;
>  }
> @@ -326,7 +328,7 @@ static enum led_brightness radio_led_get(struct led_classdev *cdev)
>  	enum led_brightness brightness = LED_OFF;
> 
>  	if (call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0) & RADIO_LED_ON)
> -		brightness = LED_FULL;
> +		brightness = cdev->max_brightness;
> 
>  	return brightness;
>  }
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Darren Hart
Intel Open Source Technology Center
