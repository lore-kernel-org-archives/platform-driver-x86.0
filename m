From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH] acer-wmi: deactive mail led when power off
Date: Sun, 27 Feb 2011 10:29:04 +0000
Message-ID: <201102271029.05177.carlos@strangeworlds.co.uk>
References: <AANLkTinMFGRJkcLgLgNgf7M4fe1yyNJVeqJdX8qh=hec@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:43101 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750746Ab1B0K3V convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Feb 2011 05:29:21 -0500
Received: by wwb22 with SMTP id 22so2001877wwb.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Feb 2011 02:29:20 -0800 (PST)
In-Reply-To: <AANLkTinMFGRJkcLgLgNgf7M4fe1yyNJVeqJdX8qh=hec@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Saturday 26 Feb 2011 20:18:58 Pali Roh=C3=A1r wrote:
> This patch deactive mail led when laptop is going to hibernete/suspen=
d
> or power off. After resume from hibernate/suspend correctly restore
> mail led state.
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> Tested-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>=20
> --- a/drivers/platform/x86/acer-wmi.c/acer-wmi.c	2011-01-30
> 00:28:04.000000000 +0100
> +++ b/drivers/platform/x86/acer-wmi.c/acer-wmi.c	2011-01-30
> 01:30:02.000000000 +0100
> @@ -887,6 +887,7 @@ static int __devinit acer_led_init(struc
>=20
>  static void acer_led_exit(void)
>  {
> +	set_u32(LED_OFF, ACER_CAP_MAILLED);
>  	led_classdev_unregister(&mail_led);
>  }
>=20
> @@ -1166,6 +1167,7 @@ pm_message_t state)
>=20
>  	if (has_cap(ACER_CAP_MAILLED)) {
>  		get_u32(&value, ACER_CAP_MAILLED);
> +		set_u32(LED_OFF, ACER_CAP_MAILLED);
>  		data->mailled =3D value;
>  	}
>=20
> @@ -1193,6 +1195,17 @@ static int acer_platform_resume(struct p
>  	return 0;
>  }
>=20
> +static void acer_platform_shutdown(struct platform_device *device)
> +{
> +	struct acer_data *data =3D &interface->data;
> +
> +	if (!data)
> +		return;
> +
> +	if (has_cap(ACER_CAP_MAILLED))
> +		set_u32(LED_OFF, ACER_CAP_MAILLED);
> +}
> +
>  static struct platform_driver acer_platform_driver =3D {
>  	.driver =3D {
>  		.name =3D "acer-wmi",
> @@ -1202,6 +1215,7 @@ static struct platform_driver acer_platf
>  	.remove =3D acer_platform_remove,
>  	.suspend =3D acer_platform_suspend,
>  	.resume =3D acer_platform_resume,
> +	.shutdown =3D acer_platform_shutdown,
>  };
>=20
>  static struct platform_device *acer_platform_device;
>=20
>=20
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com
