From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V7 3/9] misc/pvpanic: add MMIO support
Date: Mon, 5 Nov 2018 14:55:03 +0200
Message-ID: <CAHp75VeJHjYUNz-O83qm1m8JZtW5t9JJDKxKRpbLtPYXr2VbnQ@mail.gmail.com>
References: <1541414431-84128-1-git-send-email-peng.hao2@zte.com.cn> <1541414431-84128-3-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541414431-84128-3-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 5, 2018 at 4:31 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> On some architectures (e.g. arm64), it's preferable to use MMIO, since
> this can be used standalone. Add MMIO support to the pvpanic driver.

Thanks for an update, looks quite good, though couple of comments below.

>         if (acpi_dev_resource_io(res, &r)) {
> -               port = r.start;

> +               base = (void __iomem *) ioport_map(r.start,
> +                                       r.end - r.start + 1);

I'm so sorry I didn't notice this stuff.

1. ioport_map() already returns void __iomem *. No need to cast.
2. To calculate resource size we have a helper macro resource_size().

> +               return AE_OK;
> +       } else if (acpi_dev_resource_memory(res, &r)) {
> +               base = ioremap(r.start, r.end - r.start + 1);

Ditto for the size calculation.

>                 return AE_OK;


-- 
With Best Regards,
Andy Shevchenko
