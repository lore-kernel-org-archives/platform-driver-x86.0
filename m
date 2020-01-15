From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 12/36] platform/x86: intel_scu_ipc: Split out SCU IPC
 functionality from the SCU driver
Date: Wed, 15 Jan 2020 08:35:41 +0000
Message-ID: <20200115083541.GF325@dell>
References: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
 <20200113135623.56286-13-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200113135623.56286-13-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 13 Jan 2020, Mika Westerberg wrote:

> The SCU IPC functionality is usable outside of Intel MID devices. For
> example modern Intel CPUs include the same thing but now it is called
> PMC (Power Management Controller) instead of SCU. To make the IPC
> available for those split the driver into library part (intel_scu_ipc.c)
> and the SCU PCI driver part (intel_scu_pcidrv.c) which then calls the
> former before it goes and creates rest of the SCU devices.
> 
> We also split the Kconfig symbols so that INTEL_SCU_IPC enables the SCU
> IPC library and INTEL_SCU_PCI the SCU driver and convert the users
> accordingly. While there remove default y from the INTEL_SCU_PCI symbol
> as it is already selected by X86_INTEL_MID.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/x86/Kconfig                        |  2 +-
>  arch/x86/include/asm/intel_scu_ipc.h    | 14 +++++

>  drivers/mfd/Kconfig                     |  4 +-

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

>  drivers/platform/x86/Kconfig            | 26 ++++++---
>  drivers/platform/x86/Makefile           |  1 +
>  drivers/platform/x86/intel_scu_ipc.c    | 75 +++++++++----------------
>  drivers/platform/x86/intel_scu_pcidrv.c | 61 ++++++++++++++++++++
>  7 files changed, 122 insertions(+), 61 deletions(-)
>  create mode 100644 drivers/platform/x86/intel_scu_pcidrv.c

[...]

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 420900852166..59515142438e 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -593,7 +593,7 @@ config INTEL_SOC_PMIC_MRFLD
>  	tristate "Support for Intel Merrifield Basin Cove PMIC"
>  	depends on GPIOLIB
>  	depends on ACPI
> -	depends on INTEL_SCU_IPC
> +	depends on INTEL_SCU
>  	select MFD_CORE
>  	select REGMAP_IRQ
>  	help
> @@ -625,7 +625,7 @@ config MFD_INTEL_LPSS_PCI
>  
>  config MFD_INTEL_MSIC
>  	bool "Intel MSIC"
> -	depends on INTEL_SCU_IPC
> +	depends on INTEL_SCU
>  	select MFD_CORE
>  	help
>  	  Select this option to enable access to Intel MSIC (Avatele

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
