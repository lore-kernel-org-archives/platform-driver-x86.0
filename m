From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform: intel_turbo_max_3: make it explicitly
 non-modular
Date: Thu, 16 Feb 2017 19:37:12 -0800
Message-ID: <20170217033712.GA25241@wisp>
References: <20170214003700.8978-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:50666 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754684AbdBQDhO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2017 22:37:14 -0500
Content-Disposition: inline
In-Reply-To: <20170214003700.8978-1-paul.gortmaker@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, platform-driver-x86@vger.kernel.org

On Mon, Feb 13, 2017 at 07:37:00PM -0500, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> drivers/platform/x86/Kconfig:config INTEL_TURBO_MAX_3
> drivers/platform/x86/Kconfig:   bool "Intel Turbo Boost Max Technology 3.0 enumeration driver"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
> 
> We do uncover some implicit includes during build coverage that
> were hidden behind the module.h which pulls in a lot of dependants.
> 

Paul, this all looks so very familiar... have we been through this before? Maybe
for another driver...

> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Srinivas, any objections?

> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  drivers/platform/x86/intel_turbo_max_3.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_turbo_max_3.c b/drivers/platform/x86/intel_turbo_max_3.c
> index 0103f5b32e34..4f60d8e32a0a 100644
> --- a/drivers/platform/x86/intel_turbo_max_3.c
> +++ b/drivers/platform/x86/intel_turbo_max_3.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2017, Intel Corporation.
>   * All rights reserved.
>   *
> + * Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> + *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
>   * version 2, as published by the Free Software Foundation.
> @@ -16,7 +18,9 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/kernel.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/topology.h>
> +#include <linux/workqueue.h>
>  #include <linux/cpuhotplug.h>
>  #include <linux/cpufeature.h>
>  #include <asm/cpu_device_id.h>
> @@ -123,7 +127,6 @@ static const struct x86_cpu_id itmt_legacy_cpu_ids[] = {
>  	ICPU(INTEL_FAM6_BROADWELL_X),
>  	{}
>  };
> -MODULE_DEVICE_TABLE(x86cpu, itmt_legacy_cpu_ids);
>  
>  static int __init itmt_legacy_init(void)
>  {
> @@ -146,7 +149,3 @@ static int __init itmt_legacy_init(void)
>  	return 0;
>  }
>  late_initcall(itmt_legacy_init)
> -
> -MODULE_DESCRIPTION("Intel Turbo Boost Max 3.0 enumeration driver");
> -MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
> -MODULE_LICENSE("GPL v2");
> -- 
> 2.11.0
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
