From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V8 09/11] misc/pvpanic: change header file sort style
Date: Tue, 6 Nov 2018 12:02:12 +0200
Message-ID: <CAHp75Vd_Zs+DJrxNQ1r3YWhfxYpENZAENtnU+9Qi8mVvzSsCsg@mail.gmail.com>
References: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn> <1541516242-98568-9-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541516242-98568-9-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 6, 2018 at 8:47 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> Make header files alphabetical order.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/pvpanic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index 479f7ba..e365604 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -21,13 +21,13 @@
>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> +#include <linux/acpi.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/types.h>
> -#include <linux/acpi.h>
>
>  static void __iomem *base;
>
> --
> 1.8.3.1
>


-- 
With Best Regards,
Andy Shevchenko
