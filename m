From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH -next] x86/platform/mellanox: Fix return value check in
 mlxplat_init()
Date: Sat, 24 Sep 2016 13:33:10 +0000
Message-ID: <AM5PR0501MB2097CFD6DD2DE78FAB00E2FDA2CB0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1474717693-6191-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0087.outbound.protection.outlook.com ([104.47.2.87]:22848
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S934504AbcIXQGP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 24 Sep 2016 12:06:15 -0400
In-Reply-To: <1474717693-6191-1-git-send-email-weiyj.lk@gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Wei Yongjun <weiyj.lk@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, "x86@kernel.org" <x86@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>



> -----Original Message-----
> From: Wei Yongjun [mailto:weiyj.lk@gmail.com]
> Sent: Saturday, September 24, 2016 2:48 PM
> To: Vadim Pasternak <vadimp@mellanox.com>; Thomas Gleixner
> <tglx@linutronix.de>; Ingo Molnar <mingo@redhat.com>; H. Peter Anvin
> <hpa@zytor.com>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; x86@kernel.org; platform-
> driver-x86@vger.kernel.org
> Subject: [PATCH -next] x86/platform/mellanox: Fix return value check in
> mlxplat_init()
>=20
> From: Wei Yongjun <weiyongjun1@huawei.com>
>=20
> In case of error, the function platform_device_register_simple() returns
> ERR_PTR() and never returns NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
>=20
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  arch/x86/platform/mellanox/mlx-platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/x86/platform/mellanox/mlx-platform.c
> b/arch/x86/platform/mellanox/mlx-platform.c
> index e1dc152..7dcfcca 100644
> --- a/arch/x86/platform/mellanox/mlx-platform.c
> +++ b/arch/x86/platform/mellanox/mlx-platform.c
> @@ -200,8 +200,8 @@ static int __init mlxplat_init(void)
>  					mlxplat_lpc_resources,
>  					ARRAY_SIZE(mlxplat_lpc_resources));
>=20
> -	if (!mlxplat_dev)
> -		return -ENOMEM;
> +	if (IS_ERR(mlxplat_dev))
> +		return PTR_ERR(mlxplat_dev);
>=20

Acked-by: Vadim Pasternak <vadimp@mellanox.com>

>  	priv =3D devm_kzalloc(&mlxplat_dev->dev, sizeof(struct mlxplat_priv),
>  			    GFP_KERNEL);
