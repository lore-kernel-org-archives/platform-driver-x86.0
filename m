From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 5/5] intel_scu_ipc: move ipclock to struct
 intel_scu_ipc_dev
Date: Fri, 09 Oct 2015 18:21:37 +0300
Message-ID: <1444404097.8361.551.camel@linux.intel.com>
References: <1444399896-78599-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <1444399896-78599-5-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:4010 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751266AbbJIPVm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Oct 2015 11:21:42 -0400
In-Reply-To: <1444399896-78599-5-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>

On Fri, 2015-10-09 at 17:11 +0300, Andy Shevchenko wrote:
> No need to use global variable for a mutex. Move it to be a member of 
> SCU IPC
> device structure.

This one is wrong, sorry.

> 
> While here, protect dev member assignment in ->remove() since user 
> may
> potentially call unbind from sysfs even if driver is built-in.

This part is still right.

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/platform/x86/intel_scu_ipc.c | 34 +++++++++++++++++++-------
> --------
>  1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_scu_ipc.c 
> b/drivers/platform/x86/intel_scu_ipc.c
> index 9de2029..16f1621 100644
> --- a/drivers/platform/x86/intel_scu_ipc.c
> +++ b/drivers/platform/x86/intel_scu_ipc.c
> @@ -92,11 +92,13 @@ static struct intel_scu_ipc_pdata_t 
> intel_scu_ipc_tangier_pdata = {
>  	.irq_mode = 0,
>  };
>  
> +/* @lock: lock used to prevent multiple call to SCU */
>  struct intel_scu_ipc_dev {
>  	struct device *dev;
>  	void __iomem *ipc_base;
>  	void __iomem *i2c_base;
>  	struct completion cmd_complete;
> +	struct mutex lock;
>  	u8 irq_mode;
>  };
>  
> @@ -112,8 +114,6 @@ static struct intel_scu_ipc_dev  ipcdev; /* Only 
> one for now */
>  #define IPC_I2C_CNTRL_ADDR	0
>  #define I2C_DATA_ADDR		0x04
>  
> -static DEFINE_MUTEX(ipclock); /* lock used to prevent multiple call 
> to SCU */
> -
>  /*
>   * Send ipc command
>   * Command Register (Write Only):
> @@ -222,10 +222,10 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, 
> u32 count, u32 op, u32 id)
>  
>  	memset(cbuf, 0, sizeof(cbuf));
>  
> -	mutex_lock(&ipclock);
> +	mutex_lock(&scu->lock);
>  
>  	if (scu->dev == NULL) {
> -		mutex_unlock(&ipclock);
> +		mutex_unlock(&scu->lock);
>  		return -ENODEV;
>  	}
>  
> @@ -258,7 +258,7 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 
> count, u32 op, u32 id)
>  		for (nc = 0; nc < count; nc++)
>  			data[nc] = ipc_data_readb(scu, nc);
>  	}
> -	mutex_unlock(&ipclock);
> +	mutex_unlock(&scu->lock);
>  	return err;
>  }
>  
> @@ -440,14 +440,14 @@ int intel_scu_ipc_simple_command(int cmd, int 
> sub)
>  	struct intel_scu_ipc_dev *scu = &ipcdev;
>  	int err;
>  
> -	mutex_lock(&ipclock);
> +	mutex_lock(&scu->lock);
>  	if (scu->dev == NULL) {
> -		mutex_unlock(&ipclock);
> +		mutex_unlock(&scu->lock);
>  		return -ENODEV;
>  	}
>  	ipc_command(scu, sub << 12 | cmd);
>  	err = intel_scu_ipc_check_status(scu);
> -	mutex_unlock(&ipclock);
> +	mutex_unlock(&scu->lock);
>  	return err;
>  }
>  EXPORT_SYMBOL(intel_scu_ipc_simple_command);
> @@ -470,9 +470,9 @@ int intel_scu_ipc_command(int cmd, int sub, u32 
> *in, int inlen,
>  	struct intel_scu_ipc_dev *scu = &ipcdev;
>  	int i, err;
>  
> -	mutex_lock(&ipclock);
> +	mutex_lock(&scu->lock);
>  	if (scu->dev == NULL) {
> -		mutex_unlock(&ipclock);
> +		mutex_unlock(&scu->lock);
>  		return -ENODEV;
>  	}
>  
> @@ -487,7 +487,7 @@ int intel_scu_ipc_command(int cmd, int sub, u32 
> *in, int inlen,
>  			*out++ = ipc_data_readl(scu, 4 * i);
>  	}
>  
> -	mutex_unlock(&ipclock);
> +	mutex_unlock(&scu->lock);
>  	return err;
>  }
>  EXPORT_SYMBOL(intel_scu_ipc_command);
> @@ -513,9 +513,9 @@ int intel_scu_ipc_i2c_cntrl(u32 addr, u32 *data)
>  	struct intel_scu_ipc_dev *scu = &ipcdev;
>  	u32 cmd = 0;
>  
> -	mutex_lock(&ipclock);
> +	mutex_lock(&scu->lock);
>  	if (scu->dev == NULL) {
> -		mutex_unlock(&ipclock);
> +		mutex_unlock(&scu->lock);
>  		return -ENODEV;
>  	}
>  	cmd = (addr >> 24) & 0xFF;
> @@ -532,10 +532,10 @@ int intel_scu_ipc_i2c_cntrl(u32 addr, u32 
> *data)
>  		dev_err(scu->dev,
>  			"intel_scu_ipc: I2C INVALID_CMD = 0x%x\n", 
> cmd);
>  
> -		mutex_unlock(&ipclock);
> +		mutex_unlock(&scu->lock);
>  		return -EIO;
>  	}
> -	mutex_unlock(&ipclock);
> +	mutex_unlock(&scu->lock);
>  	return 0;
>  }
>  EXPORT_SYMBOL(intel_scu_ipc_i2c_cntrl);
> @@ -593,6 +593,7 @@ static int ipc_probe(struct pci_dev *pdev, const 
> struct pci_device_id *id)
>  		return err;
>  
>  	init_completion(&scu->cmd_complete);
> +	mutex_init(&scu->lock);
>  
>  	err = devm_request_irq(&pdev->dev, pdev->irq, ioc, 0, 
> "intel_scu_ipc",
>  			       scu);
> @@ -625,7 +626,10 @@ static void ipc_remove(struct pci_dev *pdev)
>  {
>  	struct intel_scu_ipc_dev *scu = pci_get_drvdata(pdev);
>  
> +	mutex_lock(&scu->lock);
>  	scu->dev = NULL;
> +	mutex_unlock(&scu->lock);
> +
>  	iounmap(scu->i2c_base);
>  	intel_scu_devices_destroy();
>  }

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
