From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 2/2] asus-laptop: correct error handling in
 sysfs_acpi_set
Date: Mon, 25 Apr 2016 10:47:32 -0700
Message-ID: <20160425174732.GE2115@f23x64.localdomain>
References: <1460764917-1042-1-git-send-email-giedrius.statkevicius@gmail.com>
 <1460764917-1042-2-git-send-email-giedrius.statkevicius@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41039 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754558AbcDYRrd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Apr 2016 13:47:33 -0400
Content-Disposition: inline
In-Reply-To: <1460764917-1042-2-git-send-email-giedrius.statkevicius@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 16, 2016 at 03:01:57AM +0300, Giedrius Statkevi=C4=8Dius wr=
ote:
> Properly return rv back to the caller in the case of an error in
> parse_arg. In the process remove a unused variable 'out'.
>=20
> Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gmai=
l.com>

1 and 2 queued for 4.7.

> ---
>  drivers/platform/x86/asus-laptop.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index d86d42e..9a69734 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -946,11 +946,10 @@ static ssize_t sysfs_acpi_set(struct asus_lapto=
p *asus,
>  			      const char *method)
>  {
>  	int rv, value;
> -	int out =3D 0;
> =20
>  	rv =3D parse_arg(buf, count, &value);
> -	if (rv > 0)
> -		out =3D value ? 1 : 0;
> +	if (rv <=3D 0)
> +		return rv;
> =20
>  	if (write_acpi_int(asus->handle, method, value))
>  		return -ENODEV;
> --=20
> 2.8.0
>=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center
