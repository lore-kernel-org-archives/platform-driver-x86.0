From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V7 9/9] misc/pvpanic: remove a redundant comma
Date: Mon, 5 Nov 2018 15:02:11 +0200
Message-ID: <CAHp75VcShwubDc0Mxkygs=zyVCJbztQeGjmpCmGEkT6uXzsELg@mail.gmail.com>
References: <1541414431-84128-1-git-send-email-peng.hao2@zte.com.cn> <1541414431-84128-9-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541414431-84128-9-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 5, 2018 at 4:31 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> Remove a redundant comma in pvpanic_device_ids.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/pvpanic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index f416c01..8c4bfa6 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -29,7 +29,7 @@
>
>  static const struct acpi_device_id pvpanic_device_ids[] = {
>         { "QEMU0001", 0 },
> -       { "", 0 },
> +       { "", 0 }
>  };
>  MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
>
> --
> 1.8.3.1
>


-- 
With Best Regards,
Andy Shevchenko
