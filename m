From: joeyli <jlee@suse.com>
Subject: Re: [PATCH v4 12/12] msi-wmi: Add MSI Wind support
Date: Mon, 17 Dec 2012 18:00:53 +0800
Message-ID: <1355738453.2710.89.camel@linux-s257.site>
References: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
	 <1355592696-15454-13-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:34597 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751269Ab2LQKCT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Dec 2012 05:02:19 -0500
In-Reply-To: <1355592696-15454-13-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, anisse@astier.eu

=E6=96=BC =E5=85=AD=EF=BC=8C2012-12-15 =E6=96=BC 19:31 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> Add MSI Wind support to msi-wmi driver. MSI Wind has different GUID f=
or
> key events, different WMI key scan codes, it does not need filtering
> consecutive identical events and it does not support backlight contro=
l
> via MSIWMI_BIOS_GUID WMI. Tested on MSI Wind U100.
>=20
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Acked-by: Lee, Chun-Yi <jlee@suse.com>

Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/msi-wmi.c | 65 ++++++++++++++++++++++++++++++++=
----------
>  1 file changed, 50 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/ms=
i-wmi.c
> index 739bd4d..70222f2 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -37,17 +37,27 @@ MODULE_LICENSE("GPL");
>  #define DRV_NAME "msi-wmi"
> =20
>  #define MSIWMI_BIOS_GUID "551A1F84-FBDD-4125-91DB-3EA8F44F1D45"
> -#define MSIWMI_EVENT_GUID "B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2"
> +#define MSIWMI_MSI_EVENT_GUID "B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2"
> +#define MSIWMI_WIND_EVENT_GUID "5B3CC38A-40D9-7245-8AE6-1145B751BE3F=
"
> =20
>  MODULE_ALIAS("wmi:" MSIWMI_BIOS_GUID);
> -MODULE_ALIAS("wmi:" MSIWMI_EVENT_GUID);
> +MODULE_ALIAS("wmi:" MSIWMI_MSI_EVENT_GUID);
> +MODULE_ALIAS("wmi:" MSIWMI_WIND_EVENT_GUID);
> =20
>  enum msi_scancodes {
> +	/* Generic MSI keys (not present on MSI Wind) */
>  	MSI_KEY_BRIGHTNESSUP	=3D 0xD0,
>  	MSI_KEY_BRIGHTNESSDOWN,
>  	MSI_KEY_VOLUMEUP,
>  	MSI_KEY_VOLUMEDOWN,
>  	MSI_KEY_MUTE,
> +	/* MSI Wind keys */
> +	WIND_KEY_TOUCHPAD	=3D 0x08,	/* Fn+F3 touchpad toggle */
> +	WIND_KEY_BLUETOOTH	=3D 0x56,	/* Fn+F11 Bluetooth toggle */
> +	WIND_KEY_CAMERA,		/* Fn+F6 webcam toggle */
> +	WIND_KEY_WLAN		=3D 0x5f,	/* Fn+F11 Wi-Fi toggle */
> +	WIND_KEY_TURBO,			/* Fn+F10 turbo mode toggle */
> +	WIND_KEY_ECO		=3D 0x69,	/* Fn+F10 ECO mode toggle */
>  };
>  static struct key_entry msi_wmi_keymap[] =3D {
>  	{ KE_KEY, MSI_KEY_BRIGHTNESSUP,		{KEY_BRIGHTNESSUP} },
> @@ -55,13 +65,34 @@ static struct key_entry msi_wmi_keymap[] =3D {
>  	{ KE_KEY, MSI_KEY_VOLUMEUP,		{KEY_VOLUMEUP} },
>  	{ KE_KEY, MSI_KEY_VOLUMEDOWN,		{KEY_VOLUMEDOWN} },
>  	{ KE_KEY, MSI_KEY_MUTE,			{KEY_MUTE} },
> +
> +	/* These keys work without WMI. Ignore them to avoid double keycode=
s */
> +	{ KE_IGNORE, WIND_KEY_TOUCHPAD,		{KEY_TOUCHPAD_TOGGLE} },
> +	{ KE_IGNORE, WIND_KEY_BLUETOOTH,	{KEY_BLUETOOTH} },
> +	{ KE_IGNORE, WIND_KEY_CAMERA,		{KEY_CAMERA} },
> +	{ KE_IGNORE, WIND_KEY_WLAN,		{KEY_WLAN} },
> +
> +	/* These are unknown WMI events found on MSI Wind */
> +	{ KE_IGNORE, 0x00 },
> +	{ KE_IGNORE, 0x62 },
> +	{ KE_IGNORE, 0x63 },
> +
> +	/* These are MSI Wind keys that should be handled via WMI */
> +	{ KE_KEY, WIND_KEY_TURBO,		{KEY_PROG1} },
> +	{ KE_KEY, WIND_KEY_ECO,			{KEY_PROG2} },
> +
>  	{ KE_END, 0 }
>  };
> =20
>  static ktime_t last_pressed;
> -static bool quirk_last_pressed;
> =20
> -static const char *event_wmi_guid;
> +static const struct {
> +	const char *guid;
> +	bool quirk_last_pressed;
> +} *event_wmi, event_wmis[] =3D {
> +	{ MSIWMI_MSI_EVENT_GUID, true },
> +	{ MSIWMI_WIND_EVENT_GUID, false },
> +};
> =20
>  static struct backlight_device *backlight;
> =20
> @@ -174,7 +205,7 @@ static void msi_wmi_notify(u32 value, void *conte=
xt)
>  			goto msi_wmi_notify_exit;
>  		}
> =20
> -		if (quirk_last_pressed) {
> +		if (event_wmi->quirk_last_pressed) {
>  			ktime_t cur =3D ktime_get_real();
>  			ktime_t diff =3D ktime_sub(cur, last_pressed);
>  			/* Ignore event if any event happened in a 50 ms
> @@ -265,15 +296,19 @@ err_free_dev:
>  static int __init msi_wmi_init(void)
>  {
>  	int err;
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(event_wmis); i++) {
> +		if (!wmi_has_guid(event_wmis[i].guid))
> +			continue;
> =20
> -	if (wmi_has_guid(MSIWMI_EVENT_GUID)) {
>  		err =3D msi_wmi_input_setup();
>  		if (err) {
>  			pr_err("Unable to setup input device\n");
>  			return err;
>  		}
> =20
> -		err =3D wmi_install_notify_handler(MSIWMI_EVENT_GUID,
> +		err =3D wmi_install_notify_handler(event_wmis[i].guid,
>  			msi_wmi_notify, NULL);
>  		if (ACPI_FAILURE(err)) {
>  			pr_err("Unable to setup WMI notify handler\n");
> @@ -281,8 +316,8 @@ static int __init msi_wmi_init(void)
>  		}
> =20
>  		pr_debug("Event handler installed\n");
> -		event_wmi_guid =3D MSIWMI_EVENT_GUID;
> -		quirk_last_pressed =3D true;
> +		event_wmi =3D &event_wmis[i];
> +		break;
>  	}
> =20
>  	if (wmi_has_guid(MSIWMI_BIOS_GUID) && !acpi_video_backlight_support=
()) {
> @@ -294,7 +329,7 @@ static int __init msi_wmi_init(void)
>  		pr_debug("Backlight device created\n");
>  	}
> =20
> -	if (!event_wmi_guid && !backlight) {
> +	if (!event_wmi && !backlight) {
>  		pr_err("This machine doesn't have neither MSI-hotkeys nor backligh=
t through WMI\n");
>  		return -ENODEV;
>  	}
> @@ -302,10 +337,10 @@ static int __init msi_wmi_init(void)
>  	return 0;
> =20
>  err_uninstall_handler:
> -	if (event_wmi_guid)
> -		wmi_remove_notify_handler(event_wmi_guid);
> +	if (event_wmi)
> +		wmi_remove_notify_handler(event_wmi->guid);
>  err_free_input:
> -	if (event_wmi_guid) {
> +	if (event_wmi) {
>  		sparse_keymap_free(msi_wmi_input_dev);
>  		input_unregister_device(msi_wmi_input_dev);
>  	}
> @@ -314,8 +349,8 @@ err_free_input:
> =20
>  static void __exit msi_wmi_exit(void)
>  {
> -	if (event_wmi_guid) {
> -		wmi_remove_notify_handler(event_wmi_guid);
> +	if (event_wmi) {
> +		wmi_remove_notify_handler(event_wmi->guid);
>  		sparse_keymap_free(msi_wmi_input_dev);
>  		input_unregister_device(msi_wmi_input_dev);
>  	}
