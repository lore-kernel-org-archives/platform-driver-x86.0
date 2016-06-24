From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] fujitsu-laptop: Unify max brightness of exported leds
Date: Fri, 24 Jun 2016 09:40:39 +0930
Message-ID: <20160624001039.GE11197@marvin.atrad.com.au>
References: <20160623175250.GA22215@Matej-PC.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:53080 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750874AbcFXAKr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 20:10:47 -0400
Content-Disposition: inline
In-Reply-To: <20160623175250.GA22215@Matej-PC.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matej Groma <matejgroma@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Thu, Jun 23, 2016 at 07:52:53PM +0200, Matej Groma wrote:
> Set maximum brightness of leds that can only be turned off or on to 1.
> 
> Signed-off-by: Matej Groma <matejgroma@gmail.com>

I don't have any hardware equipped with LEDs so I can't explicitly test
this myself.  On the assumption that these LEDs can only have a binary state
as reported then this approach seems fine and makes it clearer that these
LEDs are either on or off.

Acked-by: Jonathan Woithe <jwoithe@just42.net>

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
