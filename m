From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH 1/2] intel_pmc_ipc: Fix GCR register base address and
 length
Date: Thu, 18 Feb 2016 06:19:35 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD038613C2@SHSMSX104.ccr.corp.intel.com>
References: <1455732218-27283-1-git-send-email-qipeng.zha@intel.com>
 <20160218061415.GJ18421@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:18300 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1425148AbcBRGTj convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Feb 2016 01:19:39 -0500
In-Reply-To: <20160218061415.GJ18421@dvhart-mobl5.amr.corp.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "Muller, Francois-nicolas" <francois-nicolas.muller@intel.com>

> 
> Signed-off-by: Francois-Nicolas Muller 
> <francois-nicolas.muller@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

> Who wrote the patch?
Darren, Francois-Nicolas wrote this patch whicch merged in internal kernel.


> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c 
> b/drivers/platform/x86/intel_pmc_ipc.c
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
