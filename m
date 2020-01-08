From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 09/36] platform/x86: intel_scu_ipc: Drop unused macros
Date: Wed, 8 Jan 2020 18:41:41 +0200
Message-ID: <20200108164141.GB32742@smile.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-10-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108114201.27908-10-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 08, 2020 at 02:41:34PM +0300, Mika Westerberg wrote:
> These macros are not used anywhere in the driver so drop them.
> 

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/platform/x86/intel_scu_ipc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
> index 8db0644900a3..997fdac920c6 100644
> --- a/drivers/platform/x86/intel_scu_ipc.c
> +++ b/drivers/platform/x86/intel_scu_ipc.c
> @@ -26,11 +26,7 @@
>  #include <asm/intel_scu_ipc.h>
>  
>  /* IPC defines the following message types */
> -#define IPCMSG_WATCHDOG_TIMER 0xF8 /* Set Kernel Watchdog Threshold */
> -#define IPCMSG_BATTERY        0xEF /* Coulomb Counter Accumulator */
> -#define IPCMSG_FW_UPDATE      0xFE /* Firmware update */
> -#define IPCMSG_PCNTRL         0xFF /* Power controller unit read/write */
> -#define IPCMSG_FW_REVISION    0xF4 /* Get firmware revision */
> +#define IPCMSG_PCNTRL         0xff /* Power controller unit read/write */
>  
>  /* Command id associated with message IPCMSG_PCNTRL */
>  #define IPC_CMD_PCNTRL_W      0 /* Register write */
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko
