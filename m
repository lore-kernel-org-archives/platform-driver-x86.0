From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 36/36] MAINTAINERS: Update entry for Intel Broxton PMC
 driver
Date: Wed, 8 Jan 2020 19:06:26 +0200
Message-ID: <20200108170626.GS32742@smile.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-37-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108114201.27908-37-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 08, 2020 at 02:42:01PM +0300, Mika Westerberg wrote:
> The driver lives now under MFD so split the current entry into two parts
> and add me as co-maintainer of the Intel Broxton PMC driver. While there
> correct formatting of Zha Qipeng's email address.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  MAINTAINERS | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8982c6e013b3..11b8bb4e2867 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8280,6 +8280,13 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/intel_atomisp2_pm.c
>  
> +INTEL BROXTON PMC DRIVER
> +M:	Mika Westerberg <mika.westerberg@linux.intel.com>
> +M:	Zha Qipeng <qipeng.zha@intel.com>
> +S:	Maintained
> +F:	drivers/mfd/intel_pmc_bxt.c
> +F:	include/linux/mfd/intel_pmc_bxt.h
> +
>  INTEL C600 SERIES SAS CONTROLLER DRIVER
>  M:	Intel SCU Linux support <intel-linux-scu@intel.com>
>  M:	Artur Paszkiewicz <artur.paszkiewicz@intel.com>
> @@ -8488,13 +8495,11 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/intel_pmc_core*
>  
> -INTEL PMC/P-Unit IPC DRIVER
> -M:	Zha Qipeng<qipeng.zha@intel.com>
> +INTEL P-Unit IPC DRIVER
> +M:	Zha Qipeng <qipeng.zha@intel.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/x86/intel_pmc_ipc.c
>  F:	drivers/platform/x86/intel_punit_ipc.c
> -F:	arch/x86/include/asm/intel_pmc_ipc.h
>  F:	arch/x86/include/asm/intel_punit_ipc.h
>  
>  INTEL PMIC GPIO DRIVERS
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko
