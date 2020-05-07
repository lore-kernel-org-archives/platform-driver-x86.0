From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: don't register
 platform::micmute if the related tokens don't exist.
Date: Thu, 7 May 2020 13:41:42 +0300
Message-ID: <CAHp75VeDFpjwZoNWj6SwvnHE70o4x+U9GnK-tbrFpK6fkBN7MA@mail.gmail.com>
References: <20200507094242.7523-1-koba.ko@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200507094242.7523-1-koba.ko@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: koba.ko@canonical.com, Mario Limonciello <mario.limonciello@dell.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

+Cc: Mario

On Thu, May 7, 2020 at 12:42 PM <koba.ko@canonical.com> wrote:
>
> From: Koba Ko <koba.ko@canonical.com>
>
> Error messge is issued,
> "platform::micmute: Setting an LED's brightness failed (-19)",
> Even the device isn't presented.
>
> Get the related tokens of SMBIOS, GLOBAL_MIC_MUTE_DISABLE/ENABLE.
> If one of two tokens doesn't exist, don't register platform::micmute.
>

What the exact platform you are experiencing that on?

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
>         dell_laptop_register_notifier(&dell_laptop_notifier);
>
> -       micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
> -       ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
> -       if (ret < 0)
> -               goto fail_led;
> +       if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
> +           dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
> +               micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
> +               ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
> +               if (ret < 0)
> +                       goto fail_led;
> +       }
>
>         if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
>                 return 0;
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
