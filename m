From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V3 3/5] misc/pvpanic: add MMIO support
Date: Mon, 29 Oct 2018 12:30:23 +0200
Message-ID: <CAHp75VfxyNSCcDL=ZnDOipnKBQYAms7_BGRmMdEbCAb184ujuA@mail.gmail.com>
References: <1540812743-1825-1-git-send-email-peng.hao2@zte.com.cn> <1540812743-1825-3-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540812743-1825-3-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 29, 2018 at 5:22 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> On some architectures (e.g. arm64), it's preferable to use MMIO, since
> this can be used standalone. Add MMIO support to the pvpanic driver.

>  pvpanic_walk_resources(struct acpi_resource *res, void *context)
>  {
> +       struct acpi_resource_fixed_memory32 *fixmem32;
> +
>         switch (res->type) {
>         case ACPI_RESOURCE_TYPE_END_TAG:
>                 return AE_OK;
>
>         case ACPI_RESOURCE_TYPE_IO:
> -               port = res->data.io.minimum;
> +               base = (void __iomem *) ioport_map(res->data.io.minimum, 1);
> +               return AE_OK;
> +
> +       case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +               fixmem32 = &res->data.fixed_memory32;
> +               base = ioremap(fixmem32->address, fixmem32->address_length);
>                 return AE_OK;

Ouch. Sorry, I forgot to look at this previously.

This should be converted to use
acpi_dev_resource_io()
acpi_dev_resource_memory()

-- 
With Best Regards,
Andy Shevchenko
