From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/2] asus-laptop: remove unused variable
Date: Sat, 9 Apr 2016 20:21:21 -0700
Message-ID: <20160410032121.GD18689@dvhart-mobl5.amr.corp.intel.com>
References: <1460060401-20742-1-git-send-email-giedrius.statkevicius@gmail.com>
 <1460060401-20742-2-git-send-email-giedrius.statkevicius@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from [198.137.202.9] ([198.137.202.9]:51888 "EHLO
	bombadil.infradead.org" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750837AbcDJDYN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Apr 2016 23:24:13 -0400
Content-Disposition: inline
In-Reply-To: <1460060401-20742-2-git-send-email-giedrius.statkevicius@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 07, 2016 at 11:20:01PM +0300, Giedrius Statkevi=C4=8Dius wr=
ote:
> `out' was assigned value but it was never used so remove it
>=20
> Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gmai=
l.com>
> ---
>  drivers/platform/x86/asus-laptop.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index d86d42e..39ddcee 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -946,11 +946,8 @@ static ssize_t sysfs_acpi_set(struct asus_laptop=
 *asus,
>  			      const char *method)
>  {
>  	int rv, value;
> -	int out =3D 0;
> =20
>  	rv =3D parse_arg(buf, count, &value);
> -	if (rv > 0)
> -		out =3D value ? 1 : 0;
> =20
>  	if (write_acpi_int(asus->handle, method, value))

out is indeed unused, however the rv > 0 condition is relevant as <=3D0=
 will pass
value uninitialized to write_acpi_int.

--=20
Darren Hart
Intel Open Source Technology Center
