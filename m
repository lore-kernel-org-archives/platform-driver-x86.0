From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2] fujitsu-laptop: Unify max brightness of exported leds
Date: Thu, 30 Jun 2016 22:30:57 +0930
Message-ID: <20160630130057.GE32030@marvin.atrad.com.au>
References: <20160629072758.GA2778@Matej-PC.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:55679 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751432AbcF3NHF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Jun 2016 09:07:05 -0400
Content-Disposition: inline
In-Reply-To: <20160629072758.GA2778@Matej-PC.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matej Groma <matejgroma@gmail.com>
Cc: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 29, 2016 at 09:28:03AM +0200, Matej Groma wrote:
> Exported leds had maximum brightness previously unset, thus having
> value 255. Set maximum brightness of leds that can only be turned
> off or on to 1, making the behavior more consistent with other leds
> having binary state.

I understand the motivation here.  Is this change consistent with the LED
API though?  Currently for the binary state Fujitsu LEDs, LED_OFF (0) means
off and LED_FULL (255) means on.  It seems to me that this is the most
obvious way to use the LED API with binary state LEDs.  This patch changes
the "on" brightness to 1, which is clearly not LED_FULL (it does however
match the max_brightness configured for the LED).  Thus there is an
inconsistency: the brightness isn't LED_FULL but in reality the LED is as
bright as it goes.  Could this create problems within the LED subsystem, or
is there nothing special attached to the LED_FULL value?  A quick look
through the leds driver didn't turn up anything obvious, but I might have
missed some subtlties.

Darren: any thoughts?

Regards
  jonathan

> Signed-off-by: Matej Groma <matejgroma@gmail.com>
> ---
> Changes from v1:
> 	made commit message more clear
> 	rebased on testing
> 
>  drivers/platform/x86/fujitsu-laptop.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 6ce8e78..abb7c62 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -192,6 +192,7 @@ static void kblamps_set(struct led_classdev *cdev,
> 
>  static struct led_classdev kblamps_led = {
>   .name = "fujitsu::kblamps",
> + .max_brightness = 1,
>   .brightness_get = kblamps_get,
>   .brightness_set = kblamps_set
>  };
> @@ -202,6 +203,7 @@ static void radio_led_set(struct led_classdev *cdev,
> 
>  static struct led_classdev radio_led = {
>   .name = "fujitsu::radio_led",
> + .max_brightness = 1,
>   .brightness_get = radio_led_get,
>   .brightness_set = radio_led_set
>  };
> @@ -285,7 +287,7 @@ static void logolamp_set(struct led_classdev *cdev,
>  static void kblamps_set(struct led_classdev *cdev,
>  			       enum led_brightness brightness)
>  {
> -	if (brightness >= LED_FULL)
> +	if (brightness)
>  		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_ON);
>  	else
>  		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
> @@ -294,7 +296,7 @@ static void kblamps_set(struct led_classdev *cdev,
>  static void radio_led_set(struct led_classdev *cdev,
>  				enum led_brightness brightness)
>  {
> -	if (brightness >= LED_FULL)
> +	if (brightness)
>  		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, RADIO_LED_ON);
>  	else
>  		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, 0x0);
> @@ -332,7 +334,7 @@ static enum led_brightness kblamps_get(struct led_classdev *cdev)
>  	enum led_brightness brightness = LED_OFF;
> 
>  	if (call_fext_func(FUNC_LEDS, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
> -		brightness = LED_FULL;
> +		brightness = cdev->max_brightness;
> 
>  	return brightness;
>  }
> @@ -342,7 +344,7 @@ static enum led_brightness radio_led_get(struct led_classdev *cdev)
>  	enum led_brightness brightness = LED_OFF;
> 
>  	if (call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0) & RADIO_LED_ON)
> -		brightness = LED_FULL;
> +		brightness = cdev->max_brightness;
> 
>  	return brightness;
>  }

-- 
