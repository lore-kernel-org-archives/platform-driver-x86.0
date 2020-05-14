From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] V2: platform/x86: dell-laptop: don't register
 platform::micmute if the related tokens don't exist.
Date: Thu, 14 May 2020 01:26:11 +0000
Message-ID: <135a804acc8247648ff8e811843f68ce@AUSX13MPC105.AMER.DELL.COM>
References: <20200511014456.5149-1-koba.ko@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200511014456.5149-1-koba.ko@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: koba.ko@canonical.com, mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: koba.ko@canonical.com <koba.ko@canonical.com>
> Sent: Sunday, May 10, 2020 8:45 PM
> To: Matthew Garrett; Pali Roh=E1r; Darren Hart; Andy Shevchenko; platform=
-driver-
> x86@vger.kernel.org; linux-kernel@vger.kernel.org; Limonciello, Mario
> Subject: [PATCH] V2: platform/x86: dell-laptop: don't register
> platform::micmute if the related tokens don't exist.
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> From: Koba Ko <koba.ko@canonical.com>
>=20
> On dell G3-3590, error message is issued during boot up,
> "platform::micmute: Setting an LED's brightness failed (-19)",
> but there's no micmute led on the machine.
>=20
> Get the related tokens of SMBIOS, GLOBAL_MIC_MUTE_DISABLE/ENABLE.
> If one of two tokens doesn't exist,
> don't call led_classdev_register() for platform::micmute.
> After that, you wouldn't see the platform::micmute in /sys/class/leds/,
> and the error message wouldn't see in dmesg.
>=20
> Signed-off-by: Koba Ko <koba.ko@canonical.com>
> ---
> Changelog:
> 1. Refine the typo of comment.
> ---
>  drivers/platform/x86/dell-laptop.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/de=
ll-
> laptop.c
> index 1e46022fb2c5..afc1ded83e56 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -2208,10 +2208,13 @@ static int __init dell_init(void)
>=20
>  	dell_laptop_register_notifier(&dell_laptop_notifier);
>=20
> -	micmute_led_cdev.brightness =3D ledtrig_audio_get(LED_AUDIO_MICMUTE);
> -	ret =3D led_classdev_register(&platform_device->dev, &micmute_led_cdev)=
;
> -	if (ret < 0)
> -		goto fail_led;
> +	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
> +	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
> +		micmute_led_cdev.brightness =3D ledtrig_audio_get(LED_AUDIO_MICMUTE);
> +		ret =3D led_classdev_register(&platform_device->dev,
> &micmute_led_cdev);
> +		if (ret < 0)
> +			goto fail_led;
> +	}
>=20
>  	if (acpi_video_get_backlight_type() !=3D acpi_backlight_vendor)
>  		return 0;
> --
> 2.17.1

Reviewed-by: Mario Limonciello <Mario.limonciello@dell.com>
