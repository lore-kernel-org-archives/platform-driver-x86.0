From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/4] dell-laptop: Check return value of all SMBIOS calls
Date: Mon, 22 Jun 2015 11:26:48 -0700
Message-ID: <20150622182648.GC58421@vmdeb7>
References: <1434875967-13370-1-git-send-email-pali.rohar@gmail.com>
 <1434875967-13370-3-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:36038 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750861AbbFVS0m (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 22 Jun 2015 14:26:42 -0400
Content-Disposition: inline
In-Reply-To: <1434875967-13370-3-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jun 21, 2015 at 10:39:27AM +0200, Pali Roh=E1r wrote:
> Make sure that return value of all SMBIOS calls are properly checked =
and
> do not continue of processing (received) information if call failed.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> ---
>  drivers/platform/x86/dell-laptop.c |   61 ++++++++++++++++++++++++++=
+++++-----
>  1 file changed, 54 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x8=
6/dell-laptop.c

=2E..

> @@ -677,11 +690,16 @@ static const struct file_operations dell_debugf=
s_fops =3D {
>  static void dell_update_rfkill(struct work_struct *ignored)
>  {
>  	int status;
> +	int ret;
> =20
>  	get_buffer();
>  	dell_send_request(buffer, 17, 11);
> +	ret =3D buffer->output[0];
>  	status =3D buffer->output[1];

Parallel to previous blocks, you can release_buffer() here...

> =20
> +	if (ret !=3D 0)
> +		goto out;

And just return here

> +
>  	if (wifi_rfkill) {
>  		dell_rfkill_update_hw_state(wifi_rfkill, 1, status);
>  		dell_rfkill_update_sw_state(wifi_rfkill, 1, status);
> @@ -695,6 +713,7 @@ static void dell_update_rfkill(struct work_struct=
 *ignored)
>  		dell_rfkill_update_sw_state(wwan_rfkill, 3, status);
>  	}
> =20
> + out:

And drop this label.

>  	release_buffer();
>  }
>  static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
> @@ -755,13 +774,35 @@ static int __init dell_setup_rfkill(void)
>  		return 0;
> =20
>  	get_buffer();
> +
>  	dell_send_request(buffer, 17, 11);
> +	ret =3D buffer->output[0];
>  	status =3D buffer->output[1];
> +	if (ret !=3D 0) {
> +		/* dell wireless info smbios call is not working */
> +		/* so there is no support for rfkill */

Please follow coding style for multi-line comments.

> +		release_buffer();
> +		return 0;
> +	}
> +
>  	buffer->input[0] =3D 0x2;
>  	dell_send_request(buffer, 17, 11);
> +	ret =3D buffer->output[0];
>  	hwswitch_state =3D buffer->output[1];
> +
>  	release_buffer();
> =20
> +	if (ret !=3D 0) {

Just "if (ret)" is more typical

> +		/* dell wireless switch smbios call is not working */
> +		if (force_rfkill) {
> +			/* clear all hw-controlled bits */
> +			hwswitch_state &=3D ~7;
> +		} else {
> +			/* rfkill is only tested on laptops with a hwswitch */
> +			return 0;
> +		}

Save an additional indent block and all the braces with:

		/* rfkill is only tested on laptops with a hwswitch */
		if (!force_rfkill)
			return 0

		/* clear all hw-controlled bits */
		hwswitch_state &=3D ~7;


> +	}
> +
>  	if (!(status & BIT(0))) {
>  		if (force_rfkill) {
>  			/* No hwsitch, clear all hw-controlled bits */
> @@ -931,6 +972,8 @@ static int dell_send_intensity(struct backlight_d=
evice *bd)
>  	else
>  		dell_send_request(buffer, 1, 1);
> =20
> +	ret =3D dell_smi_error(buffer->output[0]);
> +
>   out:
>  	release_buffer();
>  	return ret;
> @@ -953,7 +996,10 @@ static int dell_get_intensity(struct backlight_d=
evice *bd)
>  	else
>  		dell_send_request(buffer, 0, 1);
> =20
> -	ret =3D buffer->output[1];
> +	if (buffer->output[0])
> +		ret =3D dell_smi_error(buffer->output[0]);
> +	else
> +		ret =3D buffer->output[1];

This is OK, but this block reverses the ret/status terms applied to out=
put[0]
and output[1] which is a little confusing.

> =20
>   out:
>  	release_buffer();
> @@ -2087,7 +2133,8 @@ static int __init dell_init(void)
>  	buffer->input[0] =3D find_token_location(BRIGHTNESS_TOKEN);
>  	if (buffer->input[0] !=3D -1) {
>  		dell_send_request(buffer, 0, 2);
> -		max_intensity =3D buffer->output[3];
> +		if (buffer->output[0] =3D=3D 0)
> +			max_intensity =3D buffer->output[3];
>  	}
>  	release_buffer();
> =20
> --=20
> 1.7.9.5
>=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center
