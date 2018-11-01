From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V5 5/8] misc/pvpanic: simplify the code using acpi_dev_resource_io
Date: Thu, 1 Nov 2018 15:44:33 +0200
Message-ID: <CAHp75VdPmh7KAD-TKVnO7dZf7-mvWBH1osq6+DAq08MhJz-hhQ@mail.gmail.com>
References: <1541085002-42993-1-git-send-email-peng.hao2@zte.com.cn> <1541085002-42993-5-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541085002-42993-5-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 1, 2018 at 9:00 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> use acpi_dev_resource_io API.
>

Same comments as per patch 1.
This should be patch 2/8 in the series.

Otherwise,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Also, you might consider to use Suggested-by tag here.

> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/pvpanic.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index 0bcf1cd..c20fdff 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -64,17 +64,15 @@
>  static acpi_status
>  pvpanic_walk_resources(struct acpi_resource *res, void *context)
>  {
> -       switch (res->type) {
> -       case ACPI_RESOURCE_TYPE_END_TAG:
> -               return AE_OK;
> +       struct resource r;
>
> -       case ACPI_RESOURCE_TYPE_IO:
> -               port = res->data.io.minimum;
> +       if (acpi_dev_resource_io(res, &r)) {
> +               port = r.start;
>                 return AE_OK;
> -
> -       default:
> -               return AE_ERROR;
>         }
> +
> +       return AE_ERROR;
> +
>  }
>
>  static int pvpanic_add(struct acpi_device *device)
> --
> 1.8.3.1
>


-- 
With Best Regards,
Andy Shevchenko
