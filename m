From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH] platform/mellanox: Use 2-factor allocator calls
Date: Wed, 4 Jul 2018 19:39:24 +0000
Message-ID: <HE1PR0502MB3753318D0C380DFEBCD6E452A2410@HE1PR0502MB3753.eurprd05.prod.outlook.com>
References: <20180704172908.GA33650@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704172908.GA33650@beast>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Kees Cook [mailto:keescook@chromium.org]
> Sent: Wednesday, July 04, 2018 8:29 PM
> To: Darren Hart <dvhart@infradead.org>
> Cc: Vadim Pasternak <vadimp@mellanox.com>; Andy Shevchenko
> <andy@infradead.org>; platform-driver-x86@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH] platform/mellanox: Use 2-factor allocator calls
>=20
> As already done treewide, switch from open-coded multiplication to using =
2-
> factor allocation helpers.
>=20
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Vadim Pasternak <vadimp@mellanox.com>

> ---
>  drivers/platform/mellanox/mlxreg-io.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/mellanox/mlxreg-io.c
> b/drivers/platform/mellanox/mlxreg-io.c
> index c192dfe6bd65..acfaf64ffde6 100644
> --- a/drivers/platform/mellanox/mlxreg-io.c
> +++ b/drivers/platform/mellanox/mlxreg-io.c
> @@ -152,8 +152,8 @@ static int mlxreg_io_attr_init(struct mlxreg_io_priv_=
data
> *priv)  {
>  	int i;
>=20
> -	priv->group.attrs =3D devm_kzalloc(&priv->pdev->dev,
> -					 priv->pdata->counter *
> +	priv->group.attrs =3D devm_kcalloc(&priv->pdev->dev,
> +					 priv->pdata->counter,
>  					 sizeof(struct attribute *),
>  					 GFP_KERNEL);
>  	if (!priv->group.attrs)
> --
> 2.17.1
>=20
>=20
> --
> Kees Cook
> Pixel Security
