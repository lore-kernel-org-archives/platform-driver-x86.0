From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V5 6/8] misc/pvpanic: add MMIO support
Date: Thu, 1 Nov 2018 19:04:00 +0200
Message-ID: <CAHp75VfNDKgenuc0ApMODfCw6h9azwBDskPuV2S4E8nLFsuTxw@mail.gmail.com>
References: <1541085002-42993-1-git-send-email-peng.hao2@zte.com.cn> <1541085002-42993-6-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541085002-42993-6-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 1, 2018 at 9:00 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> On some architectures (e.g. arm64), it's preferable to use MMIO, since
> this can be used standalone. Add MMIO support to the pvpanic driver.

> -       if (acpi_dev_resource_io(res, &r) {
> -               port = r.start;
> +       if (acpi_dev_resource_io(res, &r) ||
> +           acpi_dev_resource_memory(res, &r)) {


> +               if (r.flags & IORESOURCE_IO)

You need spend some time to understand better how acpi_dev_resource_*() works.
Hint: this condition is redundant.

> +                       base = (void __iomem *) ioport_map(r.start,
> +                                               r.end - r.start + 1);
> +               else
> +                       base = ioremap(r.start, r.end - r.start + 1);
> +


-- 
With Best Regards,
Andy Shevchenko
