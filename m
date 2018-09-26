From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH] platform/x86: mlx-platform: Properly use
 mlxplat_mlxcpld_msn201x_items
Date: Wed, 26 Sep 2018 07:43:22 +0000
Message-ID: <DB5PR05MB1640104C32067C3BE43CA529A2150@DB5PR05MB1640.eurprd05.prod.outlook.com>
References: <20180926052115.21223-1-natechancellor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926052115.21223-1-natechancellor@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Nathan Chancellor <natechancellor@gmail.com>
> Sent: Wednesday, September 26, 2018 8:21 AM
> To: Vadim Pasternak <vadimp@mellanox.com>; Darren Hart
> <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>
> Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org; Na=
than
> Chancellor <natechancellor@gmail.com>
> Subject: [PATCH] platform/x86: mlx-platform: Properly use
> mlxplat_mlxcpld_msn201x_items
>=20
> Clang warns that mlxplat_mlxcpld_msn201x_items is not going to be emitted=
 in
> the final assembly because it's only used in ARRAY_SIZE right now, which =
is a
> compile time evaluation since the array's size is known.
>=20
> drivers/platform/x86/mlx-platform.c:555:32: warning: variable
> 'mlxplat_mlxcpld_msn201x_items' is not needed and will not be emitted [-
> Wunneeded-internal-declaration] static struct mlxreg_core_item
> mlxplat_mlxcpld_msn201x_items[] =3D {
>                                ^
> 1 warning generated.
>=20
> It appears this was a copy and paste mistake from when this item was firs=
t
> added. Use the definition in mlxplat_mlxcpld_msn201x_data so that Clang n=
o
> longer warns.
>=20
> Link: https://github.com/ClangBuiltLinux/linux/issues/141
> Fixes: a49a41482f61 ("platform/x86: mlx-platform: Add support for new
> msn201x system type")
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---

Acked-by: Vadim Pasternak <vadimp@mellanox.com>

>  drivers/platform/x86/mlx-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/m=
lx-
> platform.c
> index d89936c93ba0..c2c3a1a19879 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -575,7 +575,7 @@ static struct mlxreg_core_item
> mlxplat_mlxcpld_msn201x_items[] =3D {
>=20
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn201x_data =
=3D {
> -	.items =3D mlxplat_mlxcpld_msn21xx_items,
> +	.items =3D mlxplat_mlxcpld_msn201x_items,
>  	.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_msn201x_items),
>  	.cell =3D MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
>  	.mask =3D MLXPLAT_CPLD_AGGR_MASK_DEF,
> --
> 2.19.0
