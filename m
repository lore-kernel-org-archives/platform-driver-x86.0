From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH platform-next v1 4/9] platform/x86: mlx-platform: Cosmetic changes
Date: Thu, 9 Jan 2020 17:16:13 +0200
Message-ID: <CAHp75VfJL8o1=5tVkicnMXUJ+Ry9q2r3oGD1x-B7Om_5Dvnkig@mail.gmail.com>
References: <20191231102917.24181-1-vadimp@mellanox.com> <20191231102917.24181-5-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191231102917.24181-5-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 31, 2019 at 12:29 PM Vadim Pasternak <vadimp@mellanox.com> wrote:
>
> Remove redundant semicolons at the end of few functions.
>

Sounds like this can be patch in the beginning of the series.
(Taking into account any bug fixes that have to prepend all the rest,
like Documentation fix)

> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/platform/x86/mlx-platform.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index aed6ac18074e..7e92dc52071f 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -1918,7 +1918,7 @@ static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
>         mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
>
>         return 1;
> -};
> +}
>
>  static int __init mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
>  {
> @@ -1937,7 +1937,7 @@ static int __init mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
>         mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
>
>         return 1;
> -};
> +}
>
>  static int __init mlxplat_dmi_msn274x_matched(const struct dmi_system_id *dmi)
>  {
> @@ -1956,7 +1956,7 @@ static int __init mlxplat_dmi_msn274x_matched(const struct dmi_system_id *dmi)
>         mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
>
>         return 1;
> -};
> +}
>
>  static int __init mlxplat_dmi_msn201x_matched(const struct dmi_system_id *dmi)
>  {
> @@ -1975,7 +1975,7 @@ static int __init mlxplat_dmi_msn201x_matched(const struct dmi_system_id *dmi)
>         mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
>
>         return 1;
> -};
> +}
>
>  static int __init mlxplat_dmi_qmb7xx_matched(const struct dmi_system_id *dmi)
>  {
> @@ -1998,7 +1998,7 @@ static int __init mlxplat_dmi_qmb7xx_matched(const struct dmi_system_id *dmi)
>         mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng;
>
>         return 1;
> -};
> +}
>
>  static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
>         {
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
