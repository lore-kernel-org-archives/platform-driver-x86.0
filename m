From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 2/2] msi-laptop: Use struct dev_pm_ops for power
 management
Date: Fri, 06 Jul 2012 15:24:40 +0800
Message-ID: <1341559480.4823.176.camel@linux-s257.site>
References: <201206302356.11014.rjw@sisk.pl>
	 <201206302357.43405.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from charybdis-ext.suse.de ([195.135.221.2]:45949 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750829Ab2GFHvd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Jul 2012 03:51:33 -0400
In-Reply-To: <201206302357.43405.rjw@sisk.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, LKML <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Frank Seidel <frank@f-seidel.de>, "Lee, Chun-Yi" <jlee@novell.com>

=E6=96=BC =E5=85=AD=EF=BC=8C2012-06-30 =E6=96=BC 23:57 +0200=EF=BC=8CRa=
fael J. Wysocki =E6=8F=90=E5=88=B0=EF=BC=9A
> From: Rafael J. Wysocki <rjw@sisk.pl>
>=20
> Make the msi-laptop driver define its PM callbacks through
> a struct dev_pm_ops object rather than by using legacy PM hooks
> in struct platform_driver.
>=20
> Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>


This patch good to me.

Acked-by: Lee, Chun-Yi <jlee@suse.com>


Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/msi-laptop.c |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> Index: linux/drivers/platform/x86/msi-laptop.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux.orig/drivers/platform/x86/msi-laptop.c
> +++ linux/drivers/platform/x86/msi-laptop.c
> @@ -85,7 +85,8 @@
>  #define MSI_STANDARD_EC_TOUCHPAD_ADDRESS	0xe4
>  #define MSI_STANDARD_EC_TOUCHPAD_MASK		(1 << 4)
> =20
> -static int msi_laptop_resume(struct platform_device *device);
> +static int msi_laptop_resume(struct device *device);
> +static SIMPLE_DEV_PM_OPS(msi_laptop_pm, NULL, msi_laptop_resume);
> =20
>  #define MSI_STANDARD_EC_DEVICES_EXISTS_ADDRESS	0x2f
> =20
> @@ -437,8 +438,8 @@ static struct platform_driver msipf_driv
>  	.driver =3D {
>  		.name =3D "msi-laptop-pf",
>  		.owner =3D THIS_MODULE,
> +		.pm =3D &msi_laptop_pm,
>  	},
> -	.resume =3D msi_laptop_resume,
>  };
> =20
>  static struct platform_device *msipf_device;
> @@ -752,7 +753,7 @@ err_bluetooth:
>  	return retval;
>  }
> =20
> -static int msi_laptop_resume(struct platform_device *device)
> +static int msi_laptop_resume(struct device *device)
>  {
>  	u8 data;
>  	int result;
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>=20
