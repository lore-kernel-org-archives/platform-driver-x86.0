From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 5/6] platform/x86: fujitsu-laptop: do not log LED
 registration failures
Date: Mon, 17 Apr 2017 09:09:52 -0700
Message-ID: <20170417160952.GA27550@fury>
References: <20170407130713.8417-1-kernel@kempniu.pl>
 <20170407130713.8417-6-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170407130713.8417-6-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 07, 2017 at 03:07:12PM +0200, Michał Kępień wrote:
> If acpi_fujitsu_laptop_leds_register() returns an error, the latter will
> become the return value of acpi_fujitsu_laptop_add(), which in turn will
> be reported by driver core.  Simplify code by replacing pr_err() calls
> with return statements.  Return 0 instead of result when no errors occur
> in order to make the code easier to read.

Hi Michał,

Jonathan's comment regarding the information loss of removing the pr_err
statements seems valid to me. Based on the outer if block, I take it each
registration only fails in true error scenarios and not because some laptop
might have one but not another LED in the list. If so, then the pr_err messages
would only appear when there was a legitimate problem. I think they're worth

This seems to introduce a behavior change as well. Previously only the last
LED registered would determine the result - which is wrong of course and I
believe you noted a related bug in an early patch. Previously, however, if
LOGOLAMP_POWERON failed, for example, the KEYBOARD_LAMPS would still be attempted.

So the question really comes down to this: Is there a legitimate situation in
which one LEDs registration fails and another succeeds? If so, then this would
constitute a regression for such systems.

> 
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/fujitsu-laptop.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index ce658789e748..177b9b57ac2f 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -739,22 +739,20 @@ static struct led_classdev eco_led = {
>  
>  static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
>  {
> -	int result = 0;
> +	int result;
>  
>  	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
>  		result = devm_led_classdev_register(&device->dev,
>  						    &logolamp_led);
>  		if (result)
> -			pr_err("Could not register LED handler for logo lamp, error %i\n",
> -			       result);
> +			return result;
>  	}
>  
>  	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
>  	    (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
>  		result = devm_led_classdev_register(&device->dev, &kblamps_led);
>  		if (result)
> -			pr_err("Could not register LED handler for keyboard lamps, error %i\n",
> -			       result);
> +			return result;
>  	}
>  
>  	/*
> @@ -766,8 +764,7 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
>  	if (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
>  		result = devm_led_classdev_register(&device->dev, &radio_led);
>  		if (result)
> -			pr_err("Could not register LED handler for radio LED, error %i\n",
> -			       result);
> +			return result;
>  	}
>  
>  	/* Support for eco led is not always signaled in bit corresponding
> @@ -779,11 +776,10 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
>  	    (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
>  		result = devm_led_classdev_register(&device->dev, &eco_led);
>  		if (result)
> -			pr_err("Could not register LED handler for eco LED, error %i\n",
> -			       result);
> +			return result;
>  	}
>  
> -	return result;
> +	return 0;
>  }
>  
>  static int acpi_fujitsu_laptop_add(struct acpi_device *device)
> -- 
> 2.12.2
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
