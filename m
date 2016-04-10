From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform:x86 decouple telemetry driver from the optional
 IPC resources
Date: Sat, 9 Apr 2016 19:45:13 -0700
Message-ID: <20160410024513.GA18689@dvhart-mobl5.amr.corp.intel.com>
References: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from [198.137.202.9] ([198.137.202.9]:45408 "EHLO
	bombadil.infradead.org" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750973AbcDJCsk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Apr 2016 22:48:40 -0400
Content-Disposition: inline
In-Reply-To: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Aubrey Li <aubrey.li@linux.intel.com>, "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Cc: qipeng.zha@intel.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 31, 2016 at 02:28:09PM -0500, Aubrey Li wrote:
> Currently the optional IPC resources prevent telemetry driver from
> probing if these resources are not in ACPI table. This patch decouples
> telemetry driver from these optional resources, so that telemetry driver
> has dependency only on the necessary ACPI resources.
> 
> Signed-off-by: Aubrey Li <aubrey.li@linux.intel.com>

Given the impact to their recent contributions, I'm looking for reviews from
Qipeng and Souvik before I merge this.

Qipeng, as the listed maintainer for these two files, I particularly need to
hear from you.

Thanks,

> ---
>  drivers/platform/x86/intel_pmc_ipc.c   |   48 +++++++++++++++-----------------
>  drivers/platform/x86/intel_punit_ipc.c |   48 +++++++++++++++++++++-----------
>  2 files changed, 54 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 092519e..29d9c02 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -686,8 +686,8 @@ static int ipc_plat_get_res(struct platform_device *pdev)
>  	ipcdev.acpi_io_size = size;
>  	dev_info(&pdev->dev, "io res: %pR\n", res);
>  
> -	/* This is index 0 to cover BIOS data register */
>  	punit_res = punit_res_array;
> +	/* This is index 0 to cover BIOS data register */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM,
>  				    PLAT_RESOURCE_BIOS_DATA_INDEX);
>  	if (!res) {
> @@ -697,55 +697,51 @@ static int ipc_plat_get_res(struct platform_device *pdev)
>  	*punit_res = *res;
>  	dev_info(&pdev->dev, "punit BIOS data res: %pR\n", res);
>  
> +	/* This is index 1 to cover BIOS interface register */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM,
>  				    PLAT_RESOURCE_BIOS_IFACE_INDEX);
>  	if (!res) {
>  		dev_err(&pdev->dev, "Failed to get res of punit BIOS iface\n");
>  		return -ENXIO;
>  	}
> -	/* This is index 1 to cover BIOS interface register */
>  	*++punit_res = *res;
>  	dev_info(&pdev->dev, "punit BIOS interface res: %pR\n", res);
>  
> +	/* This is index 2 to cover ISP data register, optional */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM,
>  				    PLAT_RESOURCE_ISP_DATA_INDEX);
> -	if (!res) {
> -		dev_err(&pdev->dev, "Failed to get res of punit ISP data\n");
> -		return -ENXIO;
> +	++punit_res;
> +	if (res) {
> +		*punit_res = *res;
> +		dev_info(&pdev->dev, "punit ISP data res: %pR\n", res);
>  	}
> -	/* This is index 2 to cover ISP data register */
> -	*++punit_res = *res;
> -	dev_info(&pdev->dev, "punit ISP data res: %pR\n", res);
>  
> +	/* This is index 3 to cover ISP interface register, optional */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM,
>  				    PLAT_RESOURCE_ISP_IFACE_INDEX);
> -	if (!res) {
> -		dev_err(&pdev->dev, "Failed to get res of punit ISP iface\n");
> -		return -ENXIO;
> +	++punit_res;
> +	if (res) {
> +		*punit_res = *res;
> +		dev_info(&pdev->dev, "punit ISP interface res: %pR\n", res);
>  	}
> -	/* This is index 3 to cover ISP interface register */
> -	*++punit_res = *res;
> -	dev_info(&pdev->dev, "punit ISP interface res: %pR\n", res);
>  
> +	/* This is index 4 to cover GTD data register, optional */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM,
>  				    PLAT_RESOURCE_GTD_DATA_INDEX);
> -	if (!res) {
> -		dev_err(&pdev->dev, "Failed to get res of punit GTD data\n");
> -		return -ENXIO;
> +	++punit_res;
> +	if (res) {
> +		*punit_res = *res;
> +		dev_info(&pdev->dev, "punit GTD data res: %pR\n", res);
>  	}
> -	/* This is index 4 to cover GTD data register */
> -	*++punit_res = *res;
> -	dev_info(&pdev->dev, "punit GTD data res: %pR\n", res);
>  
> +	/* This is index 5 to cover GTD interface register, optional */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM,
>  				    PLAT_RESOURCE_GTD_IFACE_INDEX);
> -	if (!res) {
> -		dev_err(&pdev->dev, "Failed to get res of punit GTD iface\n");
> -		return -ENXIO;
> +	++punit_res;
> +	if (res) {
> +		*punit_res = *res;
> +		dev_info(&pdev->dev, "punit GTD interface res: %pR\n", res);
>  	}
> -	/* This is index 5 to cover GTD interface register */
> -	*++punit_res = *res;
> -	dev_info(&pdev->dev, "punit GTD interface res: %pR\n", res);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM,
>  				    PLAT_RESOURCE_IPC_INDEX);
> diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platform/x86/intel_punit_ipc.c
> index bd87540..a47a41f 100644
> --- a/drivers/platform/x86/intel_punit_ipc.c
> +++ b/drivers/platform/x86/intel_punit_ipc.c
> @@ -227,6 +227,11 @@ static int intel_punit_get_bars(struct platform_device *pdev)
>  	struct resource *res;
>  	void __iomem *addr;
>  
> +	/*
> +	 * The following resources are required
> +	 * - BIOS_IPC BASE_DATA
> +	 * - BIOS_IPC BASE_IFACE
> +	 */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	addr = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(addr))
> @@ -239,29 +244,40 @@ static int intel_punit_get_bars(struct platform_device *pdev)
>  		return PTR_ERR(addr);
>  	punit_ipcdev->base[BIOS_IPC][BASE_IFACE] = addr;
>  
> +	/*
> +	 * The following resources are optional
> +	 * - ISPDRIVER_IPC BASE_DATA
> +	 * - ISPDRIVER_IPC BASE_IFACE
> +	 * - GTDRIVER_IPC BASE_DATA
> +	 * - GTDRIVER_IPC BASE_IFACE
> +	 */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> -	addr = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(addr))
> -		return PTR_ERR(addr);
> -	punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] = addr;
> +	if (res) {
> +		addr = devm_ioremap_resource(&pdev->dev, res);
> +		if (!IS_ERR(addr))
> +			punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] = addr;
> +	}
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 3);
> -	addr = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(addr))
> -		return PTR_ERR(addr);
> -	punit_ipcdev->base[ISPDRIVER_IPC][BASE_IFACE] = addr;
> +	if (res) {
> +		addr = devm_ioremap_resource(&pdev->dev, res);
> +		if (!IS_ERR(addr))
> +			punit_ipcdev->base[ISPDRIVER_IPC][BASE_IFACE] = addr;
> +	}
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 4);
> -	addr = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(addr))
> -		return PTR_ERR(addr);
> -	punit_ipcdev->base[GTDRIVER_IPC][BASE_DATA] = addr;
> +	if (res) {
> +		addr = devm_ioremap_resource(&pdev->dev, res);
> +		if (!IS_ERR(addr))
> +			punit_ipcdev->base[GTDRIVER_IPC][BASE_DATA] = addr;
> +	}
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 5);
> -	addr = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(addr))
> -		return PTR_ERR(addr);
> -	punit_ipcdev->base[GTDRIVER_IPC][BASE_IFACE] = addr;
> +	if (res) {
> +		addr = devm_ioremap_resource(&pdev->dev, res);
> +		if (!IS_ERR(addr))
> +			punit_ipcdev->base[GTDRIVER_IPC][BASE_IFACE] = addr;
> +	}
>  
>  	return 0;
>  }
> -- 
> 1.7.10.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
