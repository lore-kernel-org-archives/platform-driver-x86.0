From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 1/2] ACER: Fix up sparse warning
Date: Fri, 06 Jul 2012 18:22:31 +0800
Message-ID: <1341570151.4823.372.camel@linux-s257.site>
References: <1341444610-15067-1-git-send-email-marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from nat.nue.novell.com ([195.135.221.2]:58005 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755829Ab2GFKXT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Jul 2012 06:23:19 -0400
In-Reply-To: <1341444610-15067-1-git-send-email-marex@denx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Fengguang Wu <wfg@linux.intel.com>

=E6=96=BC =E5=9B=9B=EF=BC=8C2012-07-05 =E6=96=BC 01:30 +0200=EF=BC=8CMa=
rek Vasut =E6=8F=90=E5=88=B0=EF=BC=9A
> drivers/platform/x86/acer-wmi.c:1836:18: sparse: Using plain integer =
as NULL pointer
>=20
> drivers/platform/x86/acer-wmi.c:1836:
>   1833
>   1834          BUG_ON(!name || !ah);
>   1835
> > 1836          handle =3D 0;
>   1837          status =3D acpi_get_devices(prop, acer_wmi_get_handle=
_cb,
>   1838                                          (void *)name, &handle=
);
>   1839
>=20
> Reported-by: Fengguang Wu <wfg@linux.intel.com>
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Matthew Garrett <mjg59@srcf.ucam.org>
> Cc: Fengguang Wu <wfg@linux.intel.com>
> Cc: joeyli <jlee@suse.com>


Acked-by: joeyli <jlee@suse.com>


Thanks
Joey Lee

> ---
>  drivers/platform/x86/acer-wmi.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index 175809d..ae969fd 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1833,7 +1833,7 @@ static int __init acer_wmi_get_handle(const cha=
r *name, const char *prop,
> =20
>  	BUG_ON(!name || !ah);
> =20
> -	handle =3D 0;
> +	handle =3D NULL;
>  	status =3D acpi_get_devices(prop, acer_wmi_get_handle_cb,
>  					(void *)name, &handle);
> =20
