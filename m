From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch] platform/x86: mlx-platform: free first dev on error
Date: Sat, 7 Jan 2017 08:02:14 +0000
Message-ID: <AM5PR0501MB20972BB870D9EEE2139C5B99A2620@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <20170107063334.GF26959@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-he1eur01on0077.outbound.protection.outlook.com ([104.47.0.77]:30336
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932108AbdAGICS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Jan 2017 03:02:18 -0500
In-Reply-To: <20170107063334.GF26959@elgon.mountain>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Saturday, January 07, 2017 8:34 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: Darren Hart <dvhart@infradead.org>; platform-driver-
> x86@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [patch] platform/x86: mlx-platform: free first dev on error
>=20
> There is an off-by-one error so we don't unregister priv->pdev_mux[0].
> Also it's slightly simpler as a while loop instead of a for loop.
>=20
> Fixes: 58cbbee2391c ("x86/platform/mellanox: Introduce support for
> Mellanox systems platform")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20

Acked-by: Vadim Pasternak <vadimp@mellanox.com>

> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/m=
lx-
> platform.c
> index 04e1f2b30fa6..8f98c211b440 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -342,7 +342,7 @@ static int __init mlxplat_init(void)
>  	return 0;
>=20
>  fail_platform_mux_register:
> -	for (i--; i > 0 ; i--)
> +	while (--i >=3D 0)
>  		platform_device_unregister(priv->pdev_mux[i]);
>  	platform_device_unregister(priv->pdev_i2c);
>  fail_alloc:
