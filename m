From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: fix kbd_get_state's request
 value
Date: Sun, 11 Feb 2018 23:49:09 +0100
Message-ID: <20180211224909.vwyfuszqeud6tdv7@pali>
References: <20180211002010.GA3311@laszlth>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wgbxvvs3m6obrc3v"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:55618 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932168AbeBKWtM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Feb 2018 17:49:12 -0500
Received: by mail-wm0-f66.google.com with SMTP id 143so6479446wma.5
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Feb 2018 14:49:11 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20180211002010.GA3311@laszlth>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Laszlo Toth <laszlth@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>


--wgbxvvs3m6obrc3v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sunday 11 February 2018 01:20:10 Laszlo Toth wrote:
> Commit 9862b43624a5 ("platform/x86: dell-laptop: Allocate buffer on heap
> rather than globally")
> broke one request, changed it back to the original value.
>=20
> Merged fill_request and send_request as they're used in pairs anyway so
> it's easier to check and harder to change the request values by mistake
> again.
>=20
> Tested on a Dell E6540, backlight came back.
>=20
> Signed-off-by: Laszlo Toth <laszlth@gmail.com>
> ---
>  drivers/platform/x86/dell-laptop.c | 117 ++++++++++++++++++++-----------=
------
>  1 file changed, 65 insertions(+), 52 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/de=
ll-laptop.c
> index 2a68f59..30e6987 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -321,20 +321,17 @@ static const struct dmi_system_id dell_quirks[] __i=
nitconst =3D {
>  	{ }
>  };
> =20
> -static void dell_fill_request(struct calling_interface_buffer *buffer,
> -			       u32 arg0, u32 arg1, u32 arg2, u32 arg3)
> +static int dell_send_request(struct calling_interface_buffer *buffer,
> +			     u16 class, u16 select,
> +			     u32 arg0, u32 arg1, u32 arg2, u32 arg3)

Hi! Please do not create a function with infinite parameters. Seven
parameters is really to big number. It reminds me Win32 API where
functions have 10 parameters and in most cases they are called with lot
of NULLs or zeros. And this patch is very similar.

You say that this fixes bug. Which? I'm really lost in this big patch
and do not see it.

Also making mistake in function with 7 parameters is easier as in
function with less arguments. Its hard to read which parameter is what
doing and also to figure out if order of parameters is correct.

>  {
> +	int ret;
> +
>  	memset(buffer, 0, sizeof(struct calling_interface_buffer));
>  	buffer->input[0] =3D arg0;
>  	buffer->input[1] =3D arg1;
>  	buffer->input[2] =3D arg2;
>  	buffer->input[3] =3D arg3;
> -}
> -
> -static int dell_send_request(struct calling_interface_buffer *buffer,
> -			     u16 class, u16 select)
> -{
> -	int ret;
> =20
>  	buffer->cmd_class =3D class;
>  	buffer->cmd_select =3D select;
> @@ -474,14 +471,16 @@ static int dell_rfkill_set(void *data, bool blocked)
>  	int status;
>  	int ret;
> =20
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
> -	ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret =3D dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0, 0, 0);
>  	if (ret)
>  		return ret;
>  	status =3D buffer.output[1];
> =20
> -	dell_fill_request(&buffer, 0x2, 0, 0, 0);
> -	ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret =3D dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0x2, 0, 0, 0);
>  	if (ret)
>  		return ret;
>  	hwswitch =3D buffer.output[1];
> @@ -492,8 +491,9 @@ static int dell_rfkill_set(void *data, bool blocked)
>  	    (status & BIT(0)) && !(status & BIT(16)))
>  		disable =3D 1;
> =20
> -	dell_fill_request(&buffer, 1 | (radio<<8) | (disable << 16), 0, 0, 0);
> -	ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret =3D dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				1 | (radio << 8) | (disable << 16), 0, 0, 0);
>  	return ret;
>  }
> =20
> @@ -504,9 +504,9 @@ static void dell_rfkill_update_sw_state(struct rfkill=
 *rfkill, int radio,
>  		/* Has hw-switch, sync sw_state to BIOS */
>  		struct calling_interface_buffer buffer;
>  		int block =3D rfkill_blocked(rfkill);
> -		dell_fill_request(&buffer,
> -				   1 | (radio << 8) | (block << 16), 0, 0, 0);
> -		dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +		dell_send_request(&buffer,
> +				  CLASS_INFO, SELECT_RFKILL,
> +				  1 | (radio << 8) | (block << 16), 0, 0, 0);
>  	} else {
>  		/* No hw-switch, sync BIOS state to sw_state */
>  		rfkill_set_sw_state(rfkill, !!(status & BIT(radio + 16)));
> @@ -528,16 +528,18 @@ static void dell_rfkill_query(struct rfkill *rfkill=
, void *data)
>  	int status;
>  	int ret;
> =20
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
> -	ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret =3D dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0, 0, 0);
>  	status =3D buffer.output[1];
> =20
>  	if (ret !=3D 0 || !(status & BIT(0))) {
>  		return;
>  	}
> =20
> -	dell_fill_request(&buffer, 0, 0x2, 0, 0);
> -	ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret =3D dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0x2, 0, 0);
>  	hwswitch =3D buffer.output[1];
> =20
>  	if (ret !=3D 0)
> @@ -561,14 +563,16 @@ static int dell_debugfs_show(struct seq_file *s, vo=
id *data)
>  	int status;
>  	int ret;
> =20
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
> -	ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret =3D dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0, 0, 0);
>  	if (ret)
>  		return ret;
>  	status =3D buffer.output[1];
> =20
> -	dell_fill_request(&buffer, 0, 0x2, 0, 0);
> -	hwswitch_ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	hwswitch_ret =3D dell_send_request(&buffer,
> +					 CLASS_INFO, SELECT_RFKILL,
> +					 0, 0x2, 0, 0);
>  	if (hwswitch_ret)
>  		return hwswitch_ret;
>  	hwswitch_state =3D buffer.output[1];
> @@ -645,15 +649,17 @@ static void dell_update_rfkill(struct work_struct *=
ignored)
>  	int status;
>  	int ret;
> =20
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
> -	ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret =3D dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0, 0, 0);
>  	status =3D buffer.output[1];
> =20
>  	if (ret !=3D 0)
>  		return;
> =20
> -	dell_fill_request(&buffer, 0, 0x2, 0, 0);
> -	ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret =3D dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0x2, 0, 0);
> =20
>  	if (ret =3D=3D 0 && (status & BIT(0)))
>  		hwswitch =3D buffer.output[1];
> @@ -730,8 +736,9 @@ static int __init dell_setup_rfkill(void)
>  	if (!force_rfkill && !whitelisted)
>  		return 0;
> =20
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
> -	ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +	ret =3D dell_send_request(&buffer,
> +				CLASS_INFO, SELECT_RFKILL,
> +				0, 0, 0, 0);
>  	status =3D buffer.output[1];
> =20
>  	/* dell wireless info smbios call is not supported */
> @@ -893,14 +900,16 @@ static int dell_send_intensity(struct backlight_dev=
ice *bd)
>  	if (!token)
>  		return -ENODEV;
> =20
> -	dell_fill_request(&buffer,
> -			   token->location, bd->props.brightness, 0, 0);
>  	if (power_supply_is_system_supplied() > 0)
>  		ret =3D dell_send_request(&buffer,
> -					CLASS_TOKEN_WRITE, SELECT_TOKEN_AC);
> +					CLASS_TOKEN_WRITE, SELECT_TOKEN_AC,
> +					token->location, bd->props.brightness,
> +					0, 0);
>  	else
>  		ret =3D dell_send_request(&buffer,
> -					CLASS_TOKEN_WRITE, SELECT_TOKEN_BAT);
> +					CLASS_TOKEN_WRITE, SELECT_TOKEN_BAT,
> +					token->location, bd->props.brightness,
> +					0, 0);
> =20
>  	return ret;
>  }
> @@ -915,13 +924,14 @@ static int dell_get_intensity(struct backlight_devi=
ce *bd)
>  	if (!token)
>  		return -ENODEV;
> =20
> -	dell_fill_request(&buffer, token->location, 0, 0, 0);
>  	if (power_supply_is_system_supplied() > 0)
>  		ret =3D dell_send_request(&buffer,
> -					CLASS_TOKEN_READ, SELECT_TOKEN_AC);
> +					CLASS_TOKEN_READ, SELECT_TOKEN_AC,
> +					token->location, 0, 0, 0);
>  	else
>  		ret =3D dell_send_request(&buffer,
> -					CLASS_TOKEN_READ, SELECT_TOKEN_BAT);
> +					CLASS_TOKEN_READ, SELECT_TOKEN_BAT,
> +					token->location, 0, 0, 0);
> =20
>  	if (ret =3D=3D 0)
>  		ret =3D buffer.output[1];
> @@ -1194,9 +1204,9 @@ static int kbd_get_info(struct kbd_info *info)
>  	u8 units;
>  	int ret;
> =20
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
>  	ret =3D dell_send_request(&buffer,
> -				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT);
> +				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT,
> +				0, 0, 0, 0);
>  	if (ret)
>  		return ret;
> =20
> @@ -1279,9 +1289,9 @@ static int kbd_get_state(struct kbd_state *state)
>  	struct calling_interface_buffer buffer;
>  	int ret;
> =20
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
>  	ret =3D dell_send_request(&buffer,
> -				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT);
> +				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT,
> +				0x1, 0, 0, 0);
>  	if (ret)
>  		return ret;
> =20
> @@ -1316,9 +1326,9 @@ static int kbd_set_state(struct kbd_state *state)
>  	input2 |=3D (state->level & 0xFF) << 16;
>  	input2 |=3D (state->timeout_value_ac & 0x3F) << 24;
>  	input2 |=3D (state->timeout_unit_ac & 0x3) << 30;
> -	dell_fill_request(&buffer, 0x2, input1, input2, 0);
>  	ret =3D dell_send_request(&buffer,
> -				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT);
> +				CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT,
> +				0x2, input1, input2, 0);
> =20
>  	return ret;
>  }
> @@ -1356,8 +1366,9 @@ static int kbd_set_token_bit(u8 bit)
>  	if (!token)
>  		return -EINVAL;
> =20
> -	dell_fill_request(&buffer, token->location, token->value, 0, 0);
> -	ret =3D dell_send_request(&buffer, CLASS_TOKEN_WRITE, SELECT_TOKEN_STD);
> +	ret =3D dell_send_request(&buffer,
> +				CLASS_TOKEN_WRITE, SELECT_TOKEN_STD,
> +				token->location, token->value, 0, 0);
> =20
>  	return ret;
>  }
> @@ -1376,8 +1387,9 @@ static int kbd_get_token_bit(u8 bit)
>  	if (!token)
>  		return -EINVAL;
> =20
> -	dell_fill_request(&buffer, token->location, 0, 0, 0);
> -	ret =3D dell_send_request(&buffer, CLASS_TOKEN_READ, SELECT_TOKEN_STD);
> +	ret =3D dell_send_request(&buffer,
> +				CLASS_TOKEN_READ, SELECT_TOKEN_STD,
> +				token->location, 0, 0, 0);
>  	val =3D buffer.output[1];
> =20
>  	if (ret)
> @@ -2127,8 +2139,9 @@ int dell_micmute_led_set(int state)
>  	if (!token)
>  		return -ENODEV;
> =20
> -	dell_fill_request(&buffer, token->location, token->value, 0, 0);
> -	dell_send_request(&buffer, CLASS_TOKEN_WRITE, SELECT_TOKEN_STD);
> +	dell_send_request(&buffer,
> +			  CLASS_TOKEN_WRITE, SELECT_TOKEN_STD,
> +			  token->location, token->value, 0, 0);
> =20
>  	return state;
>  }
> @@ -2185,9 +2198,9 @@ static int __init dell_init(void)
>  	if (token) {
>  		struct calling_interface_buffer buffer;
> =20
> -		dell_fill_request(&buffer, token->location, 0, 0, 0);
>  		ret =3D dell_send_request(&buffer,
> -					CLASS_TOKEN_READ, SELECT_TOKEN_AC);
> +					CLASS_TOKEN_READ, SELECT_TOKEN_AC,
> +					token->location, 0, 0, 0);
>  		if (ret)
>  			max_intensity =3D buffer.output[3];
>  	}

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--wgbxvvs3m6obrc3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCWoDIYwAKCRCL8Mk9A+RD
UpooAJ9rDsmovo6joIEg2jczjMx3i6va0gCfbHL2nnLJQ2GFzKF1xSCGdn7K6lc=
=VKp9
-----END PGP SIGNATURE-----

--wgbxvvs3m6obrc3v--
