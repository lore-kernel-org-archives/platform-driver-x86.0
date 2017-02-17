From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: Use XTAL freq based on
 cpuid
Date: Fri, 17 Feb 2017 12:05:58 +0200
Message-ID: <1487325958.2133.500.camel@linux.intel.com>
References: <1487323434-8553-1-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:34496 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933267AbdBQKKc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2017 05:10:32 -0500
In-Reply-To: <1487323434-8553-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org

On Fri, 2017-02-17 at 14:53 +0530, Rajneesh Bhardwaj wrote:
> This patch uses crystal frequency based on the cpu model.
> 
> On Apollo Lake SoC we have 19.2 MHz clock frequency for counting S0ix
> residency but this clock frequency might change on future platforms
> depending on the crystal oscillator.

I don't see any "future platforms" in the kernel right now, so, it's not
for this cycle apparently.

Now, let me do a review.

> @@ -61,11 +62,11 @@
>  #define GCR_TELEM_DEEP_S0IX_OFFSET	0x1078
>  #define GCR_TELEM_SHLW_S0IX_OFFSET	0x1080
>  
> -/* Residency with clock rate at 19.2MHz to usecs */
> -#define S0IX_RESIDENCY_IN_USECS(d, s)		\
> +/* Convert S0ix residency to usecs based on XTAL frequency */
> +#define S0IX_RESIDENCY_IN_USECS(d, s, x)		\
>  ({						\
> -	u64 result = 10ull * ((d) + (s));	\
> -	do_div(result, 192);			\
> +	u64 result = 1000ull * ((d) + (s));	\
> +	do_div(result, x);			\

You forgot parens.

>  	result;					\
>  })
>  
> @@ -131,6 +132,7 @@
>  	resource_size_t gcr_base;
>  	int gcr_size;
>  	bool has_gcr_regs;
> +	u32 xtal_khz;

Reverse Xmas tree order.

>  
>  	/* punit */
>  	struct platform_device *punit_dev;
> @@ -201,6 +203,18 @@ static inline u64 gcr_data_readq(u32 offset)
>  	return readq(ipcdev.ipc_base + offset);
>  }
>  
> +static int get_xtal_clock_freq(void)
> +{
> +	switch (boot_cpu_data.x86_model) {
> +	case INTEL_FAM6_ATOM_GOLDMONT:
> +		ipcdev.xtal_khz = 19200;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +

No. Use x86_match_id().

>  static int intel_pmc_ipc_check_status(void)
>  {
>  	int status;
> @@ -787,7 +801,7 @@ int intel_pmc_s0ix_counter_read(u64 *data)
>  	deep = gcr_data_readq(GCR_TELEM_DEEP_S0IX_OFFSET);
>  	shlw = gcr_data_readq(GCR_TELEM_SHLW_S0IX_OFFSET);
>  
> -	*data = S0IX_RESIDENCY_IN_USECS(deep, shlw);
> +	*data = S0IX_RESIDENCY_IN_USECS(deep, shlw, ipcdev.xtal_khz);

No.

Please, as I said earlier, start investing time into cleaning up the
stuff.

1. No more "ipcdev." use.
2. Split library part from scu_ipc and this driver to something like

intel_ipc_lib.c
 
>  	return 0;
>  }
> @@ -835,6 +849,12 @@ static int ipc_plat_probe(struct platform_device
> *pdev)
>  		goto err_irq;
>  	}
>  
> +	ret = get_xtal_clock_freq();

x86_match_id()

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to get XTAL freq\n");
> +		goto err_sys;
> +	}
> +
>  	ret = sysfs_create_group(&pdev->dev.kobj, &intel_ipc_group);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to create sysfs group
> %d\n",

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
