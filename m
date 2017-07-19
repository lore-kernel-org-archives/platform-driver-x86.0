From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] ibm_rtl: remove unnecessary static in ibm_rtl_write()
Date: Wed, 19 Jul 2017 21:12:00 +0300
Message-ID: <CAHp75VdrNGkCSEBU_m8wrWAZb2PRACxiQFEBovq1+2rnmfTFFw@mail.gmail.com>
References: <20170718220145.GA11460@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:32995 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932839AbdGSSMB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Jul 2017 14:12:01 -0400
In-Reply-To: <20170718220145.GA11460@embeddedgus>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 19, 2017 at 1:01 AM, Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> Remove unnecessary static on local variable cmd_port_val. Such variable
> is initialized before being used, on every execution path throughout
> the function. The static has no benefit and, removing it reduces the
> object file size.
>
> This issue was detected using Coccinelle and the following semantic patch:
> https://github.com/GustavoARSilva/coccinelle/blob/master/static/static_unused.cocci
>
> In the following log you can see a difference in the object file size.
> This log is the output of the size command, before and after the code
> change:
>
> before:
>    text    data     bss     dec     hex filename
>    3932 3440     512    7884    1ecc drivers/platform/x86/ibm_rtl.o
>
> after:
>    text    data     bss     dec     hex filename
>    3887    3384     448    7719    1e27 drivers/platform/x86/ibm_rtl.o
>

Pushed to testing, thanks,

> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/platform/x86/ibm_rtl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/ibm_rtl.c b/drivers/platform/x86/ibm_rtl.c
> index c62e5e1..610ac83 100644
> --- a/drivers/platform/x86/ibm_rtl.c
> +++ b/drivers/platform/x86/ibm_rtl.c
> @@ -103,7 +103,7 @@ static void rtl_port_unmap(void __iomem *addr)
>  static int ibm_rtl_write(u8 value)
>  {
>         int ret = 0, count = 0;
> -       static u32 cmd_port_val;
> +       u32 cmd_port_val;
>
>         RTL_DEBUG("%s(%d)\n", __func__, value);
>
> --
> 2.5.0
>



-- 
With Best Regards,
Andy Shevchenko
