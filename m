From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86: intel_pmc_ipc: fix io mem mapping
 size
Date: Thu, 16 Mar 2017 20:22:03 +0530
Message-ID: <20170316145203.GA23198@rajaneesh-OptiPlex-9010>
References: <1ab8d18dd7f5428869e6e77026ac4206863eea08.1489634924.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1ab8d18dd7f5428869e6e77026ac4206863eea08.1489634924.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: andy@infradead.org, qipeng.zha@intel.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Mar 15, 2017 at 08:32:53PM -0700, Kuppuswamy Sathyanarayanan wrote:
> Mapping entire GCR mem region in this driver creates
> mem region request conflict in sub devices that depend
> on PMC. This creates driver probe failure in devices like
> iTC0_wdt and telemetry device.

While this patch might fix the issue for now but IMHO its not taking the
right approch. I guess we need some guidance here from the maintainers but
please do consider the below explaination for why we shoud not take this
approch to fix WDT issue. Telemetry driver has no issues while loading since
its not using any register in the GCR region.

PMC on BXT/APL platforms has contiguous IPC and GCR regions. PMC_IPC driver
maps the entire IPC and GCR region. It would be inefficient to map and unmap
each time we want to use another register present in IPC or GCR spaces.

iTCO_WDT driver needs to check the BIT4 (NO_REBOOT) of PMC_CFG register
(Offset: 0x1008) and this falls in GCR space. The iTCO_WDT driver fails to
load because it can't request mem region for the resources already claimed
by PMC_IPC driver. However, ioremap would still work here and WDT driver
would load just fine.

So, IMHO the problem lies elsewhere and we should find a way to handle this
better in iTCO_WDT driver.

The IPC and GCR resources belong to PMC and should be claimed by the PMC
driver rightfully and should not be reclaimed by iTCO_WDT or any other
driver.


> 
> Currently this driver only need memory mapping for
> s0ix counter registers. So this patch fixes this issue
> by requesting memory mapping for only the s0ix counter mem
> region.

How about exposing a new API in PMC_IPC driver which can be used for reading
the desired GCR register and it can be used by iTCO_WDT instead of
requesting mem regions and remapping?

