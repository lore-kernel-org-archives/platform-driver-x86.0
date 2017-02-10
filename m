From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH v1] platform/x86: intel_pmc_ipc: fix division in 32-bit
 case
Date: Fri, 10 Feb 2017 09:54:00 +0530
Message-ID: <20170210042400.GA27435@rajaneesh-OptiPlex-9010>
References: <20170208160028.13308-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:31057 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750966AbdBJEYR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Feb 2017 23:24:17 -0500
Content-Disposition: inline
In-Reply-To: <20170208160028.13308-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Shanth Murthy <shanth.murthy@intel.com>, Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Wed, Feb 08, 2017 at 06:00:28PM +0200, Andy Shevchenko wrote:
> On 32-bit x86 platforms we can't do 64-bit divisions:
> 
> 	ERROR: "__udivdi3" [drivers/platform/x86/intel_pmc_ipc.ko] undefined!
> 
> Replace plain division by do_div() macro call.
> 
> Reported-by: Darren Hart <dvhart@infradead.org>
> Cc: Shanth Murthy <shanth.murthy@intel.com>
> Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 46202b6e7c87..8ad4d7b43423 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -62,7 +62,12 @@
>  #define GCR_TELEM_SHLW_S0IX_OFFSET	0x1080
>  
>  /* Residency with clock rate at 19.2MHz to usecs */
> -#define S0IX_RESIDENCY_IN_USECS(d, s)		(((d) + (s)) * 10 / 192)
> +#define S0IX_RESIDENCY_IN_USECS(d, s)		\
> +({						\
> +	u64 result = 10ull * ((d) + (s));	\
> +	do_div(result, 192);			\
> +	result;					\
> +})
> 

Looks good, we verified it. We are planning to squash this one and send V2.
Hope thats fine?
 
>  /*
>   * 16-byte buffer for sending data associated with IPC command.
> -- 
> 2.11.0
> 

-- 
Best Regards,
Rajneesh
