From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: Fix CLX-N package
 information output
Date: Wed, 15 Apr 2020 19:10:43 +0300
Message-ID: <20200415161043.GU185537@smile.fi.intel.com>
References: <20200402180732.24684-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200402180732.24684-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prarit Bhargava <prarit@redhat.com>
Cc: linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 02, 2020 at 02:07:32PM -0400, Prarit Bhargava wrote:
> On CLX-N the perf-profile output is missing the package, die, and cpu
> output.  On CLX-N the pkg_dev struct will never be evaluated by the core
> code so pkg_dev.processed is always 0 and the package, die, and cpu
> information is never output.
> 
> Set the pkg_dev.processed flag to 1 for CLX-N processors.

I will accept this with PR from Srinivas whenever he sends one to public mailing list.

> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
> Cc: andriy.shevchenko@linux.intel.com
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  tools/power/x86/intel-speed-select/isst-config.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
> index d1ac57be0cbd..2e64b9b6eb2e 100644
> --- a/tools/power/x86/intel-speed-select/isst-config.c
> +++ b/tools/power/x86/intel-speed-select/isst-config.c
> @@ -1169,6 +1169,7 @@ static void dump_clx_n_config_for_cpu(int cpu, void *arg1, void *arg2,
>  
>  		ctdp_level = &clx_n_pkg_dev.ctdp_level[0];
>  		pbf_info = &ctdp_level->pbf_info;
> +		clx_n_pkg_dev.processed = 1;
>  		isst_ctdp_display_information(cpu, outf, tdp_level, &clx_n_pkg_dev);
>  		free_cpu_set(ctdp_level->core_cpumask);
>  		free_cpu_set(pbf_info->core_cpumask);
> -- 
> 2.18.2
> 

-- 
With Best Regards,
Andy Shevchenko
