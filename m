From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH RFT] platform/x86: intel_pmc_ipc: Convert to use
 platform_device_register_full
Date: Thu, 29 Sep 2016 01:51:37 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD398E9E8D@SHSMSX104.ccr.corp.intel.com>
References: <1474689248-5925-1-git-send-email-axel.lin@ingics.com>
 <20160928233644.GC7630@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:63508 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750738AbcI2Bvm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2016 21:51:42 -0400
In-Reply-To: <20160928233644.GC7630@f23x64.localdomain>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Axel Lin <axel.lin@ingics.com>
Cc: Aubrey Li <aubrey.li@linux.intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

It's good to me, thanks.

>+LKML
>
>Axel, please always include LKML on any patch.
>
>Qipeng, any concerns?

On Sat, Sep 24, 2016 at 11:54:08AM +0800, Axel Lin wrote:
> Use platform_device_register_full() instead of open-coded.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 110 
> +++++++++++------------------------
>  1 file changed, 33 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c 
> b/drivers/platform/x86/intel_pmc_ipc.c
> index b86e1bc..665a9a1 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -522,48 +522,36 @@ static struct resource telemetry_res[] = {  
> static int ipc_create_punit_device(void)  {
>  	struct platform_device *pdev;
> -	int ret;
> -
> -	pdev = platform_device_alloc(PUNIT_DEVICE_NAME, -1);
> -	if (!pdev) {
> -		dev_err(ipcdev.dev, "Failed to alloc punit platform device\n");
> -		return -ENOMEM;
> -	}
> -
> -	pdev->dev.parent = ipcdev.dev;
> -	ret = platform_device_add_resources(pdev, punit_res_array,
> -					    ARRAY_SIZE(punit_res_array));
> -	if (ret) {
> -		dev_err(ipcdev.dev, "Failed to add platform punit resources\n");
> -		goto err;
> -	}
> +	const struct platform_device_info pdevinfo = {
> +		.parent = ipcdev.dev,
> +		.name = PUNIT_DEVICE_NAME,
> +		.id = -1,
> +		.res = punit_res_array,
> +		.num_res = ARRAY_SIZE(punit_res_array),
> +		};
> +
> +	pdev = platform_device_register_full(&pdevinfo);
> +	if (IS_ERR(pdev))
> +		return PTR_ERR(pdev);
>  
> -	ret = platform_device_add(pdev);
> -	if (ret) {
> -		dev_err(ipcdev.dev, "Failed to add punit platform device\n");
> -		goto err;
> -	}
>  	ipcdev.punit_dev = pdev;
>  
>  	return 0;
> -err:
> -	platform_device_put(pdev);
> -	return ret;
>  }
>  
>  static int ipc_create_tco_device(void)  {
>  	struct platform_device *pdev;
>  	struct resource *res;
> -	int ret;
> -
> -	pdev = platform_device_alloc(TCO_DEVICE_NAME, -1);
> -	if (!pdev) {
> -		dev_err(ipcdev.dev, "Failed to alloc tco platform device\n");
> -		return -ENOMEM;
> -	}
> -
> -	pdev->dev.parent = ipcdev.dev;
> +	const struct platform_device_info pdevinfo = {
> +		.parent = ipcdev.dev,
> +		.name = TCO_DEVICE_NAME,
> +		.id = -1,
> +		.res = tco_res,
> +		.num_res = ARRAY_SIZE(tco_res),
> +		.data = &tco_info,
> +		.size_data = sizeof(tco_info),
> +		};
>  
>  	res = tco_res + TCO_RESOURCE_ACPI_IO;
>  	res->start = ipcdev.acpi_io_base + TCO_BASE_OFFSET; @@ -577,45 
> +565,26 @@ static int ipc_create_tco_device(void)
>  	res->start = ipcdev.gcr_base + TCO_PMC_OFFSET;
>  	res->end = res->start + TCO_PMC_SIZE - 1;
>  
> -	ret = platform_device_add_resources(pdev, tco_res, ARRAY_SIZE(tco_res));
> -	if (ret) {
> -		dev_err(ipcdev.dev, "Failed to add tco platform resources\n");
> -		goto err;
> -	}
> -
> -	ret = platform_device_add_data(pdev, &tco_info, sizeof(tco_info));
> -	if (ret) {
> -		dev_err(ipcdev.dev, "Failed to add tco platform data\n");
> -		goto err;
> -	}
> +	pdev = platform_device_register_full(&pdevinfo);
> +	if (IS_ERR(pdev))
> +		return PTR_ERR(pdev);
>  
> -	ret = platform_device_add(pdev);
> -	if (ret) {
> -		dev_err(ipcdev.dev, "Failed to add tco platform device\n");
> -		goto err;
> -	}
>  	ipcdev.tco_dev = pdev;
>  
>  	return 0;
> -err:
> -	platform_device_put(pdev);
> -	return ret;
>  }
>  
>  static int ipc_create_telemetry_device(void)  {
>  	struct platform_device *pdev;
>  	struct resource *res;
> -	int ret;
> -
> -	pdev = platform_device_alloc(TELEMETRY_DEVICE_NAME, -1);
> -	if (!pdev) {
> -		dev_err(ipcdev.dev,
> -			"Failed to allocate telemetry platform device\n");
> -		return -ENOMEM;
> -	}
> -
> -	pdev->dev.parent = ipcdev.dev;
> +	const struct platform_device_info pdevinfo = {
> +		.parent = ipcdev.dev,
> +		.name = TELEMETRY_DEVICE_NAME,
> +		.id = -1,
> +		.res = telemetry_res,
> +		.num_res = ARRAY_SIZE(telemetry_res),
> +		};
>  
>  	res = telemetry_res + TELEMETRY_RESOURCE_PUNIT_SSRAM;
>  	res->start = ipcdev.telem_punit_ssram_base; @@ -625,26 +594,13 @@ 
> static int ipc_create_telemetry_device(void)
>  	res->start = ipcdev.telem_pmc_ssram_base;
>  	res->end = res->start + ipcdev.telem_pmc_ssram_size - 1;
>  
> -	ret = platform_device_add_resources(pdev, telemetry_res,
> -					    ARRAY_SIZE(telemetry_res));
> -	if (ret) {
> -		dev_err(ipcdev.dev,
> -			"Failed to add telemetry platform resources\n");
> -		goto err;
> -	}
> +	pdev = platform_device_register_full(&pdevinfo);
> +	if (IS_ERR(pdev))
> +		return PTR_ERR(pdev);
>  
> -	ret = platform_device_add(pdev);
> -	if (ret) {
> -		dev_err(ipcdev.dev,
> -			"Failed to add telemetry platform device\n");
> -		goto err;
> -	}
>  	ipcdev.telemetry_dev = pdev;
>  
>  	return 0;
> -err:
> -	platform_device_put(pdev);
> -	return ret;
>  }
>  
>  static int ipc_create_pmc_devices(void)
> --
> 2.7.4
> 
> 

--
Darren Hart
Intel Open Source Technology Center
