From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH 1/2] IPS driver: don't toggle CPU turbo on unsupported
 CPUs
Date: Thu, 23 Sep 2010 14:51:38 -0700
Message-ID: <20100923145138.0f9875cb@jbarnes-desktop>
References: <1285278569-4368-1-git-send-email-jbarnes@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy1-pub.bluehost.com ([69.89.21.11]:50683 "HELO
	cpoproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1755224Ab0IWVvl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Sep 2010 17:51:41 -0400
In-Reply-To: <1285278569-4368-1-git-send-email-jbarnes@virtuousgeek.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: platform-driver-x86@vger.kernel.org, mjg59@redhat.com, infernix <infernix@infernix.net>

On Thu, 23 Sep 2010 23:49:28 +0200
Jesse Barnes <jbarnes@virtuousgeek.org> wrote:

> If the CPU doesn't support turbo, don't try to enable/disable it.
> 
> Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
> ---
>  drivers/platform/x86/intel_ips.c |   14 +++++++++-----
>  1 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> index bfa9c72..71d04ef 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -51,7 +51,6 @@
>   * TODO:
>   *   - handle CPU hotplug
>   *   - provide turbo enable/disable api
> - *   - make sure we can write turbo enable/disable reg based on MISC_EN
>   *
>   * Related documents:
>   *   - CDI 403777, 403778 - Auburndale EDS vol 1 & 2
> @@ -325,6 +324,7 @@ struct ips_driver {
>  	bool gpu_preferred;
>  	bool poll_turbo_status;
>  	bool second_cpu;
> +	bool turbo_toggle_allowed;
>  	struct ips_mcp_limits *limits;
>  
>  	/* Optional MCH interfaces for if i915 is in use */
> @@ -461,7 +461,8 @@ static void ips_enable_cpu_turbo(struct ips_driver *ips)
>  	if (ips->__cpu_turbo_on)
>  		return;
>  
> -	on_each_cpu(do_enable_cpu_turbo, ips, 1);
> +	if (ips->turbo_toggle_allowed)
> +		on_each_cpu(do_enable_cpu_turbo, ips, 1);
>  
>  	ips->__cpu_turbo_on = true;
>  }
> @@ -498,7 +499,8 @@ static void ips_disable_cpu_turbo(struct ips_driver *ips)
>  	if (!ips->__cpu_turbo_on)
>  		return;
>  
> -	on_each_cpu(do_disable_cpu_turbo, ips, 1);
> +	if (ips->turbo_toggle_allowed)
> +		on_each_cpu(do_disable_cpu_turbo, ips, 1);
>  
>  	ips->__cpu_turbo_on = false;
>  }
> @@ -1332,8 +1334,10 @@ static struct ips_mcp_limits *ips_detect_cpu(struct ips_driver *ips)
>  	 * turbo manually or we'll get an illegal MSR access, even though
>  	 * turbo will still be available.
>  	 */
> -	if (!(misc_en & IA32_MISC_TURBO_EN))
> -		; /* add turbo MSR write allowed flag if necessary */
> +	if (misc_en & IA32_MISC_TURBO_EN)
> +		ips->turbo_toggle_allowed = true;
> +	else
> +		ips->turbo_toggle_allowed = false;
>  
>  	if (strstr(boot_cpu_data.x86_model_id, "CPU       M"))
>  		limits = &ips_sv_limits;

Rafael and infernix, this patch should address the GPF in the IPS
driver (kernel bug 18742).

Matthew, since I forgot to add a link to the kernel bug in the log, can
you add it when you commit?

http://bugzilla.kernel.org/show_bug.cgi?id=18742

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center
