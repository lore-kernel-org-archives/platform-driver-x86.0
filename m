From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V4 4/5] misc/pvpanic: add support to get pvpanic device
 info by FDT
Date: Mon, 29 Oct 2018 13:37:18 +0200
Message-ID: <CAHp75Vcz04Y7zakgYsV8VK566qbMgL6yVXCw9YH=0bnu6BWN6Q@mail.gmail.com>
References: <1540812743-1825-1-git-send-email-peng.hao2@zte.com.cn> <1540812743-1825-4-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540812743-1825-4-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 29, 2018 at 5:22 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> By default, when ACPI tables and FDT coexist for ARM64,
> current kernel takes precedence over FDT to get device information.
> Virt machine in qemu provides both FDT and ACPI table. This patch
> increases the way to get information through FDT.
>

This one looks good to me!
Though, see one comment below.

> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/pvpanic.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index cfd7fef..eb1ed0f 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -3,15 +3,19 @@
>   *  Pvpanic Device Support
>   *
>   *  Copyright (C) 2013 Fujitsu.
> + *  Copyright (C) 2018 ZTE.
>   */
>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> +#include <linux/platform_device.h>
> +#include <linux/of_address.h>
>  #include <linux/kernel.h>

>  #include <linux/module.h>
>  #include <linux/init.h>

Side note: one of the above is redundant (either it can be built as
module -> module.h or not -> init.h)

>  #include <linux/types.h>
>  #include <linux/acpi.h>
> +#include <linux/of.h>

I think alphabetical order is slightly better, though there are
developers who think differently.

>
>  MODULE_AUTHOR("Hu Tao <hutao@cn.fujitsu.com>");
>  MODULE_DESCRIPTION("pvpanic device driver");
> @@ -60,6 +64,32 @@
>         .priority = 1, /* let this called before broken drm_fb_helper */
>  };
>
> +static int pvpanic_mmio_probe(struct platform_device *pdev)
> +{
> +       struct resource *mem;
> +
> +       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!mem)
> +               return -EINVAL;
> +
> +       base = devm_ioremap_resource(&pdev->dev, mem);
> +       if (base == NULL)
> +               return -EFAULT;
> +
> +       atomic_notifier_chain_register(&panic_notifier_list,
> +                                      &pvpanic_panic_nb);
> +
> +       return 0;
> +}
> +
> +static int pvpanic_mmio_remove(struct platform_device *pdev)
> +{
> +
> +       atomic_notifier_chain_unregister(&panic_notifier_list,
> +                                        &pvpanic_panic_nb);
> +
> +       return 0;
> +}
>
>  static acpi_status
>  pvpanic_walk_resources(struct acpi_resource *res, void *context)
> @@ -118,4 +148,35 @@ static int pvpanic_remove(struct acpi_device *device)
>         return 0;
>  }
>
> -module_acpi_driver(pvpanic_driver);
> +static const struct of_device_id pvpanic_mmio_match[] = {
> +       { .compatible = "qemu,pvpanic-mmio", },
> +       {}
> +};
> +
> +static struct platform_driver pvpanic_mmio_driver = {
> +       .driver = {
> +               .name = "pvpanic-mmio",
> +               .of_match_table = pvpanic_mmio_match,
> +       },
> +       .probe = pvpanic_mmio_probe,
> +       .remove = pvpanic_mmio_remove,
> +};
> +
> +static int __init pvpanic_mmio_init(void)
> +{
> +       if (acpi_disabled)
> +               return platform_driver_register(&pvpanic_mmio_driver);
> +       else
> +               return acpi_bus_register_driver(&pvpanic_driver);
> +}
> +
> +static void __exit pvpanic_mmio_exit(void)
> +{
> +       if (acpi_disabled)
> +               platform_driver_unregister(&pvpanic_mmio_driver);
> +       else
> +               acpi_bus_unregister_driver(&pvpanic_driver);
> +}
> +
> +module_init(pvpanic_mmio_init);
> +module_exit(pvpanic_mmio_exit);
> --
> 1.8.3.1
>


-- 
With Best Regards,
Andy Shevchenko
