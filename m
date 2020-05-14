From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH] V2: platform/x86: dell-laptop: don't register
 platform::micmute if the related tokens don't exist.
Date: Fri, 15 May 2020 00:35:30 +0200
Message-ID: <20200514223530.24r7c42bvwxvyyv5@pali>
References: <20200511014456.5149-1-koba.ko@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200511014456.5149-1-koba.ko@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: koba.ko@canonical.com
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mario.Limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

On Monday 11 May 2020 09:44:56 koba.ko@canonical.com wrote:
> From: Koba Ko <koba.ko@canonical.com>
> 
> On dell G3-3590, error message is issued during boot up,
> "platform::micmute: Setting an LED's brightness failed (-19)",
> but there's no micmute led on the machine.
> 
> Get the related tokens of SMBIOS, GLOBAL_MIC_MUTE_DISABLE/ENABLE.
> If one of two tokens doesn't exist,
> don't call led_classdev_register() for platform::micmute.
> After that, you wouldn't see the platform::micmute in /sys/class/leds/,
> and the error message wouldn't see in dmesg.
> 
> Signed-off-by: Koba Ko <koba.ko@canonical.com>

Fine for me, you can add:

Reviewed-by: Pali Rohár <pali@kernel.org>

Darren / Andy, when applying this patch, please add Fixes line so this
change would be propagated to stable kernels:

Fixes: d00fa46e0a2c6 ("platform/x86: dell-laptop: Add micmute LED trigger support")

> ---
> Changelog:
> 1. Refine the typo of comment.
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
>  
>  	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
>  		return 0;
> -- 
> 2.17.1
> 
