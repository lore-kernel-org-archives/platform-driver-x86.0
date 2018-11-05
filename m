From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V7 5/9] misc/pvpanic: add support to get pvpanic device
 info by FDT
Date: Mon, 5 Nov 2018 14:58:14 +0200
Message-ID: <CAHp75VfP4d0fK9NDbAcHqy4aqTiMGTKBX5VQ36QbSyhRzrpOSQ@mail.gmail.com>
References: <1541414431-84128-1-git-send-email-peng.hao2@zte.com.cn> <1541414431-84128-5-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541414431-84128-5-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 5, 2018 at 4:31 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> By default, when ACPI tables and FDT coexist for ARM64,
> current kernel takes precedence over FDT to get device information.
> Virt machine in qemu provides both FDT and ACPI table. Increases the
> way to get information through FDT.

> +#include <linux/acpi.h>
> +#include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
>  #include <linux/types.h>
> -#include <linux/acpi.h>

Adding new headers in this change is okay, while shuffling them is
logically a separate change.

-- 
With Best Regards,
Andy Shevchenko
