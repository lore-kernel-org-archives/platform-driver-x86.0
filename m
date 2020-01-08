From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 17/36] platform/x86: intel_scu_ipcutil: Convert to use
 new SCU IPC API
Date: Wed, 8 Jan 2020 18:45:33 +0200
Message-ID: <20200108164533.GG32742@smile.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-18-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108114201.27908-18-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 08, 2020 at 02:41:42PM +0300, Mika Westerberg wrote:
> Convert the IPC util to use the new SCU IPC API where the SCU IPC
> instance is passed to the functions.
> 

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/platform/x86/intel_scu_ipcutil.c | 43 +++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_scu_ipcutil.c b/drivers/platform/x86/intel_scu_ipcutil.c
> index 8afe6fa06d7b..b7c10c15a3d6 100644
> --- a/drivers/platform/x86/intel_scu_ipcutil.c
> +++ b/drivers/platform/x86/intel_scu_ipcutil.c
> @@ -22,6 +22,9 @@
>  
>  static int major;
>  
> +struct intel_scu_ipc_dev *scu;
> +static DEFINE_MUTEX(scu_lock);
> +
>  /* IOCTL commands */
>  #define	INTE_SCU_IPC_REGISTER_READ	0
>  #define INTE_SCU_IPC_REGISTER_WRITE	1
> @@ -52,12 +55,12 @@ static int scu_reg_access(u32 cmd, struct scu_ipc_data  *data)
>  
>  	switch (cmd) {
>  	case INTE_SCU_IPC_REGISTER_READ:
> -		return intel_scu_ipc_readv(data->addr, data->data, count);
> +		return intel_scu_ipc_dev_readv(scu, data->addr, data->data, count);
>  	case INTE_SCU_IPC_REGISTER_WRITE:
> -		return intel_scu_ipc_writev(data->addr, data->data, count);
> +		return intel_scu_ipc_dev_writev(scu, data->addr, data->data, count);
>  	case INTE_SCU_IPC_REGISTER_UPDATE:
> -		return intel_scu_ipc_update_register(data->addr[0],
> -						    data->data[0], data->mask);
> +		return intel_scu_ipc_dev_update(scu, data->addr[0], data->data[0],
> +						data->mask);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -91,8 +94,40 @@ static long scu_ipc_ioctl(struct file *fp, unsigned int cmd,
>  	return 0;
>  }
>  
> +static int scu_ipc_open(struct inode *inode, struct file *file)
> +{
> +	int ret = 0;
> +
> +	/* Only single open at the time */
> +	mutex_lock(&scu_lock);
> +	if (scu) {
> +		ret = -EBUSY;
> +		goto unlock;
> +	}
> +
> +	scu = intel_scu_ipc_dev_get();
> +	if (!scu)
> +		ret = -ENODEV;
> +
> +unlock:
> +	mutex_unlock(&scu_lock);
> +	return ret;
> +}
> +
> +static int scu_ipc_release(struct inode *inode, struct file *file)
> +{
> +	mutex_lock(&scu_lock);
> +	intel_scu_ipc_dev_put(scu);
> +	scu = NULL;
> +	mutex_unlock(&scu_lock);
> +
> +	return 0;
> +}
> +
>  static const struct file_operations scu_ipc_fops = {
>  	.unlocked_ioctl = scu_ipc_ioctl,
> +	.open = scu_ipc_open,
> +	.release = scu_ipc_release,
>  };
>  
>  static int __init ipc_module_init(void)
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko
