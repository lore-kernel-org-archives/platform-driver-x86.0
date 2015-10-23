From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Fri, 23 Oct 2015 13:14:45 +0200
Message-ID: <20151023111445.GH15219@pali>
References: <20151022085117.GQ15219@pali>
 <5628BDF8.9030506@gmail.com>
 <20151022105018.GX15219@pali>
 <5628C069.8040902@gmail.com>
 <20151022130211.GA110029@vmdeb7>
 <5628E812.2070708@gmail.com>
 <20151022141710.GD15219@pali>
 <56297148.6060605@gmail.com>
 <20151023090027.GG15219@pali>
 <562A022D.1020302@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:35283 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092AbbJWLOs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Oct 2015 07:14:48 -0400
Received: by wicll6 with SMTP id ll6so26543703wic.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2015 04:14:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <562A022D.1020302@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On Friday 23 October 2015 11:47:25 Gabriele Mazzotta wrote:
> >In my opinion it is better to ignore user key press after resume, if=
 it
> >fix our problem. Better as false-positive event.
>=20
> The following appears to work really well. The notification arrives
> before rbtn_resume() has been executed, so the extra event is ignored=
=2E
>=20
> diff --git a/drivers/platform/x86/dell-rbtn.c
> b/drivers/platform/x86/dell-rbtn.c
> index cd410e3..1d64b72 100644
> --- a/drivers/platform/x86/dell-rbtn.c
> +++ b/drivers/platform/x86/dell-rbtn.c
> @@ -28,6 +28,7 @@ struct rbtn_data {
>  	enum rbtn_type type;
>  	struct rfkill *rfkill;
>  	struct input_dev *input_dev;
> +	bool suspended;
>  };
>=20
>=20
> @@ -220,9 +221,33 @@ static const struct acpi_device_id rbtn_ids[] =3D=
 {
>  	{ "", 0 },
>  };
>=20
> +#ifdef CONFIG_PM_SLEEP
> +static int rbtn_suspend(struct device *dev)
> +{
> +	struct acpi_device *device =3D to_acpi_device(dev);
> +	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> +
> +	rbtn_data->suspended =3D true;
> +
> +	return 0;
> +}
> +
> +static int rbtn_resume(struct device *dev)
> +{
> +	struct acpi_device *device =3D to_acpi_device(dev);
> +	struct rbtn_data *rbtn_data =3D acpi_driver_data(device);
> +
> +	rbtn_data->suspended =3D false;
> +
> +	return 0;
> +}
> +#endif
> +static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_resume);
> +
>  static struct acpi_driver rbtn_driver =3D {
>  	.name =3D "dell-rbtn",
>  	.ids =3D rbtn_ids,
> +	.drv.pm =3D &rbtn_pm_ops,
>  	.ops =3D {
>  		.add =3D rbtn_add,
>  		.remove =3D rbtn_remove,
> @@ -384,6 +409,9 @@ static void rbtn_notify(struct acpi_device *devic=
e, u32
> event)
>  {
>  	struct rbtn_data *rbtn_data =3D device->driver_data;
>=20
> +	if (rbtn_data->suspended)
> +		return;
> +
>  	if (event !=3D 0x80) {
>  		dev_info(&device->dev, "Received unknown event (0x%x)\n",
>  			 event);
>=20

Great, but is not there a better way to turn off .notify ACPI function
when that ACPI device is suspended?

Is not this ACPI device driver bug that it allows to call .notify metho=
d
even if device is suspended?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
