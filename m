From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [patch v3 1/1] platform/x86: move module mlx-platform from
 arch/x86 to drivers/platform/x86
Date: Wed, 14 Dec 2016 03:38:38 +0200
Message-ID: <CAHp75Vf3r55fg_T2yGmut5ubr_8QZ1NYmYAbons1+ic0sfjA3g@mail.gmail.com>
References: <1477898553-61392-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:33067 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753149AbcLNBik (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Dec 2016 20:38:40 -0500
In-Reply-To: <1477898553-61392-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, platform-driver-x86@vger.kernel.org, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Mon, Oct 31, 2016 at 9:22 AM, Vadim Pasternak <vadimp@mellanox.com> wrote:
> Since mlx-platform is not an architectural driver, it is moved out
> of arch/x86/platform to drivers/platform/x86.
> Relevant Makefile and Kconfig are updated.

Pushed to testing with fixed Subject (Pattern is "platform/x86:
driver: Description").
Thanks.

>
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
> v2->v3:
>  Comments pointed out by Andy:
>   - Remove "driver" prefix from the subject;
>   - Change subject content;
>   - Reduce CC list;
>   - Put patch history exactly after '---' marker;
>   - Remove reference to module name from module header;
>   - Explain changes in Kconfig:
>     remove "depends on MLX_PLATFORM", since it has default n and this line
>         is not needed;
>   Fixes added by Vadim:
>   - Remove "select MLX_PLATFORM" from Kconfig, since it has unmet direct
>     dependencies (X86 && X86_PLATFORM_DEVICES && X86_64);
> v1->v2:
>  Comments pointed out by Andy:
>   - Use -M -C -n option in git format-patch;
> ---
>  MAINTAINERS                                                 |  2 +-
>  arch/x86/Kconfig                                            | 12 ------------
>  arch/x86/platform/Makefile                                  |  1 -
>  arch/x86/platform/mellanox/Makefile                         |  1 -
>  drivers/platform/x86/Kconfig                                | 13 ++++++++++++-
>  drivers/platform/x86/Makefile                               |  1 +
>  .../mellanox => drivers/platform/x86}/mlx-platform.c        |  1 -
>  7 files changed, 14 insertions(+), 17 deletions(-)
>  delete mode 100644 arch/x86/platform/mellanox/Makefile
>  rename {arch/x86/platform/mellanox => drivers/platform/x86}/mlx-platform.c (99%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3e30399..960f364f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7879,7 +7879,7 @@ MELLANOX PLATFORM DRIVER
>  M:      Vadim Pasternak <vadimp@mellanox.com>
>  L:      platform-driver-x86@vger.kernel.org
>  S:      Supported
> -F:      arch/x86/platform/mellanox/mlx-platform.c
> +F:      drivers/platform/x86/mlx-platform.c
>
>  MELLANOX MLX CPLD HOTPLUG DRIVER
>  M:     Vadim Pasternak <vadimp@mellanox.com>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index bada636..ccd5ff7 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -550,18 +550,6 @@ config X86_INTEL_QUARK
>           Say Y here if you have a Quark based system such as the Arduino
>           compatible Intel Galileo.
>
> -config MLX_PLATFORM
> -       tristate "Mellanox Technologies platform support"
> -       depends on X86_64
> -       depends on X86_EXTENDED_PLATFORM
> -       ---help---
> -         This option enables system support for the Mellanox Technologies
> -         platform.
> -
> -         Say Y here if you are building a kernel for Mellanox system.
> -
> -         Otherwise, say N.
> -
>  config X86_INTEL_LPSS
>         bool "Intel Low Power Subsystem Support"
>         depends on X86 && ACPI
> diff --git a/arch/x86/platform/Makefile b/arch/x86/platform/Makefile
> index 3c3c19e..184842e 100644
> --- a/arch/x86/platform/Makefile
> +++ b/arch/x86/platform/Makefile
> @@ -8,7 +8,6 @@ obj-y   += iris/
>  obj-y  += intel/
>  obj-y  += intel-mid/
>  obj-y  += intel-quark/
> -obj-y  += mellanox/
>  obj-y  += olpc/
>  obj-y  += scx200/
>  obj-y  += sfi/
> diff --git a/arch/x86/platform/mellanox/Makefile b/arch/x86/platform/mellanox/Makefile
> deleted file mode 100644
> index f43c931..0000000
> --- a/arch/x86/platform/mellanox/Makefile
> +++ /dev/null
> @@ -1 +0,0 @@
> -obj-$(CONFIG_MLX_PLATFORM)     += mlx-platform.o
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 1853769..4639d97 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1028,10 +1028,21 @@ config INTEL_TELEMETRY
>           directly via debugfs files. Various tools may use
>           this interface for SoC state monitoring.
>
> +config MLX_PLATFORM
> +       tristate "Mellanox Technologies platform support"
> +       depends on X86_64
> +       ---help---
> +         This option enables system support for the Mellanox Technologies
> +         platform. The Mellanox systems provide data center networking
> +         solutions based on Virtual Protocol Interconnect (VPI) technology
> +         enable seamless connectivity to 56/100Gb/s InfiniBand or 10/40/56GbE
> +         connection.
> +
> +         If you have a Mellanox system, say Y or M here.
> +
>  config MLX_CPLD_PLATFORM
>         tristate "Mellanox platform hotplug driver support"
>         default n
> -       depends on MLX_PLATFORM
>         select HWMON
>         select I2C
>         ---help---
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 1f06b63..2d6a587 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -71,4 +71,5 @@ obj-$(CONFIG_INTEL_TELEMETRY) += intel_telemetry_core.o \
>                                    intel_telemetry_pltdrv.o \
>                                    intel_telemetry_debugfs.o
>  obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
> +obj-$(CONFIG_MLX_PLATFORM)     += mlx-platform.o
>  obj-$(CONFIG_MLX_CPLD_PLATFORM)        += mlxcpld-hotplug.o
> diff --git a/arch/x86/platform/mellanox/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> similarity index 99%
> rename from arch/x86/platform/mellanox/mlx-platform.c
> rename to drivers/platform/x86/mlx-platform.c
> index 7dcfcca..bbf60d1 100644
> --- a/arch/x86/platform/mellanox/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -1,5 +1,4 @@
>  /*
> - * arch/x86/platform/mellanox/mlx-platform.c
>   * Copyright (c) 2016 Mellanox Technologies. All rights reserved.
>   * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
>   *
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With Best Regards,
Andy Shevchenko
