From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 07/36] platform/x86: intel_scu_ipc: Sleeping is fine
 when polling
Date: Wed, 8 Jan 2020 19:12:44 +0200
Message-ID: <20200108171244.GT32742@smile.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-8-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108114201.27908-8-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 08, 2020 at 02:41:32PM +0300, Mika Westerberg wrote:
> There is no reason why the driver would need to block other threads from
> running the CPU while it is waiting for the SCU IPC to complete its
> work. For this reason switch the driver to use usleep_range() instead
> with a bit more relaxed polling loop.

I agree on this and if somebody finds a race condition that had been hidden by
the original code it will mean that somewhere else something is completely
broken.

> 
> Also add constant for the timeout and use the same value for both
> polling and interrupt modes.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/platform/x86/intel_scu_ipc.c | 29 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
> index 43eaf9400c67..8db0644900a3 100644
> --- a/drivers/platform/x86/intel_scu_ipc.c
> +++ b/drivers/platform/x86/intel_scu_ipc.c
> @@ -79,6 +79,9 @@ static struct intel_scu_ipc_dev  ipcdev; /* Only one for now */
>  #define IPC_WRITE_BUFFER	0x80
>  #define IPC_READ_BUFFER		0x90
>  
> +/* Timeout in jiffies */
> +#define IPC_TIMEOUT		(3 * HZ)
> +
>  static DEFINE_MUTEX(ipclock); /* lock used to prevent multiple call to SCU */
>  
>  /*
> @@ -132,24 +135,20 @@ static inline u32 ipc_data_readl(struct intel_scu_ipc_dev *scu, u32 offset)
>  /* Wait till scu status is busy */
>  static inline int busy_loop(struct intel_scu_ipc_dev *scu)
>  {
> -	u32 status = ipc_read_status(scu);
> -	u32 loop_count = 100000;
> +	unsigned long end = jiffies + msecs_to_jiffies(IPC_TIMEOUT);
>  
> -	/* break if scu doesn't reset busy bit after huge retry */
> -	while ((status & IPC_STATUS_BUSY) && --loop_count) {
> -		udelay(1); /* scu processing time is in few u secods */
> -		status = ipc_read_status(scu);
> -	}
> +	do {
> +		u32 status;
>  
> -	if (status & IPC_STATUS_BUSY) {
> -		dev_err(scu->dev, "IPC timed out");
> -		return -ETIMEDOUT;
> -	}
> +		status = ipc_read_status(scu);
> +		if (!(status & IPC_STATUS_BUSY))
> +			return (status & IPC_STATUS_ERR) ? -EIO : 0;
>  
> -	if (status & IPC_STATUS_ERR)
> -		return -EIO;
> +		usleep_range(50, 100);
> +	} while (time_before(jiffies, end));
>  
> -	return 0;
> +	dev_err(scu->dev, "IPC timed out");
> +	return -ETIMEDOUT;
>  }
>  
>  /* Wait till ipc ioc interrupt is received or timeout in 3 HZ */
> @@ -157,7 +156,7 @@ static inline int ipc_wait_for_interrupt(struct intel_scu_ipc_dev *scu)
>  {
>  	int status;
>  
> -	if (!wait_for_completion_timeout(&scu->cmd_complete, 3 * HZ)) {
> +	if (!wait_for_completion_timeout(&scu->cmd_complete, IPC_TIMEOUT)) {
>  		dev_err(scu->dev, "IPC timed out\n");
>  		return -ETIMEDOUT;
>  	}
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko
