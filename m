From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V5 3/8] misc/pvpanic: revmove unnecessary header file
Date: Thu, 1 Nov 2018 15:41:24 +0200
Message-ID: <CAHp75Vfb4iUNJoUKj2T58yP2iCcObLiS3rWxpvoupmRH-qJw2g@mail.gmail.com>
References: <1541085002-42993-1-git-send-email-peng.hao2@zte.com.cn> <1541085002-42993-3-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541085002-42993-3-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 1, 2018 at 9:00 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> remove unnecessary header file init.h.
>

Same comments as per patch 1, on top of this is ordering issue. This
patch should be 6/8.
Also, address Mark's comments, please.

Otherwise,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/pvpanic.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index 059005c..66534d4 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -22,7 +22,6 @@
>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/init.h>
>  #include <linux/types.h>
>  #include <linux/acpi.h>
>
> --
> 1.8.3.1
>


-- 
With Best Regards,
Andy Shevchenko
