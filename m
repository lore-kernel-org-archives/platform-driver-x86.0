From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V2 2/4] misc/pvpanic: add MMIO support
Date: Wed, 24 Oct 2018 16:09:15 +0300
Message-ID: <CAHp75Ves+GCP8ZfOCXDcZNkyEo31hiPTyarRoYvhkjHeV+9dug@mail.gmail.com>
References: <1540401136-78500-1-git-send-email-peng.hao2@zte.com.cn> <1540401136-78500-2-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540401136-78500-2-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 24, 2018 at 12:02 PM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> On some architectures (e.g. arm64), it's preferable to use MMIO, since
> this can be used standalone. Add MMIO support to the pvpanic driver.
>

No global variables, please.

If your switch to ioreadxx()iowritexx() it would really help you here.

> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/pvpanic.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index fd86dab..bcfefdd 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -43,6 +43,8 @@
>
>  static u16 port;
>
> +static void __iomem *base;
> +
>  static struct acpi_driver pvpanic_driver = {
>         .name =         "pvpanic",
>         .class =        "QEMU",
> @@ -57,7 +59,10 @@
>  static void
>  pvpanic_send_event(unsigned int event)
>  {
> -       outb(event, port);
> +       if (port)
> +               outb(event, port);
> +       else if (base)
> +               writeb(event, base);
>  }
>
>  static int
> @@ -77,6 +82,8 @@
>  static acpi_status
>  pvpanic_walk_resources(struct acpi_resource *res, void *context)
>  {
> +       struct acpi_resource_fixed_memory32 *fixmem32;
> +
>         switch (res->type) {
>         case ACPI_RESOURCE_TYPE_END_TAG:
>                 return AE_OK;
> @@ -85,6 +92,11 @@
>                 port = res->data.io.minimum;
>                 return AE_OK;
>
> +       case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +               fixmem32 = &res->data.fixed_memory32;
> +               base = ioremap(fixmem32->address, fixmem32->address_length);
> +               return AE_OK;
> +
>         default:
>                 return AE_ERROR;
>         }
> @@ -104,7 +116,7 @@ static int pvpanic_add(struct acpi_device *device)
>         acpi_walk_resources(device->handle, METHOD_NAME__CRS,
>                             pvpanic_walk_resources, NULL);
>
> -       if (!port)
> +       if (!port && !base)
>                 return -ENODEV;
>
>         atomic_notifier_chain_register(&panic_notifier_list,
> @@ -118,6 +130,8 @@ static int pvpanic_remove(struct acpi_device *device)
>
>         atomic_notifier_chain_unregister(&panic_notifier_list,
>                                          &pvpanic_panic_nb);
> +       if (base)
> +               iounmap(base);
>         return 0;
>  }
>
> --
> 1.8.3.1
>


-- 
With Best Regards,
Andy Shevchenko
