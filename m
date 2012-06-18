From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 3/5] acer-wmi: Use struct dev_pm_ops for power
 management
Date: Mon, 18 Jun 2012 14:56:38 +0800
Message-ID: <1340002598.6640.7.camel@linux-s257.site>
References: <201206172226.42729.rjw@sisk.pl>
	 <201206172228.59364.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201206172228.59364.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Joey Lee <jlee@novell.com>
List-Id: platform-driver-x86.vger.kernel.org

=E6=96=BC =E6=97=A5=EF=BC=8C2012-06-17 =E6=96=BC 22:28 +0200=EF=BC=8CRa=
fael J. Wysocki =E6=8F=90=E5=88=B0=EF=BC=9A
> From: Rafael J. Wysocki <rjw@sisk.pl>
>=20
> Make the acer-wmi driver define its PM callbacks through
> a struct dev_pm_ops object rather than by using legacy PM hooks
> in struct platform_driver.
>=20
> Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>

Patch good to me!

Tested on Acer TravelMate 4750

Tested-by: Lee, Chun-Yi <jlee@suse.com>


Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/acer-wmi.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> Index: linux/drivers/platform/x86/acer-wmi.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux.orig/drivers/platform/x86/acer-wmi.c
> +++ linux/drivers/platform/x86/acer-wmi.c
> @@ -1877,8 +1877,7 @@ static int acer_platform_remove(struct p
>  	return 0;
>  }
> =20
> -static int acer_platform_suspend(struct platform_device *dev,
> -pm_message_t state)
> +static int acer_suspend(struct device *dev)
>  {
>  	u32 value;
>  	struct acer_data *data =3D &interface->data;
> @@ -1900,7 +1899,7 @@ pm_message_t state)
>  	return 0;
>  }
> =20
> -static int acer_platform_resume(struct platform_device *device)
> +static int acer_resume(struct device *dev)
>  {
>  	struct acer_data *data =3D &interface->data;
> =20
> @@ -1916,6 +1915,8 @@ static int acer_platform_resume(struct p
>  	return 0;
>  }
> =20
> +static SIMPLE_DEV_PM_OPS(acer_pm, acer_suspend, acer_resume);
> +
>  static void acer_platform_shutdown(struct platform_device *device)
>  {
>  	struct acer_data *data =3D &interface->data;
> @@ -1931,11 +1932,10 @@ static struct platform_driver acer_platf
>  	.driver =3D {
>  		.name =3D "acer-wmi",
>  		.owner =3D THIS_MODULE,
> +		.pm =3D &acer_pm,
>  	},
>  	.probe =3D acer_platform_probe,
>  	.remove =3D acer_platform_remove,
> -	.suspend =3D acer_platform_suspend,
> -	.resume =3D acer_platform_resume,
>  	.shutdown =3D acer_platform_shutdown,
>  };
> =20
>=20
>=20
