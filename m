From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/2] intel_pmc_ipc: avoid pending IPC1 command during
 legacy suspend
Date: Wed, 17 Feb 2016 22:13:27 -0800
Message-ID: <20160218061327.GI18421@dvhart-mobl5.amr.corp.intel.com>
References: <1455732218-27283-1-git-send-email-qipeng.zha@intel.com>
 <1455732218-27283-2-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:59242 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1424396AbcBRGN2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Feb 2016 01:13:28 -0500
Content-Disposition: inline
In-Reply-To: <1455732218-27283-2-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org, andriy.shevchenko@linux.intel.com, Ananth Krishna R <ananth.krishna.r@intel.com>, Bharath K Veera <bharath.k.veera@intel.com>

On Thu, Feb 18, 2016 at 02:03:38AM +0800, Qipeng Zha wrote:
> During legacy suspend flow, IPC1 commands are being requested
> from opregion driver. But the PMC_IPC1 command will timeout as example:
> 
> [  281.444600] ipc_debug##: ipc_send_command: cmd=0x201ff,
> [  281.444648] wbuf[0]=0x4ea6
> [  281.444668] wbuf[1]=0x0
> [  281.444674] wbuf[2]=0x0
> [  281.444676] wbuf[3]=0x0
> [  284.446467] pmc-ipc-plat INT34D2:00: IPC timed out, TS=0x4, CMD=0x200ff
> 
> This is because before the opregion driver could send IPC1 commands,
> the PMC_IPC irq is already suspended. Which makes the IPC command to
> timeout.
> 
> Solution: register pmc_ipc irq as IRQF_NO_SUSPEND
> 
> Signed-off-by: Ananth Krishna R <ananth.krishna.r@intel.com>
> Signed-off-by: Bharath K Veera <bharath.k.veera@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

Qipeng, who wrote this patch? This is the one I need a Signed-off-by from. Feel
free to credit the others with concept, debug, testing in the commit message,
but the Signed-off-by indicates authorship and the path the patch took to
mainline.

> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index abdf67c..140aa77 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -731,7 +731,8 @@ static int ipc_plat_probe(struct platform_device *pdev)
>  		goto err_device;
>  	}
>  
> -	if (request_irq(ipcdev.irq, ioc, 0, "intel_pmc_ipc", &ipcdev)) {
> +	if (request_irq(ipcdev.irq, ioc, IRQF_NO_SUSPEND,
> +			"intel_pmc_ipc", &ipcdev)) {
>  		dev_err(&pdev->dev, "Failed to request irq\n");
>  		ret = -EBUSY;
>  		goto err_irq;
> -- 
> 1.8.3.2
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
