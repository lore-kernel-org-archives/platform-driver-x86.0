From: joeyli <jlee@suse.com>
Subject: Re: [PATCH v3 09/12] msi-wmi: Use enums for scancodes
Date: Mon, 10 Dec 2012 14:01:30 +0800
Message-ID: <1355119290.21227.1842.camel@linux-s257.site>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
	 <1354888162-12109-10-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:49302 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092Ab2LJGCq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Dec 2012 01:02:46 -0500
In-Reply-To: <1354888162-12109-10-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, anisse@astier.eu

=E6=96=BC =E4=BA=94=EF=BC=8C2012-12-07 =E6=96=BC 15:49 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> Use enums for consecutive scancodes, rename key names from MSI_WMI_* =
to
> MSI_KEY_* and use tabs for whitespace in msi_wmi_keymap.
>=20
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Acked-by: Lee, Chun-Yi <jlee@suse.com>

Thanks
Joey Lee

> ---
>  drivers/platform/x86/msi-wmi.c | 34 ++++++++++++++++++--------------=
--
>  1 file changed, 18 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/ms=
i-wmi.c
> index 4db0c55..112ec14 100644
> --- a/drivers/platform/x86/msi-wmi.c
> +++ b/drivers/platform/x86/msi-wmi.c
> @@ -42,19 +42,21 @@ MODULE_LICENSE("GPL");
>  MODULE_ALIAS("wmi:" MSIWMI_BIOS_GUID);
>  MODULE_ALIAS("wmi:" MSIWMI_EVENT_GUID);
> =20
> -#define SCANCODE_BASE 0xD0
> -#define MSI_WMI_BRIGHTNESSUP   SCANCODE_BASE
> -#define MSI_WMI_BRIGHTNESSDOWN (SCANCODE_BASE + 1)
> -#define MSI_WMI_VOLUMEUP       (SCANCODE_BASE + 2)
> -#define MSI_WMI_VOLUMEDOWN     (SCANCODE_BASE + 3)
> -#define MSI_WMI_MUTE           (SCANCODE_BASE + 4)
> +enum msi_scancodes {
> +	MSI_SCANCODE_BASE	=3D 0xD0,
> +	MSI_KEY_BRIGHTNESSUP	=3D MSI_SCANCODE_BASE,
> +	MSI_KEY_BRIGHTNESSDOWN,
> +	MSI_KEY_VOLUMEUP,
> +	MSI_KEY_VOLUMEDOWN,
> +	MSI_KEY_MUTE,
> +};
>  static struct key_entry msi_wmi_keymap[] =3D {
> -	{ KE_KEY, MSI_WMI_BRIGHTNESSUP,   {KEY_BRIGHTNESSUP} },
> -	{ KE_KEY, MSI_WMI_BRIGHTNESSDOWN, {KEY_BRIGHTNESSDOWN} },
> -	{ KE_KEY, MSI_WMI_VOLUMEUP,       {KEY_VOLUMEUP} },
> -	{ KE_KEY, MSI_WMI_VOLUMEDOWN,     {KEY_VOLUMEDOWN} },
> -	{ KE_KEY, MSI_WMI_MUTE,           {KEY_MUTE} },
> -	{ KE_END, 0}
> +	{ KE_KEY, MSI_KEY_BRIGHTNESSUP,		{KEY_BRIGHTNESSUP} },
> +	{ KE_KEY, MSI_KEY_BRIGHTNESSDOWN,	{KEY_BRIGHTNESSDOWN} },
> +	{ KE_KEY, MSI_KEY_VOLUMEUP,		{KEY_VOLUMEUP} },
> +	{ KE_KEY, MSI_KEY_VOLUMEDOWN,		{KEY_VOLUMEDOWN} },
> +	{ KE_KEY, MSI_KEY_MUTE,			{KEY_MUTE} },
> +	{ KE_END, 0 }
>  };
>  static ktime_t last_pressed[ARRAY_SIZE(msi_wmi_keymap) - 1];
> =20
> @@ -169,7 +171,7 @@ static void msi_wmi_notify(u32 value, void *conte=
xt)
>  			ktime_t diff;
>  			cur =3D ktime_get_real();
>  			diff =3D ktime_sub(cur, last_pressed[key->code -
> -					SCANCODE_BASE]);
> +					MSI_SCANCODE_BASE]);
>  			/* Ignore event if the same event happened in a 50 ms
>  			   timeframe -> Key press may result in 10-20 GPEs */
>  			if (ktime_to_us(diff) < 1000 * 50) {
> @@ -178,13 +180,13 @@ static void msi_wmi_notify(u32 value, void *con=
text)
>  					 key->code, ktime_to_us(diff));
>  				goto msi_wmi_notify_exit;
>  			}
> -			last_pressed[key->code - SCANCODE_BASE] =3D cur;
> +			last_pressed[key->code - MSI_SCANCODE_BASE] =3D cur;
> =20
>  			if (key->type =3D=3D KE_KEY &&
>  			/* Brightness is served via acpi video driver */
>  			(!acpi_video_backlight_support() ||
> -			(key->code !=3D MSI_WMI_BRIGHTNESSUP &&
> -			key->code !=3D MSI_WMI_BRIGHTNESSDOWN))) {
> +			(key->code !=3D MSI_KEY_BRIGHTNESSUP &&
> +			key->code !=3D MSI_KEY_BRIGHTNESSDOWN))) {
>  				pr_debug("Send key: 0x%X - "
>  					 "Input layer keycode: %d\n",
>  					 key->code, key->keycode);
