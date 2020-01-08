From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 23/36] platform/x86: intel_pmc_ipc: Get rid of
 unnecessary includes
Date: Wed, 8 Jan 2020 18:47:30 +0200
Message-ID: <20200108164730.GM32742@smile.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-24-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108114201.27908-24-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 08, 2020 at 02:41:48PM +0300, Mika Westerberg wrote:
> There is no point including headers that are not needed in the driver so
> drop them.
> 

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 83b106f66fa6..8527327d88c7 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -12,23 +12,13 @@
>   */
>  
>  #include <linux/acpi.h>
> -#include <linux/atomic.h>
> -#include <linux/bitops.h>
>  #include <linux/delay.h>
> -#include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/interrupt.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
> -#include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/notifier.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> -#include <linux/pm.h>
> -#include <linux/pm_qos.h>
> -#include <linux/sched.h>
> -#include <linux/spinlock.h>
> -#include <linux/suspend.h>
>  
>  #include <asm/intel_pmc_ipc.h>
>  
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko
