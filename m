From: joeyli <jlee@suse.com>
Subject: Re: [PATCH v4 10/12] msi-wmi: Make keys and backlight independent
Date: Mon, 17 Dec 2012 17:04:20 +0800
Message-ID: <1355735060.2710.87.camel@linux-s257.site>
References: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
	 <1355592696-15454-11-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:48537 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751242Ab2LQJFq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Dec 2012 04:05:46 -0500
In-Reply-To: <1355592696-15454-11-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, anisse@astier.eu

=E6=96=BC =E5=85=AD=EF=BC=8C2012-12-15 =E6=96=BC 19:31 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> Introduced function msi_wmi_backlight_setup() that initializes backli=
ght
> device. Made driver load and work if only one WMI (only for hotkeys o=
r
> only for backlight) is present.
>=20
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>


Acked-by: Lee, Chun-Yi <jlee@suse.com>

Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/msi-wmi.c | 101 ++++++++++++++++++++++++++-----=
----------
>  1 file changed, 64 insertions(+), 37 deletions(-)
>=20
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/ms=
i-wmi.c
> index 112ec14..3a60619 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -60,6 +60,8 @@ static struct key_entry msi_wmi_keymap[] =3D {
>  };
>  static ktime_t last_pressed[ARRAY_SIZE(msi_wmi_keymap) - 1];
> =20
> +static const char *event_wmi_guid;
> +
>  static struct backlight_device *backlight;
> =20
>  static int backlight_map[] =3D { 0x00, 0x33, 0x66, 0x99, 0xCC, 0xFF =
};
> @@ -184,7 +186,7 @@ static void msi_wmi_notify(u32 value, void *conte=
xt)
> =20
>  			if (key->type =3D=3D KE_KEY &&
>  			/* Brightness is served via acpi video driver */
> -			(!acpi_video_backlight_support() ||
> +			(backlight ||
>  			(key->code !=3D MSI_KEY_BRIGHTNESSUP &&
>  			key->code !=3D MSI_KEY_BRIGHTNESSDOWN))) {
>  				pr_debug("Send key: 0x%X - "
> @@ -202,6 +204,31 @@ msi_wmi_notify_exit:
>  	kfree(response.pointer);
>  }
> =20
> +static int __init msi_wmi_backlight_setup(void)
> +{
> +	int err;
> +	struct backlight_properties props;
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type =3D BACKLIGHT_PLATFORM;
> +	props.max_brightness =3D ARRAY_SIZE(backlight_map) - 1;
> +	backlight =3D backlight_device_register(DRV_NAME, NULL, NULL,
> +					      &msi_backlight_ops,
> +					      &props);
> +	if (IS_ERR(backlight))
> +		return PTR_ERR(backlight);
> +
> +	err =3D bl_get(NULL);
> +	if (err < 0) {
> +		backlight_device_unregister(backlight);
> +		return err;
> +	}
> +
> +	backlight->props.brightness =3D err;
> +
> +	return 0;
> +}
> +
>  static int __init msi_wmi_input_setup(void)
>  {
>  	int err;
> @@ -238,60 +265,60 @@ static int __init msi_wmi_init(void)
>  {
>  	int err;
> =20
> -	if (!wmi_has_guid(MSIWMI_EVENT_GUID)) {
> -		pr_err("This machine doesn't have MSI-hotkeys through WMI\n");
> -		return -ENODEV;
> -	}
> -	err =3D wmi_install_notify_handler(MSIWMI_EVENT_GUID,
> -			msi_wmi_notify, NULL);
> -	if (ACPI_FAILURE(err))
> -		return -EINVAL;
> +	if (wmi_has_guid(MSIWMI_EVENT_GUID)) {
> +		err =3D msi_wmi_input_setup();
> +		if (err) {
> +			pr_err("Unable to setup input device\n");
> +			return err;
> +		}
> =20
> -	err =3D msi_wmi_input_setup();
> -	if (err)
> -		goto err_uninstall_notifier;
> -
> -	if (!acpi_video_backlight_support()) {
> -		struct backlight_properties props;
> -		memset(&props, 0, sizeof(struct backlight_properties));
> -		props.type =3D BACKLIGHT_PLATFORM;
> -		props.max_brightness =3D ARRAY_SIZE(backlight_map) - 1;
> -		backlight =3D backlight_device_register(DRV_NAME, NULL, NULL,
> -						      &msi_backlight_ops,
> -						      &props);
> -		if (IS_ERR(backlight)) {
> -			err =3D PTR_ERR(backlight);
> +		err =3D wmi_install_notify_handler(MSIWMI_EVENT_GUID,
> +			msi_wmi_notify, NULL);
> +		if (ACPI_FAILURE(err)) {
> +			pr_err("Unable to setup WMI notify handler\n");
>  			goto err_free_input;
>  		}
> =20
> -		err =3D bl_get(NULL);
> -		if (err < 0)
> -			goto err_free_backlight;
> +		pr_debug("Event handler installed\n");
> +		event_wmi_guid =3D MSIWMI_EVENT_GUID;
> +	}
> +
> +	if (wmi_has_guid(MSIWMI_BIOS_GUID) && !acpi_video_backlight_support=
()) {
> +		err =3D msi_wmi_backlight_setup();
> +		if (err) {
> +			pr_err("Unable to setup backlight device\n");
> +			goto err_uninstall_handler;
> +		}
> +		pr_debug("Backlight device created\n");
> +	}
> =20
> -		backlight->props.brightness =3D err;
> +	if (!event_wmi_guid && !backlight) {
> +		pr_err("This machine doesn't have neither MSI-hotkeys nor backligh=
t through WMI\n");
> +		return -ENODEV;
>  	}
> -	pr_debug("Event handler installed\n");
> =20
>  	return 0;
> =20
> -err_free_backlight:
> -	backlight_device_unregister(backlight);
> +err_uninstall_handler:
> +	if (event_wmi_guid)
> +		wmi_remove_notify_handler(event_wmi_guid);
>  err_free_input:
> -	sparse_keymap_free(msi_wmi_input_dev);
> -	input_unregister_device(msi_wmi_input_dev);
> -err_uninstall_notifier:
> -	wmi_remove_notify_handler(MSIWMI_EVENT_GUID);
> +	if (event_wmi_guid) {
> +		sparse_keymap_free(msi_wmi_input_dev);
> +		input_unregister_device(msi_wmi_input_dev);
> +	}
>  	return err;
>  }
> =20
>  static void __exit msi_wmi_exit(void)
>  {
> -	if (wmi_has_guid(MSIWMI_EVENT_GUID)) {
> -		wmi_remove_notify_handler(MSIWMI_EVENT_GUID);
> +	if (event_wmi_guid) {
> +		wmi_remove_notify_handler(event_wmi_guid);
>  		sparse_keymap_free(msi_wmi_input_dev);
>  		input_unregister_device(msi_wmi_input_dev);
> -		backlight_device_unregister(backlight);
>  	}
> +	if (backlight)
> +		backlight_device_unregister(backlight);
>  }
> =20
>  module_init(msi_wmi_init);
