From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH v2 1/4] platform/x86: intel_pmc_ipc: fix gcr offset
Date: Fri, 17 Mar 2017 16:43:11 +0530
Message-ID: <20170317111310.GC24582@rajaneesh-OptiPlex-9010>
References: <20170316192003.GA19344@rajaneesh-OptiPlex-9010>
 <b89221c652d06c3c07fdf2ec32fd4fc8930c64df.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b89221c652d06c3c07fdf2ec32fd4fc8930c64df.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: andy@infradead.org, qipeng.zha@intel.com, dvhart@infradead.org, david.e.box@linux.intel.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, shanth.murthy@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Mar 16, 2017 at 05:41:33PM -0700, Kuppuswamy Sathyanarayanan wrote:
> According to the PMC spec, gcr offset from ipc mem
> region is 0x1000(4K). But currently this driver uses
> 0x1008 as gcr offset. This patch fixes this issue.
>

This one is fine and was one of the WIP patches. This now enables further
cleanup and we should re-align GCR_TELEM_DEEP_S0IX_OFFSET from gcr_base.

CC: Shanth Murthy <shanth.murthy@intel.com>
 
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 0651d47..0a33592 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -82,7 +82,7 @@
>  /* exported resources from IFWI */
>  #define PLAT_RESOURCE_IPC_INDEX		0
>  #define PLAT_RESOURCE_IPC_SIZE		0x1000
> -#define PLAT_RESOURCE_GCR_OFFSET	0x1008
> +#define PLAT_RESOURCE_GCR_OFFSET	0x1000
>  #define PLAT_RESOURCE_GCR_SIZE		0x1000
>  #define PLAT_RESOURCE_BIOS_DATA_INDEX	1
>  #define PLAT_RESOURCE_BIOS_IFACE_INDEX	2
> -- 
> 2.7.4
> 

-- 
Best Regards,
Rajneesh
