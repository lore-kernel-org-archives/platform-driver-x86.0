From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V4 3/5] misc/pvpanic: add MMIO support
Date: Wed, 31 Oct 2018 14:49:23 +0200
Message-ID: <CAHp75VewfhyeoAhfFkxjWm+ch_msCeDGqumOEzbawumx7aFjdQ@mail.gmail.com>
References: <1540993041-25611-1-git-send-email-peng.hao2@zte.com.cn> <1540993041-25611-3-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540993041-25611-3-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 31, 2018 at 7:27 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> On some architectures (e.g. arm64), it's preferable to use MMIO, since
> this can be used standalone. Add MMIO support to the pvpanic driver.

>         case ACPI_RESOURCE_TYPE_IO:
> -               port =3D res->data.io.minimum;
> +               if (acpi_dev_resource_io(res, &r))
> +                       base =3D (void __iomem *) ioport_map(r.start,
> +                                               r.end - r.start + 1);
> +               return AE_OK;
> +
> +       case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +               if (acpi_dev_resource_memory(res, &r))
> +                       base =3D ioremap(r.start, r.end - r.start + 1);
>                 return AE_OK;

You need to split this to two changes. First one converts existing
code to use acpi_dev_resource_io() and the rest does the rest.
Moreover, please, read carefully the code of those functions =E2=80=94 hint=
:
they check for resource type themselves.

> +       if (base)

Same question. At which conditions the base here can be NULL?

> +               iounmap(base);

--=20
With Best Regards,
Andy Shevchenko
