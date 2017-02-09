From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: read s0ix residency API
Date: Thu, 9 Feb 2017 12:17:17 +0530
Message-ID: <20170209064717.GA24247@rajaneesh-OptiPlex-9010>
References: <1486386591-5739-1-git-send-email-shanth.murthy@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1486386591-5739-1-git-send-email-shanth.murthy@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shanth Murthy <shanth.murthy@intel.com>
Cc: platform-driver-x86@vger.kernel.org, dvhart@infradead.org, andriy.shevchenko@linux.intel.com, qipeng.zha@intel.com, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 06, 2017 at 05:09:51AM -0800, Shanth Murthy wrote:
> This patch adds a new API to indicate S0ix residency in usec. It utilizes
> the PMC Global Control Registers (GCR) to read deep and shallow
> S0ix residency.
> 
> PMC MMIO resources:
>         o Lower 4kB: IPC1 (PMC inter-processor communication) interface
>         o Upper 4kB: GCR (Global Control Registers)
> 
> This enables the power management framework to take corrective actions when
> the platform fails to enter S0ix after kernel freeze as part of the suspend
> to idle flow. (echo freeze > /sys/power/state).
> 
> This is expected to be used with a S0ix failsafe framework such as:
> <https://lwn.net/Articles/689505/>
> 
> Signed-off-by: Shanth Murthy <shanth.murthy@intel.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> ---
>  arch/x86/include/asm/intel_pmc_ipc.h |  6 +++++
>  drivers/platform/x86/intel_pmc_ipc.c | 49 +++++++++++++++++++++++++++++++-----
>  2 files changed, 49 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/include/asm/intel_pmc_ipc.h b/arch/x86/include/asm/intel_pmc_ipc.h
> index cd0310e..80bf73c 100644
> --- a/arch/x86/include/asm/intel_pmc_ipc.h
> +++ b/arch/x86/include/asm/intel_pmc_ipc.h
> @@ -30,6 +30,7 @@ int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen,
>  		u32 *out, u32 outlen, u32 dptr, u32 sptr);
>  int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
>  		u32 *out, u32 outlen);
> +int intel_pmc_s0ix_counter_read(u64 *data);
>  
>  #else
>  
> @@ -50,6 +51,11 @@ static inline int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
>  	return -EINVAL;
>  }
>  
> +static int intel_pmc_s0ix_counter_read(u64 *data)
> +{
> +	return -EINVAL;
> +}
> +

How about making it static inline and return -ENOSYS instead of -EINVAL?

>  #endif /*CONFIG_INTEL_PMC_IPC*/
>  
>  #endif
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 0bf51d5..212be85 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -54,6 +54,14 @@
>  #define IPC_WRITE_BUFFER	0x80
>  #define IPC_READ_BUFFER		0x90
>  
> +/* PMC Global Control Registers */
> +#define GCR_TELEM_DEEP_S0IX_OFFSET	0x1078
> +#define GCR_TELEM_SHLW_S0IX_OFFSET	0x1080
> +
> +/* Residency with clock rate at 19.2MHz to usecs */
> +#define TOTAL_S0IX_RESIDENCY_IN_USECS(DEEP, SHLW) \
> +				((DEEP + SHLW) * 10 / 192)
> +
>  /*
>   * 16-byte buffer for sending data associated with IPC command.
>   */
> @@ -68,7 +76,7 @@
>  #define PLAT_RESOURCE_IPC_INDEX		0
>  #define PLAT_RESOURCE_IPC_SIZE		0x1000
>  #define PLAT_RESOURCE_GCR_OFFSET	0x1008
> -#define PLAT_RESOURCE_GCR_SIZE		0x4
> +#define PLAT_RESOURCE_GCR_SIZE		0x1000
>  #define PLAT_RESOURCE_BIOS_DATA_INDEX	1
>  #define PLAT_RESOURCE_BIOS_IFACE_INDEX	2
>  #define PLAT_RESOURCE_TELEM_SSRAM_INDEX	3
> @@ -180,6 +188,11 @@ static inline u32 ipc_data_readl(u32 offset)
>  	return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
>  }
>  
> +static inline u64 gcr_data_readq(u32 offset)
> +{
> +	return readq(ipcdev.ipc_base + offset);
> +}
> +
>  static int intel_pmc_ipc_check_status(void)
>  {
>  	int status;
> @@ -712,7 +725,8 @@ static int ipc_plat_get_res(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "Failed to get ipc resource\n");
>  		return -ENXIO;
>  	}
> -	size = PLAT_RESOURCE_IPC_SIZE;
> +	size = PLAT_RESOURCE_IPC_SIZE + PLAT_RESOURCE_GCR_SIZE;
> +
>  	if (!request_mem_region(res->start, size, pdev->name)) {
>  		dev_err(&pdev->dev, "Failed to request ipc resource\n");
>  		return -EBUSY;
> @@ -748,6 +762,23 @@ static int ipc_plat_get_res(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +/**
> + * intel_pmc_s0ix_counter_read() - Read S0ix residency.
> + * @data: Out param that contains current S0ix residency count.
> + */
> +int intel_pmc_s0ix_counter_read(u64 *data)
> +{
> +	u64 deep_total, shlw_total;
> +
> +	deep_total = gcr_data_readq(GCR_TELEM_DEEP_S0IX_OFFSET);
> +	shlw_total = gcr_data_readq(GCR_TELEM_SHLW_S0IX_OFFSET);
> +
> +	*data = TOTAL_S0IX_RESIDENCY_IN_USECS(deep_total, shlw_total);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(intel_pmc_s0ix_counter_read);
> +

Though we have stubbed out the function in the header file for cases when
CONFIG_INTEL_PMC_IPC is not set but still it need to be further protected.

This will read random memory and could potentially crash on systems where
the driver probe failed but KConfig swicth was selected and the caller of
this API didn't guard themselves?

How about we add ipcdev.has_gcr_regs bool to guard the API which would only
be set it probe passed else we return -EINVAL from this API?

>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id ipc_acpi_ids[] = {
>  	{ "INT34D2", 0},
> @@ -808,8 +839,11 @@ static int ipc_plat_probe(struct platform_device *pdev)
>  	iounmap(ipcdev.ipc_base);
>  	res = platform_get_resource(pdev, IORESOURCE_MEM,
>  				    PLAT_RESOURCE_IPC_INDEX);
> -	if (res)
> -		release_mem_region(res->start, PLAT_RESOURCE_IPC_SIZE);
> +	if (res) {
> +		release_mem_region(res->start,
> +				   PLAT_RESOURCE_IPC_SIZE +
> +				   PLAT_RESOURCE_GCR_SIZE);
> +	}
>  	return ret;
>  }
>  
> @@ -825,8 +859,11 @@ static int ipc_plat_remove(struct platform_device *pdev)
>  	iounmap(ipcdev.ipc_base);
>  	res = platform_get_resource(pdev, IORESOURCE_MEM,
>  				    PLAT_RESOURCE_IPC_INDEX);
> -	if (res)
> -		release_mem_region(res->start, PLAT_RESOURCE_IPC_SIZE);
> +	if (res) {
> +		release_mem_region(res->start,
> +				   PLAT_RESOURCE_IPC_SIZE +
> +				   PLAT_RESOURCE_GCR_SIZE);
> +	}
>  	ipcdev.dev = NULL;
>  	return 0;
>  }
> -- 
> 1.9.1
> 

-- 
Best Regards,
Rajneesh
