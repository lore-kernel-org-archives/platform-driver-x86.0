From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 4/5] intel_scu_ipc: switch to use module_pci_driver()
 macro
Date: Sat, 10 Oct 2015 21:39:17 -0700
Message-ID: <20151011043917.GD2958@malice.jf.intel.com>
References: <1444399896-78599-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1444399896-78599-4-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33325 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716AbbJKEjS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 11 Oct 2015 00:39:18 -0400
Content-Disposition: inline
In-Reply-To: <1444399896-78599-4-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org

On Fri, Oct 09, 2015 at 05:11:35PM +0300, Andy Shevchenko wrote:
> The use of macro cleans up the code a bit.

Thanks Andriy,

Minor point of feedback: it helps review to state specifics of how something is
cleaned up, etc. That way I am not assuming anything and can verify your
intentions with what I'm reading. This is a trivial example, but illustrative.

For this patch, you might have said:

  Eliminate some boilerplate code by using module_pci_driver() instead of
  init/exit, moving the salient bits from init into probe.

This provides more context for the reviewer and makes the intent explicit from
the commit message.

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/platform/x86/intel_scu_ipc.c | 25 +++++++------------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
> index 69e39cb..9de2029 100644
> --- a/drivers/platform/x86/intel_scu_ipc.c
> +++ b/drivers/platform/x86/intel_scu_ipc.c
> @@ -567,10 +567,15 @@ static irqreturn_t ioc(int irq, void *dev_id)
>   */
>  static int ipc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
> +	int platform;		/* Platform type */
>  	int err;
>  	struct intel_scu_ipc_dev *scu = &ipcdev;
>  	struct intel_scu_ipc_pdata_t *pdata;
>  
> +	platform = intel_mid_identify_cpu();
> +	if (platform == 0)
> +		return -ENODEV;
> +
>  	if (scu->dev)		/* We support only one SCU */
>  		return -EBUSY;
>  
> @@ -589,7 +594,7 @@ static int ipc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	init_completion(&scu->cmd_complete);
>  
> -	err = devm_request_irq(&pdev->dev, dev->irq, ioc, 0, "intel_scu_ipc",
> +	err = devm_request_irq(&pdev->dev, pdev->irq, ioc, 0, "intel_scu_ipc",
>  			       scu);
>  	if (err)
>  		return err;
> @@ -651,24 +656,8 @@ static struct pci_driver ipc_driver = {
>  	.remove = ipc_remove,
>  };
>  
> -static int __init intel_scu_ipc_init(void)
> -{
> -	int platform;		/* Platform type */
> -
> -	platform = intel_mid_identify_cpu();
> -	if (platform == 0)
> -		return -ENODEV;
> -	return  pci_register_driver(&ipc_driver);
> -}
> -
> -static void __exit intel_scu_ipc_exit(void)
> -{
> -	pci_unregister_driver(&ipc_driver);
> -}
> +module_pci_driver(ipc_driver);
>  
>  MODULE_AUTHOR("Sreedhara DS <sreedhara.ds@intel.com>");
>  MODULE_DESCRIPTION("Intel SCU IPC driver");
>  MODULE_LICENSE("GPL");
> -
> -module_init(intel_scu_ipc_init);
> -module_exit(intel_scu_ipc_exit);
> -- 
> 2.5.3
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
