From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH] platform/x86: dell-laptop: don't register
 platform::micmute if the related tokens don't exist.
Date: Thu, 7 May 2020 13:13:31 +0200
Message-ID: <20200507111331.dzge7htw5toejh72@pali>
References: <20200507094242.7523-1-koba.ko@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200507094242.7523-1-koba.ko@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: koba.ko@canonical.com
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thursday 07 May 2020 17:42:42 koba.ko@canonical.com wrote:
> From: Koba Ko <koba.ko@canonical.com>
> 
> Error messge is issued,
> "platform::micmute: Setting an LED's brightness failed (-19)",
> Even the device isn't presented.
> 
> Get the related tokens of SMBIOS, GLOBAL_MIC_MUTE_DISABLE/ENABLE.
> If one of two tokens doesn't exist, don't register platform::micmute.
> 
> Signed-off-by: Koba Ko <koba.ko@canonical.com>
> ---
>  drivers/platform/x86/dell-laptop.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index 1e46022fb2c5..afc1ded83e56 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -2208,10 +2208,13 @@ static int __init dell_init(void)
>  
>  	dell_laptop_register_notifier(&dell_laptop_notifier);
>  
> -	micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
> -	ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
> -	if (ret < 0)
> -		goto fail_led;
> +	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
> +	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
> +		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
> +		ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
> +		if (ret < 0)
> +			goto fail_led;
> +	}

Hello! I think that this is correct approach. Changing micmute LED is
done via those GLOBAL_MIC_MUTE_DISABLE and GLOBAL_MIC_MUTE_ENABLE
tokens. And if these tokens are not supported by hardware then linux
kernel should not register micmute LED device. There are lot of Dell
machines without led diode for microphone and these machines obviously
would not support those tokens.

But this change is incomplete as registration of led class dev would be
optional. So deregistration also needs to be optional.

And I think there is missing better description / explanation of this
change to make it clear what really happens.

>  
>  	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
>  		return 0;
> -- 
> 2.17.1
> 
