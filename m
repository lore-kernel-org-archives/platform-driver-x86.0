From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V2 3/4] misc/pvpanic: add support to pvpanic device
 information by using FDT
Date: Wed, 24 Oct 2018 16:12:47 +0300
Message-ID: <CAHp75VfQQEsn8J_PWsET_ux-SagOVzavwo6Gy6EHQxuRD=78AQ@mail.gmail.com>
References: <1540401136-78500-1-git-send-email-peng.hao2@zte.com.cn> <1540401136-78500-3-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540401136-78500-3-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 24, 2018 at 12:02 PM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> By default, when ACPI tables and FDT coexist for ARM64,
> current kernel takes precedence over FDT to get device information.
> This patch increases the way to get information through FDT.

>   *  pvpanic.c - pvpanic Device Support
>   *
>   *  Copyright (C) 2013 Fujitsu.
> + *  Copyright (C) 2018 ZTE.
>   *
>   *  This program is free software; you can redistribute it and/or modify
>   *  it under the terms of the GNU General Public License as published by

This hunk would be a separate patch which includes switch to SPDX and
removing the file name from the file itself.

> @@ -25,6 +26,10 @@
>  #include <linux/init.h>
>  #include <linux/types.h>
>  #include <linux/acpi.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>

> +#include <asm/virt.h>

asm/* goes after linux/*

> +#include <linux/platform_device.h>

Better to keep sorted.

> +       if (!mem)
> +               return -EINVAL;
> +
> +       if (!devm_request_mem_region(&pdev->dev, mem->start,
> +                                    resource_size(mem), pdev->name))
> +               return -EBUSY;
> +
> +       base = devm_ioremap(&pdev->dev, mem->start,
> +                           resource_size(mem));
> +       if (base == NULL)
> +               return -EFAULT;

devm_ioremap_resource()

> +static const struct of_device_id pvpanic_mmio_match[] = {
> +       { .compatible = "qemu,pvpanic-mmio", },
> +       {},

terminators better w/o comma.

> +};

-- 
With Best Regards,
Andy Shevchenko
