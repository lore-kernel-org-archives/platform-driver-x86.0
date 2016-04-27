From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] fujitsu-laptop: Use IS_ENABLED() instead of checking for
 built-in or module
Date: Thu, 28 Apr 2016 09:13:09 +0930
Message-ID: <20160427234309.GB9930@marvin.atrad.com.au>
References: <1461709697-4152-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461709697-4152-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Apr 26, 2016 at 06:28:17PM -0400, Javier Martinez Canillas wrote:
> The IS_ENABLED() macro checks if a Kconfig symbol has been enabled either
> built-in or as a module, use that macro instead of open coding the same.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Acked-by: Jonathan Woithe <jwoithe@just42.net>

> ---
> 
>  drivers/platform/x86/fujitsu-laptop.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 1cb39d00d014..ce41bc34288d 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -69,7 +69,7 @@
>  #include <linux/kfifo.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> -#if defined(CONFIG_LEDS_CLASS) || defined(CONFIG_LEDS_CLASS_MODULE)
> +#if IS_ENABLED(CONFIG_LEDS_CLASS)
>  #include <linux/leds.h>
>  #endif
>  #include <acpi/video.h>
> @@ -100,7 +100,7 @@
>  /* FUNC interface - responses */
>  #define UNSUPPORTED_CMD 0x80000000
>  
> -#if defined(CONFIG_LEDS_CLASS) || defined(CONFIG_LEDS_CLASS_MODULE)
> +#if IS_ENABLED(CONFIG_LEDS_CLASS)
>  /* FUNC interface - LED control */
>  #define FUNC_LED_OFF	0x1
>  #define FUNC_LED_ON	0x30001
> @@ -182,7 +182,7 @@ static struct fujitsu_hotkey_t *fujitsu_hotkey;
>  
>  static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event);
>  
> -#if defined(CONFIG_LEDS_CLASS) || defined(CONFIG_LEDS_CLASS_MODULE)
> +#if IS_ENABLED(CONFIG_LEDS_CLASS)
>  static enum led_brightness logolamp_get(struct led_classdev *cdev);
>  static void logolamp_set(struct led_classdev *cdev,
>  			       enum led_brightness brightness);
> @@ -261,7 +261,7 @@ static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
>  	return value;
>  }
>  
> -#if defined(CONFIG_LEDS_CLASS) || defined(CONFIG_LEDS_CLASS_MODULE)
> +#if IS_ENABLED(CONFIG_LEDS_CLASS)
>  /* LED class callbacks */
>  
>  static void logolamp_set(struct led_classdev *cdev,
> @@ -903,7 +903,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
>  	/* Suspect this is a keymap of the application panel, print it */
>  	pr_info("BTNI: [0x%x]\n", call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0));
>  
> -#if defined(CONFIG_LEDS_CLASS) || defined(CONFIG_LEDS_CLASS_MODULE)
> +#if IS_ENABLED(CONFIG_LEDS_CLASS)
>  	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
>  		result = led_classdev_register(&fujitsu->pf_device->dev,
>  						&logolamp_led);
> @@ -963,7 +963,7 @@ static int acpi_fujitsu_hotkey_remove(struct acpi_device *device)
>  	struct fujitsu_hotkey_t *fujitsu_hotkey = acpi_driver_data(device);
>  	struct input_dev *input = fujitsu_hotkey->input;
>  
> -#if defined(CONFIG_LEDS_CLASS) || defined(CONFIG_LEDS_CLASS_MODULE)
> +#if IS_ENABLED(CONFIG_LEDS_CLASS)
>  	if (fujitsu_hotkey->logolamp_registered)
>  		led_classdev_unregister(&logolamp_led);
>  
> -- 
> 2.5.5
