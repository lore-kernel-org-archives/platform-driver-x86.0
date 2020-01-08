From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 03/36] platform/x86: intel_scu_ipc: Add constants for
 register offsets
Date: Wed, 8 Jan 2020 18:39:03 +0200
Message-ID: <20200108163903.GW32742@smile.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-4-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108114201.27908-4-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 08, 2020 at 02:41:28PM +0300, Mika Westerberg wrote:
> This makes the code more readable. These are taken from intel_pmc_ipc.c
> which implements the same thing.
> 

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/platform/x86/intel_scu_ipc.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
> index cdab916fbf92..a8be5bcb9832 100644
> --- a/drivers/platform/x86/intel_scu_ipc.c
> +++ b/drivers/platform/x86/intel_scu_ipc.c
> @@ -99,11 +99,15 @@ struct intel_scu_ipc_dev {
>  
>  static struct intel_scu_ipc_dev  ipcdev; /* Only one for now */
>  
> +#define IPC_STATUS		0x04
> +#define IPC_STATUS_ERR		BIT(1)
> +#define IPC_STATUS_BUSY		BIT(0)
> +
>  /*
> - * IPC Read Buffer (Read Only):
> - * 16 byte buffer for receiving data from SCU, if IPC command
> - * processing results in response data
> + * IPC Write/Read Buffers:
> + * 16 byte buffer for sending and receiving data to and from SCU.
>   */
> +#define IPC_WRITE_BUFFER	0x80
>  #define IPC_READ_BUFFER		0x90
>  
>  #define IPC_I2C_CNTRL_ADDR	0
> @@ -135,7 +139,7 @@ static inline void ipc_command(struct intel_scu_ipc_dev *scu, u32 cmd)
>   */
>  static inline void ipc_data_writel(struct intel_scu_ipc_dev *scu, u32 data, u32 offset)
>  {
> -	writel(data, scu->ipc_base + 0x80 + offset);
> +	writel(data, scu->ipc_base + IPC_WRITE_BUFFER + offset);
>  }
>  
>  /*
> @@ -147,7 +151,7 @@ static inline void ipc_data_writel(struct intel_scu_ipc_dev *scu, u32 data, u32
>   */
>  static inline u8 ipc_read_status(struct intel_scu_ipc_dev *scu)
>  {
> -	return __raw_readl(scu->ipc_base + 0x04);
> +	return __raw_readl(scu->ipc_base + IPC_STATUS);
>  }
>  
>  /* Read ipc byte data */
> @@ -169,17 +173,17 @@ static inline int busy_loop(struct intel_scu_ipc_dev *scu)
>  	u32 loop_count = 100000;
>  
>  	/* break if scu doesn't reset busy bit after huge retry */
> -	while ((status & BIT(0)) && --loop_count) {
> +	while ((status & IPC_STATUS_BUSY) && --loop_count) {
>  		udelay(1); /* scu processing time is in few u secods */
>  		status = ipc_read_status(scu);
>  	}
>  
> -	if (status & BIT(0)) {
> +	if (status & IPC_STATUS_BUSY) {
>  		dev_err(scu->dev, "IPC timed out");
>  		return -ETIMEDOUT;
>  	}
>  
> -	if (status & BIT(1))
> +	if (status & IPC_STATUS_ERR)
>  		return -EIO;
>  
>  	return 0;
> @@ -196,7 +200,7 @@ static inline int ipc_wait_for_interrupt(struct intel_scu_ipc_dev *scu)
>  	}
>  
>  	status = ipc_read_status(scu);
> -	if (status & BIT(1))
> +	if (status & IPC_STATUS_ERR)
>  		return -EIO;
>  
>  	return 0;
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko
