From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] X86: intel_ips, check for kzalloc properly
Date: Mon, 21 Jun 2010 09:58:07 -0700
Message-ID: <20100621095807.28c13775@virtuousgeek.org>
References: <20100621083418.6315d1d5@virtuousgeek.org>
	<1277134815-17666-1-git-send-email-jslaby@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy2-pub.bluehost.com ([67.222.39.38]:54918 "HELO
	cpoproxy2-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758028Ab0FUQ7z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Jun 2010 12:59:55 -0400
In-Reply-To: <1277134815-17666-1-git-send-email-jslaby@suse.cz>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jiri Slaby <jslaby@suse.cz>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jirislaby@gmail.com

On Mon, 21 Jun 2010 17:40:15 +0200
Jiri Slaby <jslaby@suse.cz> wrote:

> Or what about this one?
> 
> --
> 
> Stanse found that there are two NULL checks missing in ips_monitor. So
> check their value too and bail out appropriately if the allocation
> failed.
> 
> While at it, add one more kfree to the fail path. It is not necessary
> now, but may be needed in the future when a new allocation is added.
> And for completeness.
> 
> Also remove unneeded initialization of the variables. They are all set
> right after their declaration.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Jesse Barnes <jbarnes@virtuousgeek.org>
> Cc: Matthew Garrett <mjg@redhat.com>
> ---
>  drivers/platform/x86/intel_ips.c |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> index cdaf40e..0344822 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -920,9 +920,8 @@ static int ips_monitor(void *data)
>  	struct timer_list timer;
>  	unsigned long seqno_timestamp, expire, last_msecs, last_sample_period;
>  	int i;
> -	u32 *cpu_samples = NULL, *mchp_samples = NULL, old_cpu_power;
> -	u16 *mcp_samples = NULL, *ctv1_samples = NULL, *ctv2_samples = NULL,
> -		*mch_samples = NULL;
> +	u32 *cpu_samples, *mchp_samples, old_cpu_power;
> +	u16 *mcp_samples, *ctv1_samples, *ctv2_samples, *mch_samples;
>  	u8 cur_seqno, last_seqno;
>  
>  	mcp_samples = kzalloc(sizeof(u16) * IPS_SAMPLE_COUNT, GFP_KERNEL);
> @@ -931,7 +930,8 @@ static int ips_monitor(void *data)
>  	mch_samples = kzalloc(sizeof(u16) * IPS_SAMPLE_COUNT, GFP_KERNEL);
>  	cpu_samples = kzalloc(sizeof(u32) * IPS_SAMPLE_COUNT, GFP_KERNEL);
>  	mchp_samples = kzalloc(sizeof(u32) * IPS_SAMPLE_COUNT, GFP_KERNEL);
> -	if (!mcp_samples || !ctv1_samples || !ctv2_samples || !mch_samples) {
> +	if (!mcp_samples || !ctv1_samples || !ctv2_samples || !mch_samples ||
> +			!cpu_samples || !mchp_samples) {
>  		dev_err(&ips->dev->dev,
>  			"failed to allocate sample array, ips disabled\n");
>  		kfree(mcp_samples);
> @@ -939,6 +939,7 @@ static int ips_monitor(void *data)
>  		kfree(ctv2_samples);
>  		kfree(mch_samples);
>  		kfree(cpu_samples);
> +		kfree(mchp_samples);
>  		kthread_stop(ips->adjust);
>  		return -ENOMEM;
>  	}

Even better.

Acked-by: Jesse Barnes <jbarnes@virtuousgeek.org>

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center
