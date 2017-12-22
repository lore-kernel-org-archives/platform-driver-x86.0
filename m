From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] Fix const confusion in intel-mid x86 platform drivers
Date: Thu, 21 Dec 2017 18:08:35 -0800
Message-ID: <20171222020835.GA17014@fury>
References: <20171222001443.2067-1-andi@firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:35915 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756039AbdLVCIr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Dec 2017 21:08:47 -0500
Content-Disposition: inline
In-Reply-To: <20171222001443.2067-1-andi@firstfloor.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org

On Thu, Dec 21, 2017 at 04:14:43PM -0800, Andi Kleen wrote:
> From: Andi Kleen <ak@linux.intel.com>
> 
> const must be marked __initconst, not __initdata
> 

Thanks Andi,

This file should go through the x86 maintainers per the current MAINTAINERS
file. So to avoid risk of duplication, added Thomas et al. to Cc.

Thomas, we discussed moving more of arch/x86/platform to drivers/platform/x86.
We have migrated pmc_atom already, but a lot remains. Do you want to pull
patches like this in the interim, or should we move arch/x86/platform under
our entry in MAINTAINERS now?

Reviewed-by: Darren Hart (VMware) <dvhart@infradead.org>


> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> ---
>  arch/x86/platform/intel-mid/device_libs/platform_bt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/platform/intel-mid/device_libs/platform_bt.c b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> index dc036e511f48..2b5d86ce24c2 100644
> --- a/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> +++ b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> @@ -60,7 +60,7 @@ static int __init tng_bt_sfi_setup(struct bt_sfi_data *ddata)
>  	return 0;
>  }
>  
> -static const struct bt_sfi_data tng_bt_sfi_data __initdata = {
> +static const struct bt_sfi_data tng_bt_sfi_data __initconst = {
>  	.setup	= tng_bt_sfi_setup,
>  };
>  
> -- 
> 2.15.0
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
