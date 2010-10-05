From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH 1/1] intel_ips -- ensure we do not enable gpu turbo mode
 without driver linkage
Date: Tue, 5 Oct 2010 09:16:29 -0700
Message-ID: <20101005091629.7a602f32@jbarnes-desktop>
References: <1286268522-26337-1-git-send-email-apw@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy3-pub.bluehost.com ([67.222.54.6]:35958 "HELO
	cpoproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1755300Ab0JEQPa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Oct 2010 12:15:30 -0400
In-Reply-To: <1286268522-26337-1-git-send-email-apw@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Whitcroft <apw@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, Jiri Slaby <jslaby@suse.cz>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue,  5 Oct 2010 09:48:42 +0100
Andy Whitcroft <apw@canonical.com> wrote:

> Both when polling the current turbo status (in poll_turbo_status mode)
> and when handling thermal events (in ips_irq_handler) the current status
> of GPU turbo is updated to match the hardware status.  However if during
> driver initialisation we were unable aquire linkage to the i915 driver
> enabling GPU turbo will lead to an oops on the first attempt to determine
> GPU busy status.
> 
> Ensure that we do not enable GPU turbo unless we have driver linkage.
> 
> BugLink: http://bugs.launchpad.net/bugs/632430
> Cc: stable@kernel.org
> Signed-off-by: Andy Whitcroft <apw@canonical.com>
> ---
>  drivers/platform/x86/intel_ips.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> index afe82e5..3ca50b3 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -680,7 +680,8 @@ static void update_turbo_limits(struct ips_driver *ips)
>  	u32 hts = thm_readl(THM_HTS);
>  
>  	ips->cpu_turbo_enabled = !(hts & HTS_PCTD_DIS);
> -	ips->gpu_turbo_enabled = !(hts & HTS_GTD_DIS);
> +	if (ips->gpu_busy)
> +		ips->gpu_turbo_enabled = !(hts & HTS_GTD_DIS);
>  	ips->core_power_limit = thm_readw(THM_MPCPC);
>  	ips->mch_power_limit = thm_readw(THM_MMGPC);
>  	ips->mcp_temp_limit = thm_readw(THM_PTL);
> @@ -1150,7 +1151,8 @@ static irqreturn_t ips_irq_handler(int irq, void *arg)
>  				STS_GPL_SHIFT;
>  			/* ignore EC CPU vs GPU pref */
>  			ips->cpu_turbo_enabled = !(sts & STS_PCTD_DIS);
> -			ips->gpu_turbo_enabled = !(sts & STS_GTD_DIS);
> +			if (ips->gpu_busy)
> +				ips->gpu_turbo_enabled = !(sts & STS_GTD_DIS);
>  			ips->mcp_temp_limit = (sts & STS_PTL_MASK) >>
>  				STS_PTL_SHIFT;
>  			ips->mcp_power_limit = (tc1 & STS_PPL_MASK) >>

Looks good, thanks.  Most of the performance upside is on the GPU, so
running without i915 is a shame, but we definitely shouldn't oops, so
this patch looks fine.

Acked-by: Jesse Barnes <jbarnes@virtuousgeek.org>

-- 
Jesse Barnes, Intel Open Source Technology Center
