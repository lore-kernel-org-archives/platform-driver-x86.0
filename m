From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] intel_pmc_ipc: Fix GCR register base address and
 length
Date: Wed, 17 Feb 2016 22:14:15 -0800
Message-ID: <20160218061415.GJ18421@dvhart-mobl5.amr.corp.intel.com>
References: <1455732218-27283-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:59712 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1424396AbcBRGOQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Feb 2016 01:14:16 -0500
Content-Disposition: inline
In-Reply-To: <1455732218-27283-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org, andriy.shevchenko@linux.intel.com, Francois-Nicolas Muller <francois-nicolas.muller@intel.com>

On Thu, Feb 18, 2016 at 02:03:37AM +0800, Qipeng Zha wrote:
> GCR register (pmc_cfg register) is at offset 0x1008, and
> remapping of 0x4 bytes is enough.
> 
> Signed-off-by: Francois-Nicolas Muller <francois-nicolas.muller@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

Who wrote the patch?

> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index ca69135..abdf67c 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -67,7 +67,8 @@
>  /* exported resources from IFWI */
>  #define PLAT_RESOURCE_IPC_INDEX		0
>  #define PLAT_RESOURCE_IPC_SIZE		0x1000
> -#define PLAT_RESOURCE_GCR_SIZE		0x1000
> +#define PLAT_RESOURCE_GCR_OFFSET	0x1008
> +#define PLAT_RESOURCE_GCR_SIZE		0x4
>  #define PLAT_RESOURCE_BIOS_DATA_INDEX	1
>  #define PLAT_RESOURCE_BIOS_IFACE_INDEX	2
>  #define PLAT_RESOURCE_ISP_DATA_INDEX	4
> @@ -688,7 +689,7 @@ static int ipc_plat_get_res(struct platform_device *pdev)
>  	}
>  	ipcdev.ipc_base = addr;
>  
> -	ipcdev.gcr_base = res->start + size;
> +	ipcdev.gcr_base = res->start + PLAT_RESOURCE_GCR_OFFSET;
>  	ipcdev.gcr_size = PLAT_RESOURCE_GCR_SIZE;
>  	dev_info(&pdev->dev, "ipc res: %pR\n", res);
>  
> -- 
> 1.8.3.2
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
