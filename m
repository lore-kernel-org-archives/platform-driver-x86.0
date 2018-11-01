From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V5 1/8] pvpanic: move pvpanic to misc as common driver
Date: Thu, 1 Nov 2018 15:10:40 +0200
Message-ID: <CAHp75VeLikOzXrdZ4zP_Ccr8DGx81hdhLRTdUrLJ85NPo3DHDw@mail.gmail.com>
References: <1541085002-42993-1-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541085002-42993-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, hutao@cn.fujitsu.com, Linux Documentation List <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 1, 2018 at 8:59 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> move pvpanic.c from drivers/platform/x86 to drivers/misc.
> following patches will use pvpanic device in arm64.

There are few items you need to address in the next revision:
- use proper English grammar, i.e. Capitalize beginning of sentenses
- don't forget the tags people gave you in case you didn't (much) change a patch

Other than that, this one looks good to me

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

P.S. WRT tags this one in v6 should have something like:
...

Reviewed-by: me
Acked-by: Mark
Signed-off-by: you

at the end of commit message

>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/Kconfig                     | 8 +++++++
>  drivers/misc/Makefile                    | 1 +
>  drivers/{platform/x86 => misc}/pvpanic.c | 0
>  drivers/platform/x86/Kconfig             | 8 --------
>  drivers/platform/x86/Makefile            | 1 -
>  5 files changed, 9 insertions(+), 9 deletions(-)
>  rename drivers/{platform/x86 => misc}/pvpanic.c (100%)
>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 3726eac..1ba0f62 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -513,6 +513,14 @@ config MISC_RTSX
>         tristate
>         default MISC_RTSX_PCI || MISC_RTSX_USB
>
> +config PVPANIC
> +       tristate "pvpanic device support"
> +       depends on ACPI || OF
> +       help
> +         This driver provides support for the pvpanic device.  pvpanic is
> +         a paravirtualized device provided by QEMU; it lets a virtual machine
> +         (guest) communicate panic events to the host.
> +
>  source "drivers/misc/c2port/Kconfig"
>  source "drivers/misc/eeprom/Kconfig"
>  source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index af22bbc..df951f4 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -58,3 +58,4 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)        += aspeed-lpc-snoop.o
>  obj-$(CONFIG_PCI_ENDPOINT_TEST)        += pci_endpoint_test.o
>  obj-$(CONFIG_OCXL)             += ocxl/
>  obj-$(CONFIG_MISC_RTSX)                += cardreader/
> +obj-$(CONFIG_PVPANIC)          += pvpanic.o
> diff --git a/drivers/platform/x86/pvpanic.c b/drivers/misc/pvpanic.c
> similarity index 100%
> rename from drivers/platform/x86/pvpanic.c
> rename to drivers/misc/pvpanic.c
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0c1aa6c..4ac276c 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1121,14 +1121,6 @@ config INTEL_SMARTCONNECT
>           This driver checks to determine whether the device has Intel Smart
>           Connect enabled, and if so disables it.
>
> -config PVPANIC
> -       tristate "pvpanic device support"
> -       depends on ACPI
> -       ---help---
> -         This driver provides support for the pvpanic device.  pvpanic is
> -         a paravirtualized device provided by QEMU; it lets a virtual machine
> -         (guest) communicate panic events to the host.
> -
>  config INTEL_PMC_IPC
>         tristate "Intel PMC IPC Driver"
>         depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index e6d1bec..e88f44e 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -75,7 +75,6 @@ obj-$(CONFIG_APPLE_GMUX)      += apple-gmux.o
>  obj-$(CONFIG_INTEL_RST)                += intel-rst.o
>  obj-$(CONFIG_INTEL_SMARTCONNECT)       += intel-smartconnect.o
>
> -obj-$(CONFIG_PVPANIC)           += pvpanic.o
>  obj-$(CONFIG_ALIENWARE_WMI)    += alienware-wmi.o
>  obj-$(CONFIG_INTEL_PMC_IPC)    += intel_pmc_ipc.o
>  obj-$(CONFIG_TOUCHSCREEN_DMI)  += touchscreen_dmi.o
> --
> 1.8.3.1
>


-- 
With Best Regards,
Andy Shevchenko
