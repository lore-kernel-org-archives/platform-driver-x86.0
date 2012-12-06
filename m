From: joeyli <jlee@suse.com>
Subject: Re: [PATCH v2 6/8] msi-laptop: Disable brightness control for new
 EC
Date: Thu, 06 Dec 2012 10:54:50 +0800
Message-ID: <1354762490.21227.1586.camel@linux-s257.site>
References: <1354291477-8788-1-git-send-email-maxtram95@gmail.com>
	 <1354291477-8788-7-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:59284 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964770Ab2LFC4A (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Dec 2012 21:56:00 -0500
In-Reply-To: <1354291477-8788-7-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, anisse@astier.eu

=E6=96=BC =E4=BA=94=EF=BC=8C2012-11-30 =E6=96=BC 18:04 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> It seems that existing brightness control works only for old EC model=
s.
> On newer ones auto_brightness access always timeouts and lcd_level
> always shows 0. So disable brightness control for new EC models. It
> works fine with ACPI video driver anyway.
>=20
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Signed-off-by: Lee, Chun-Yi <jlee@suse.com>

Thanks for your patch!
Joey Lee

> ---
>  drivers/platform/x86/msi-laptop.c | 39 +++++++++++++++++++++++++++--=
----------
>  1 file changed, 27 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86=
/msi-laptop.c
> index 28bcbb2..6b22938 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -546,8 +546,6 @@ static DEVICE_ATTR(turbo_cooldown, 0444, show_tur=
bo_cooldown, NULL);
>  static DEVICE_ATTR(auto_fan, 0644, show_auto_fan, store_auto_fan);
> =20
>  static struct attribute *msipf_attributes[] =3D {
> -	&dev_attr_lcd_level.attr,
> -	&dev_attr_auto_brightness.attr,
>  	&dev_attr_bluetooth.attr,
>  	&dev_attr_wlan.attr,
>  	&dev_attr_touchpad.attr,
> @@ -558,10 +556,20 @@ static struct attribute *msipf_attributes[] =3D=
 {
>  	NULL
>  };
> =20
> +static struct attribute *msipf_old_attributes[] =3D {
> +	&dev_attr_lcd_level.attr,
> +	&dev_attr_auto_brightness.attr,
> +	NULL
> +};
> +
>  static struct attribute_group msipf_attribute_group =3D {
>  	.attrs =3D msipf_attributes
>  };
> =20
> +static struct attribute_group msipf_old_attribute_group =3D {
> +	.attrs =3D msipf_old_attributes
> +};
> +
>  static struct platform_driver msipf_driver =3D {
>  	.driver =3D {
>  		.name =3D "msi-laptop-pf",
> @@ -1062,7 +1070,7 @@ static int __init msi_init(void)
> =20
>  	/* Register backlight stuff */
> =20
> -	if (acpi_video_backlight_support()) {
> +	if (!quirks->old_ec_model || acpi_video_backlight_support()) {
>  		pr_info("Brightness ignored, must be controlled by ACPI video driv=
er\n");
>  	} else {
>  		struct backlight_properties props;
> @@ -1108,14 +1116,19 @@ static int __init msi_init(void)
>  						&dev_attr_threeg);
>  		if (ret)
>  			goto fail_platform_device2;
> -	}
> +	} else {
> +		ret =3D sysfs_create_group(&msipf_device->dev.kobj,
> +					 &msipf_old_attribute_group);
> +		if (ret)
> +			goto fail_platform_device2;
> =20
> -	/* Disable automatic brightness control by default because
> -	 * this module was probably loaded to do brightness control in
> -	 * software. */
> +		/* Disable automatic brightness control by default because
> +		 * this module was probably loaded to do brightness control in
> +		 * software. */
> =20
> -	if (auto_brightness !=3D 2)
> -		set_auto_brightness(auto_brightness);
> +		if (auto_brightness !=3D 2)
> +			set_auto_brightness(auto_brightness);
> +	}
> =20
>  	pr_info("driver " MSI_DRIVER_VERSION " successfully loaded\n");
> =20
> @@ -1163,9 +1176,11 @@ static void __exit msi_cleanup(void)
>  	platform_driver_unregister(&msipf_driver);
>  	backlight_device_unregister(msibl_device);
> =20
> -	/* Enable automatic brightness control again */
> -	if (auto_brightness !=3D 2)
> -		set_auto_brightness(1);
> +	if (quirks->old_ec_model) {
> +		/* Enable automatic brightness control again */
> +		if (auto_brightness !=3D 2)
> +			set_auto_brightness(1);
> +	}
> =20
>  	pr_info("driver unloaded\n");
>  }
