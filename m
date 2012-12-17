From: joeyli <jlee@suse.com>
Subject: Re: [PATCH v4 11/12] msi-wmi: Introduced quirk_last_pressed
Date: Mon, 17 Dec 2012 17:56:55 +0800
Message-ID: <1355738215.2710.88.camel@linux-s257.site>
References: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
	 <1355592696-15454-12-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:47079 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399Ab2LQJ6W (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Dec 2012 04:58:22 -0500
In-Reply-To: <1355592696-15454-12-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, anisse@astier.eu

=E6=96=BC =E5=85=AD=EF=BC=8C2012-12-15 =E6=96=BC 19:31 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> Introduced quirk_last_pressed variable that would indicate if
> last_pressed is used or not. Also converted last_pressed to simple
> variable in order to allow keymap to be non-contiguous.
>=20
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Acked-by: Lee, Chun-Yi <jlee@suse.com>

Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/msi-wmi.c | 54 ++++++++++++++++++++++----------=
----------
>  1 file changed, 28 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/ms=
i-wmi.c
> index 3a60619..739bd4d 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -43,8 +43,7 @@ MODULE_ALIAS("wmi:" MSIWMI_BIOS_GUID);
>  MODULE_ALIAS("wmi:" MSIWMI_EVENT_GUID);
> =20
>  enum msi_scancodes {
> -	MSI_SCANCODE_BASE	=3D 0xD0,
> -	MSI_KEY_BRIGHTNESSUP	=3D MSI_SCANCODE_BASE,
> +	MSI_KEY_BRIGHTNESSUP	=3D 0xD0,
>  	MSI_KEY_BRIGHTNESSDOWN,
>  	MSI_KEY_VOLUMEUP,
>  	MSI_KEY_VOLUMEDOWN,
> @@ -58,7 +57,9 @@ static struct key_entry msi_wmi_keymap[] =3D {
>  	{ KE_KEY, MSI_KEY_MUTE,			{KEY_MUTE} },
>  	{ KE_END, 0 }
>  };
> -static ktime_t last_pressed[ARRAY_SIZE(msi_wmi_keymap) - 1];
> +
> +static ktime_t last_pressed;
> +static bool quirk_last_pressed;
> =20
>  static const char *event_wmi_guid;
> =20
> @@ -153,7 +154,6 @@ static void msi_wmi_notify(u32 value, void *conte=
xt)
>  	struct acpi_buffer response =3D { ACPI_ALLOCATE_BUFFER, NULL };
>  	static struct key_entry *key;
>  	union acpi_object *obj;
> -	ktime_t cur;
>  	acpi_status status;
> =20
>  	status =3D wmi_get_event_data(value, &response);
> @@ -169,12 +169,15 @@ static void msi_wmi_notify(u32 value, void *con=
text)
>  		pr_debug("Eventcode: 0x%x\n", eventcode);
>  		key =3D sparse_keymap_entry_from_scancode(msi_wmi_input_dev,
>  				eventcode);
> -		if (key) {
> -			ktime_t diff;
> -			cur =3D ktime_get_real();
> -			diff =3D ktime_sub(cur, last_pressed[key->code -
> -					MSI_SCANCODE_BASE]);
> -			/* Ignore event if the same event happened in a 50 ms
> +		if (!key) {
> +			pr_info("Unknown key pressed - %x\n", eventcode);
> +			goto msi_wmi_notify_exit;
> +		}
> +
> +		if (quirk_last_pressed) {
> +			ktime_t cur =3D ktime_get_real();
> +			ktime_t diff =3D ktime_sub(cur, last_pressed);
> +			/* Ignore event if any event happened in a 50 ms
>  			   timeframe -> Key press may result in 10-20 GPEs */
>  			if (ktime_to_us(diff) < 1000 * 50) {
>  				pr_debug("Suppressed key event 0x%X - "
> @@ -182,21 +185,19 @@ static void msi_wmi_notify(u32 value, void *con=
text)
>  					 key->code, ktime_to_us(diff));
>  				goto msi_wmi_notify_exit;
>  			}
> -			last_pressed[key->code - MSI_SCANCODE_BASE] =3D cur;
> -
> -			if (key->type =3D=3D KE_KEY &&
> -			/* Brightness is served via acpi video driver */
> -			(backlight ||
> -			(key->code !=3D MSI_KEY_BRIGHTNESSUP &&
> -			key->code !=3D MSI_KEY_BRIGHTNESSDOWN))) {
> -				pr_debug("Send key: 0x%X - "
> -					 "Input layer keycode: %d\n",
> -					 key->code, key->keycode);
> -				sparse_keymap_report_entry(msi_wmi_input_dev,
> -						key, 1, true);
> -			}
> -		} else
> -			pr_info("Unknown key pressed - %x\n", eventcode);
> +			last_pressed =3D cur;
> +		}
> +
> +		if (key->type =3D=3D KE_KEY &&
> +		/* Brightness is served via acpi video driver */
> +		(backlight ||
> +		(key->code !=3D MSI_KEY_BRIGHTNESSUP &&
> +		key->code !=3D MSI_KEY_BRIGHTNESSDOWN))) {
> +			pr_debug("Send key: 0x%X - Input layer keycode: %d\n",
> +				 key->code, key->keycode);
> +			sparse_keymap_report_entry(msi_wmi_input_dev, key, 1,
> +						   true);
> +		}
>  	} else
>  		pr_info("Unknown event received\n");
> =20
> @@ -250,7 +251,7 @@ static int __init msi_wmi_input_setup(void)
>  	if (err)
>  		goto err_free_keymap;
> =20
> -	memset(last_pressed, 0, sizeof(last_pressed));
> +	last_pressed =3D ktime_set(0, 0);
> =20
>  	return 0;
> =20
> @@ -281,6 +282,7 @@ static int __init msi_wmi_init(void)
> =20
>  		pr_debug("Event handler installed\n");
>  		event_wmi_guid =3D MSIWMI_EVENT_GUID;
> +		quirk_last_pressed =3D true;
>  	}
> =20
>  	if (wmi_has_guid(MSIWMI_BIOS_GUID) && !acpi_video_backlight_support=
()) {
