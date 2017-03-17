From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH v2 4/4] platform/x86: intel_pmc_ipc: remove iTCO GCR mem
 resource
Date: Fri, 17 Mar 2017 17:17:47 +0530
Message-ID: <20170317114747.GF24582@rajaneesh-OptiPlex-9010>
References: <b89221c652d06c3c07fdf2ec32fd4fc8930c64df.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <6a7159a2feb2e2ca9102834232222b411bfef2de.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:32137 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751103AbdCQLrw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Mar 2017 07:47:52 -0400
Content-Disposition: inline
In-Reply-To: <6a7159a2feb2e2ca9102834232222b411bfef2de.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: andy@infradead.org, qipeng.zha@intel.com, dvhart@infradead.org, david.e.box@linux.intel.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, shanth.murthy@intel.com

On Thu, Mar 16, 2017 at 05:41:36PM -0700, Kuppuswamy Sathyanarayanan wrote:
> This patch removes the unused iTCO GCR memory resource
>

Looks fine to me.
 
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 12018f3..e9e1d62 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -126,7 +126,6 @@ static struct intel_pmc_ipc_dev {
>  	struct platform_device *tco_dev;
>  
>  	/* gcr */
> -	resource_size_t gcr_base;
>  	void __iomem *gcr_mem_base;
>  	int gcr_size;
>  	bool has_gcr_regs;
> @@ -529,10 +528,6 @@ static struct resource tco_res[] = {
>  	{
>  		.flags = IORESOURCE_IO,
>  	},
> -	/* GCS */
> -	{
> -		.flags = IORESOURCE_MEM,
> -	},
>  };
>  
>  static struct itco_wdt_platform_data tco_info = {
> @@ -594,10 +589,6 @@ static int ipc_create_tco_device(void)
>  	res->start = ipcdev.acpi_io_base + SMI_EN_OFFSET;
>  	res->end = res->start + SMI_EN_SIZE - 1;
>  
> -	res = tco_res + TCO_RESOURCE_GCR_MEM;
> -	res->start = ipcdev.gcr_base + TCO_PMC_OFFSET;
> -	res->end = res->start + TCO_PMC_SIZE - 1;
> -
>  	pdev = platform_device_register_full(&pdevinfo);
>  	if (IS_ERR(pdev))
>  		return PTR_ERR(pdev);
> @@ -759,7 +750,6 @@ static int ipc_plat_get_res(struct platform_device *pdev)
>  	}
>  	ipcdev.ipc_base = addr;
>  
> -	ipcdev.gcr_base = res->start + PLAT_RESOURCE_GCR_OFFSET;
>  	ipcdev.gcr_mem_base = addr + PLAT_RESOURCE_GCR_OFFSET;
>  	ipcdev.gcr_size = PLAT_RESOURCE_GCR_SIZE;
>  	dev_info(&pdev->dev, "ipc res: %pR\n", res);
> -- 
> 2.7.4
> 

-- 
Best Regards,
Rajneesh
