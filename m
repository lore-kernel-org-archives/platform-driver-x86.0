From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V4 1/5] pvpanic: move pvpanic to misc as common driver
Date: Wed, 31 Oct 2018 14:45:21 +0200
Message-ID: <CAHp75Ve4JhTbEFTYKWCx2DS80NKPXZJ8GDiamEFLq3vPCgVvzw@mail.gmail.com>
References: <1540993041-25611-1-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540993041-25611-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 31, 2018 at 7:27 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> move pvpanic.c from drivers/platform/x86 to drivers/misc.
> following patches will use pvpanic device in arm64.

> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -1,3 +1,6 @@
> +if ARM64
> +source "drivers/platform/arm/Kconfig"
> +endif
>  if X86
>  source "drivers/platform/x86/Kconfig"
>  endif
> diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
> index 4b2ce58..232231c 100644
> --- a/drivers/platform/Makefile
> +++ b/drivers/platform/Makefile
> @@ -3,6 +3,7 @@
>  # Makefile for linux/drivers/platform
>  #
>
> +obj-$(CONFIG_ARM64)               +=3D arm/
>  obj-$(CONFIG_X86)              +=3D x86/
>  obj-$(CONFIG_MELLANOX_PLATFORM)        +=3D mellanox/
>  obj-$(CONFIG_MIPS)             +=3D mips/

I'm not sure:
a) how it's related to the rest in this patch (should be split I suppose);
b) how come arm64->arm replacement =E2=80=94 are platform drivers independe=
nt
from the (ARM) architecture?

--=20
With Best Regards,
Andy Shevchenko