> 
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 59 +++++++++++++++++++++++++++++-------
>  1 file changed, 48 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 0651d47..2b8a090 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -58,8 +58,8 @@
>  #define IPC_READ_BUFFER		0x90
>  
>  /* PMC Global Control Registers */
> -#define GCR_TELEM_DEEP_S0IX_OFFSET	0x1078
> -#define GCR_TELEM_SHLW_S0IX_OFFSET	0x1080
> +#define GCR_TELEM_DEEP_S0IX_OFFSET	0x0
> +#define GCR_TELEM_SHLW_S0IX_OFFSET	0x8
>  
>  /* Residency with clock rate at 19.2MHz to usecs */
>  #define S0IX_RESIDENCY_IN_USECS(d, s)		\
> @@ -84,6 +84,8 @@
>  #define PLAT_RESOURCE_IPC_SIZE		0x1000
>  #define PLAT_RESOURCE_GCR_OFFSET	0x1008
>  #define PLAT_RESOURCE_GCR_SIZE		0x1000
> +#define PLAT_RESOURCE_GCR_S0IX_OFFSET	0x1078
> +#define PLAT_RESOURCE_GCR_S0IX_SIZE	12
>  #define PLAT_RESOURCE_BIOS_DATA_INDEX	1
>  #define PLAT_RESOURCE_BIOS_IFACE_INDEX	2
>  #define PLAT_RESOURCE_TELEM_SSRAM_INDEX	3
> @@ -130,6 +132,11 @@ static struct intel_pmc_ipc_dev {
>  	int gcr_size;
>  	bool has_gcr_regs;
>  
> +	/* s0ix counters */
> +	resource_size_t gcr_s0ix_start;
> +	int gcr_s0ix_size;
> +	void __iomem *gcr_s0ix_base;
> +
>  	/* punit */
>  	struct platform_device *punit_dev;
>  
> @@ -194,9 +201,9 @@ static inline u32 ipc_data_readl(u32 offset)
>  	return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
>  }
>  
> -static inline u64 gcr_data_readq(u32 offset)
> +static inline u64 gcr_s0ix_data_readq(u32 offset)
>  {
> -	return readq(ipcdev.ipc_base + offset);
> +	return readq(ipcdev.gcr_s0ix_base + offset);
>  }
>  
>  static int intel_pmc_ipc_check_status(void)
> @@ -732,7 +739,7 @@ static int ipc_plat_get_res(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "Failed to get ipc resource\n");
>  		return -ENXIO;
>  	}
> -	size = PLAT_RESOURCE_IPC_SIZE + PLAT_RESOURCE_GCR_SIZE;
> +	size = PLAT_RESOURCE_IPC_SIZE;
>  
>  	if (!request_mem_region(res->start, size, pdev->name)) {
>  		dev_err(&pdev->dev, "Failed to request ipc resource\n");
> @@ -748,8 +755,36 @@ static int ipc_plat_get_res(struct platform_device *pdev)
>  
>  	ipcdev.gcr_base = res->start + PLAT_RESOURCE_GCR_OFFSET;
>  	ipcdev.gcr_size = PLAT_RESOURCE_GCR_SIZE;
> +
>  	dev_info(&pdev->dev, "ipc res: %pR\n", res);
>  
> +	/* request s0ix counter reg memory */
> +	ipcdev.gcr_s0ix_start = res->start + PLAT_RESOURCE_GCR_S0IX_OFFSET;
> +	ipcdev.gcr_s0ix_size = PLAT_RESOURCE_GCR_S0IX_SIZE;
> +
> +	if (!request_mem_region(ipcdev.gcr_s0ix_start, ipcdev.gcr_s0ix_size,
> +				"ipc_gcr_s0ix")) {
> +		dev_err(&pdev->dev, "Failed to request s0ix mem region\n");
> +		iounmap(ipcdev.ipc_base);
> +		release_mem_region(res->start, size);
> +		return -EBUSY;
> +	}
> +
> +	addr = ioremap_nocache(ipcdev.gcr_s0ix_start, ipcdev.gcr_s0ix_size);
> +	if (!addr) {
> +		dev_err(&pdev->dev, "s0ix I/O memory remapping failed\n");
> +		release_mem_region(ipcdev.gcr_s0ix_start, ipcdev.gcr_s0ix_size);
> +		iounmap(ipcdev.ipc_base);
> +		release_mem_region(res->start, size);
> +		return -ENOMEM;
> +	}
> +
> +	ipcdev.gcr_s0ix_base = addr;
> +
> +	dev_info(&pdev->dev, "s0ix mem region 0x%llx-0x%llx\n",
> +		 ipcdev.gcr_s0ix_start,
> +		 (ipcdev.gcr_s0ix_start + ipcdev.gcr_s0ix_size - 1));
> +
>  	ipcdev.telem_res_inval = 0;
>  	res = platform_get_resource(pdev, IORESOURCE_MEM,
>  				    PLAT_RESOURCE_TELEM_SSRAM_INDEX);
> @@ -782,8 +817,8 @@ int intel_pmc_s0ix_counter_read(u64 *data)
>  	if (!ipcdev.has_gcr_regs)
>  		return -EACCES;
>  
> -	deep = gcr_data_readq(GCR_TELEM_DEEP_S0IX_OFFSET);
> -	shlw = gcr_data_readq(GCR_TELEM_SHLW_S0IX_OFFSET);
> +	deep = gcr_s0ix_data_readq(GCR_TELEM_DEEP_S0IX_OFFSET);
> +	shlw = gcr_s0ix_data_readq(GCR_TELEM_SHLW_S0IX_OFFSET);
>  
>  	*data = S0IX_RESIDENCY_IN_USECS(deep, shlw);
>  
> @@ -851,12 +886,13 @@ static int ipc_plat_probe(struct platform_device *pdev)
>  	platform_device_unregister(ipcdev.telemetry_dev);
>  err_device:
>  	iounmap(ipcdev.ipc_base);
> +	iounmap(ipcdev.gcr_s0ix_base);
>  	res = platform_get_resource(pdev, IORESOURCE_MEM,
>  				    PLAT_RESOURCE_IPC_INDEX);
>  	if (res) {
> +		release_mem_region(ipcdev.gcr_s0ix_start, ipcdev.gcr_s0ix_size);
>  		release_mem_region(res->start,
> -				   PLAT_RESOURCE_IPC_SIZE +
> -				   PLAT_RESOURCE_GCR_SIZE);
> +				   PLAT_RESOURCE_IPC_SIZE);
>  	}
>  	return ret;
>  }
> @@ -871,12 +907,13 @@ static int ipc_plat_remove(struct platform_device *pdev)
>  	platform_device_unregister(ipcdev.punit_dev);
>  	platform_device_unregister(ipcdev.telemetry_dev);
>  	iounmap(ipcdev.ipc_base);
> +	iounmap(ipcdev.gcr_s0ix_base);
>  	res = platform_get_resource(pdev, IORESOURCE_MEM,
>  				    PLAT_RESOURCE_IPC_INDEX);
>  	if (res) {
> +		release_mem_region(ipcdev.gcr_s0ix_start, ipcdev.gcr_s0ix_size);
>  		release_mem_region(res->start,
> -				   PLAT_RESOURCE_IPC_SIZE +
> -				   PLAT_RESOURCE_GCR_SIZE);
> +				   PLAT_RESOURCE_IPC_SIZE);
>  	}
>  	ipcdev.dev = NULL;
>  	return 0;
> -- 
> 2.7.4
> 

-- 
Best Regards,
Rajneesh
