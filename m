From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V4 4/5] misc/pvpanic: add support to get pvpanic device
 info by FDT
Date: Wed, 31 Oct 2018 14:53:38 +0200
Message-ID: <CAHp75VeQD7xEUyR=Vwk78R3Ld2OfBzL=mkKQF9YLO0nKJyJ6zA@mail.gmail.com>
References: <1540993041-25611-1-git-send-email-peng.hao2@zte.com.cn> <1540993041-25611-4-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540993041-25611-4-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 31, 2018 at 7:27 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> By default, when ACPI tables and FDT coexist for ARM64,
> current kernel takes precedence over FDT to get device information.
> Virt machine in qemu provides both FDT and ACPI table. This patch
> increases the way to get information through FDT.

> @@ -3,15 +3,18 @@

>   *  Copyright (C) 2013 Fujitsu.
> + *  Copyright (C) 2018 ZTE.

> +#include <linux/acpi.h>
...
> -#include <linux/acpi.h>

> -       { "", 0 },
> +       { "", 0 }

These changes regarding to style should go in a separate patch.

>  #include <linux/module.h>
> -#include <linux/init.h>

This one also in a separate patch.

So, the one should be split to three AFAICS.

-- 
With Best Regards,
Andy Shevchenko
