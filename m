From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: mlx-platform: Properly use mlxplat_mlxcpld_msn201x_items
Date: Fri, 19 Oct 2018 14:38:17 +0300
Message-ID: <CAHp75VeS0sodYAY_OTfi8HvLvaE8eHHv1JL9BGoLxrsxwzBnSA@mail.gmail.com>
References: <20180926052115.21223-1-natechancellor@gmail.com> <DB5PR05MB1640104C32067C3BE43CA529A2150@DB5PR05MB1640.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB5PR05MB1640104C32067C3BE43CA529A2150@DB5PR05MB1640.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: natechancellor@gmail.com, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 26, 2018 at 10:43 AM Vadim Pasternak <vadimp@mellanox.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Nathan Chancellor <natechancellor@gmail.com>
> > Sent: Wednesday, September 26, 2018 8:21 AM
> > To: Vadim Pasternak <vadimp@mellanox.com>; Darren Hart
> > <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>
> > Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org; Nathan
> > Chancellor <natechancellor@gmail.com>
> > Subject: [PATCH] platform/x86: mlx-platform: Properly use
> > mlxplat_mlxcpld_msn201x_items
> >
> > Clang warns that mlxplat_mlxcpld_msn201x_items is not going to be emitted in
> > the final assembly because it's only used in ARRAY_SIZE right now, which is a
> > compile time evaluation since the array's size is known.
> >
> > drivers/platform/x86/mlx-platform.c:555:32: warning: variable
> > 'mlxplat_mlxcpld_msn201x_items' is not needed and will not be emitted [-
> > Wunneeded-internal-declaration] static struct mlxreg_core_item
> > mlxplat_mlxcpld_msn201x_items[] = {
> >                                ^
> > 1 warning generated.
> >
> > It appears this was a copy and paste mistake from when this item was first
> > added. Use the definition in mlxplat_mlxcpld_msn201x_data so that Clang no
> > longer warns.
> >

Pushed and applied, thanks!

> > Link: https://github.com/ClangBuiltLinux/linux/issues/141
> > Fixes: a49a41482f61 ("platform/x86: mlx-platform: Add support for new
> > msn201x system type")
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
>
> Acked-by: Vadim Pasternak <vadimp@mellanox.com>
>
> >  drivers/platform/x86/mlx-platform.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-
> > platform.c
> > index d89936c93ba0..c2c3a1a19879 100644
> > --- a/drivers/platform/x86/mlx-platform.c
> > +++ b/drivers/platform/x86/mlx-platform.c
> > @@ -575,7 +575,7 @@ static struct mlxreg_core_item
> > mlxplat_mlxcpld_msn201x_items[] = {
> >
> >  static
> >  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn201x_data = {
> > -     .items = mlxplat_mlxcpld_msn21xx_items,
> > +     .items = mlxplat_mlxcpld_msn201x_items,
> >       .counter = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_items),
> >       .cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
> >       .mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
> > --
> > 2.19.0
>


-- 
With Best Regards,
Andy Shevchenko
