From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: dell-laptop: don't register
 platform::micmute if the related tokens don't exist.
Date: Thu, 7 May 2020 20:11:08 +0000
Message-ID: <31e54254d233424f937ea767c5a26f57@AUSX13MPC101.AMER.DELL.COM>
References: <20200507122703.14617-1-koba.ko@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200507122703.14617-1-koba.ko@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: koba.ko@canonical.com, mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: koba.ko@canonical.com <koba.ko@canonical.com>
> Sent: Thursday, May 7, 2020 7:27 AM
> To: Matthew Garrett; Pali Roh=E1r; Darren Hart; Andy Shevchenko; platform=
-driver-
> x86@vger.kernel.org; linux-kernel@vger.kernel.org; Limonciello, Mario
> Subject: [PATCH] platform/x86: dell-laptop: don't register platform::micm=
ute if
> the related tokens don't exist.
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> From: Koba Ko <koba.ko@canonical.com>
>=20
> During boot up, Error messge is issued,
> "platform::micmute: Setting an LED's brightness failed (-19)",
> but the device isn't presented.
>=20
> Get the related tokens of SMBIOS, GLOBAL_MIC_MUTE_DISABLE/ENABLE.
> If one of two tokens doesn't exist,
> don't call led_classdev_register() for platform::micmute.
> After that, you wouldn't see the platform::micmute in /sys/class/leds/,
> and the error message wouldn't see in dmesg.
>=20

Unless it's a pre-release platform, I think it's worth mentioning in commit
message what the hardware is.

If it's pre-release, then perhaps mention "pre-release vostro platform" her=
e.
This is useful information in case in the future something in this driver m=
ust
change for a full class/line of systems.

> Signed-off-by: Koba Ko <koba.ko@canonical.com>
> ---
>  drivers/platform/x86/dell-laptop.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/de=
ll-
> laptop.c
> index 74e988f839e8..e315185dbdd6 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -2164,7 +2164,7 @@ static struct led_classdev micmute_led_cdev =3D {
>  static int __init dell_init(void)
>  {
>  	struct calling_interface_token *token;
> -	int max_intensity =3D 0;
> +	int max_intensity =3D 0, is_micmute_exist =3D 0;

As a nit, please declare variables on their own line and I don't like is_mi=
cmute_exist
as this is bad grammar.

Perhaps "micmute_exists" instead.

Also this variable can be a boolean type instead with it's usage.

>  	int ret;
>=20
>  	if (!dmi_check_system(dell_device_table))
> @@ -2204,10 +2204,14 @@ static int __init dell_init(void)
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
> +		is_micmute_exist =3D 1;
> +	}
>=20
>  	if (acpi_video_get_backlight_type() !=3D acpi_backlight_vendor)
>  		return 0;
> @@ -2254,7 +2258,8 @@ static int __init dell_init(void)
>  fail_get_brightness:
>  	backlight_device_unregister(dell_backlight_device);
>  fail_backlight:
> -	led_classdev_unregister(&micmute_led_cdev);
> +	if (is_micmute_exist)
> +		led_classdev_unregister(&micmute_led_cdev);
>  fail_led:
>  	dell_cleanup_rfkill();
>  fail_rfkill:
> --
> 2.25.1
