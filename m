From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH] platform/x86: mlx-platform: Fix an ERR_PTR vs NULL issue
Date: Tue, 6 Feb 2018 12:55:58 +0000
Message-ID: <AM4PR05MB3330D53BBA5BD43AF7EE6D7DA2FD0@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <20180206124536.GA9445@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0075.outbound.protection.outlook.com ([104.47.2.75]:4929
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752833AbeBFM4B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Feb 2018 07:56:01 -0500
In-Reply-To: <20180206124536.GA9445@mwanda>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, February 06, 2018 2:46 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: Darren Hart <dvhart@infradead.org>; Andy Shevchenko
> <andy@infradead.org>; platform-driver-x86@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH] platform/x86: mlx-platform: Fix an ERR_PTR vs NULL issue
>=20
> devm_ioport_map() returns NULL on error but we accidentally check for err=
or
> pointers instead.
>=20
> Fixes: c6acad68eb2d ("platform/mellanox: mlxreg-hotplug: Modify to use a
> regmap interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Vadim Pasternak <vadimp@melanox.com>

>=20
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/m=
lx-
> platform.c
> index dfecba4407ac..27de29961f5e 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -522,8 +522,8 @@ static int __init mlxplat_init(void)
>=20
>  	mlxplat_mlxcpld_regmap_ctx.base =3D devm_ioport_map(&mlxplat_dev-
> >dev,
>  			       mlxplat_lpc_resources[1].start, 1);
> -	if (IS_ERR(mlxplat_mlxcpld_regmap_ctx.base)) {
> -		err =3D PTR_ERR(mlxplat_mlxcpld_regmap_ctx.base);
> +	if (!mlxplat_mlxcpld_regmap_ctx.base) {
> +		err =3D -ENOMEM;
>  		goto fail_platform_mux_register;
>  	}
>=20
