From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 1/6] msi-laptop: Use proper return codes instead of -1
Date: Wed, 28 Nov 2012 10:07:02 +0800
Message-ID: <1354068422.21227.935.camel@linux-s257.site>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
	 <1353796141-1470-2-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:39068 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750961Ab2K1CIA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Nov 2012 21:08:00 -0500
In-Reply-To: <1353796141-1470-2-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, jlee@novell.com, mjg@redhat.com

=E6=96=BC =E6=97=A5=EF=BC=8C2012-11-25 =E6=96=BC 00:28 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Signed-off-by: Lee, Chun-Yi <jlee@suse.com>

Thanks for your patch!
Joey Lee

> ---
>  drivers/platform/x86/msi-laptop.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86=
/msi-laptop.c
> index 2111dbb..063113c 100644
> --- a/drivers/platform/x86/msi-laptop.c
> +++ b/drivers/platform/x86/msi-laptop.c
> @@ -198,7 +198,7 @@ static ssize_t set_device_state(const char *buf, =
size_t count, u8 mask)
>  	/* read current device state */
>  	result =3D ec_read(MSI_STANDARD_EC_COMMAND_ADDRESS, &rdata);
>  	if (result < 0)
> -		return -EINVAL;
> +		return result;
> =20
>  	if (!!(rdata & mask) !=3D status) {
>  		/* reverse device bit */
> @@ -209,7 +209,7 @@ static ssize_t set_device_state(const char *buf, =
size_t count, u8 mask)
> =20
>  		result =3D ec_write(MSI_STANDARD_EC_COMMAND_ADDRESS, wdata);
>  		if (result < 0)
> -			return -EINVAL;
> +			return result;
>  	}
> =20
>  	return count;
> @@ -222,7 +222,7 @@ static int get_wireless_state(int *wlan, int *blu=
etooth)
> =20
>  	result =3D ec_transaction(MSI_EC_COMMAND_WIRELESS, &wdata, 1, &rdat=
a, 1);
>  	if (result < 0)
> -		return -1;
> +		return result;
> =20
>  	if (wlan)
>  		*wlan =3D !!(rdata & 8);
> @@ -240,7 +240,7 @@ static int get_wireless_state_ec_standard(void)
> =20
>  	result =3D ec_read(MSI_STANDARD_EC_COMMAND_ADDRESS, &rdata);
>  	if (result < 0)
> -		return -1;
> +		return result;
> =20
>  	wlan_s =3D !!(rdata & MSI_STANDARD_EC_WLAN_MASK);
> =20
> @@ -258,7 +258,7 @@ static int get_threeg_exists(void)
> =20
>  	result =3D ec_read(MSI_STANDARD_EC_DEVICES_EXISTS_ADDRESS, &rdata);
>  	if (result < 0)
> -		return -1;
> +		return result;
> =20
>  	threeg_exists =3D !!(rdata & MSI_STANDARD_EC_3G_MASK);
> =20
> @@ -343,7 +343,7 @@ static ssize_t show_threeg(struct device *dev,
> =20
>  	/* old msi ec not support 3G */
>  	if (old_ec_model)
> -		return -1;
> +		return -ENODEV;
> =20
>  	ret =3D get_wireless_state_ec_standard();
>  	if (ret < 0)
