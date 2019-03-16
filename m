From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH 2/2] platform/x86: intel_pmc_core: Allow to dump debug
 registers on S0ix failure
Date: Sat, 16 Mar 2019 14:00:24 +0530
Message-ID: <20190316083024.GB21812@raj-desk2.iind.intel.com>
References: <20190313222124.229371-1-rajatja@google.com>
 <20190313222124.229371-2-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190313222124.229371-2-rajatja@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajat Jain <rajatja@google.com>
Cc: Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, furquan@google.com, evgreen@google.com, rajatxjain@gmail.com, rajneesh.bhardwaj@linux.intel.com, srinivas.pandruvada@linux.intel.com, david.e.box@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Mar 13, 2019 at 03:21:24PM -0700, Rajat Jain wrote:
> Add a module parameter which when enabled, will check on resume, if the
> last S0ix attempt was successful. If not, the driver would provide
> helpful debug information (which gets latched during the failed suspend
> attempt) to debug the S0ix failure.

+ Srinivas and David.

> 
> This information is very useful to debug S0ix failures. Specially since
> the latched debug information will be lost (over-written) if the system
> attempts to go into runtime (or imminent) S0ix again after that failed
> suspend attempt.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 86 +++++++++++++++++++++++++++
>  drivers/platform/x86/intel_pmc_core.h |  7 +++
>  2 files changed, 93 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 55578d07610c..b1f4405a27ce 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -20,6 +20,7 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/suspend.h>
>  #include <linux/uaccess.h>
>  
>  #include <asm/cpu_device_id.h>
> @@ -890,9 +891,94 @@ static int pmc_core_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +
> +static bool warn_on_s0ix_failures;
> +module_param(warn_on_s0ix_failures, bool, 0644);
> +MODULE_PARM_DESC(warn_on_s0ix_failures, "Check and warn for S0ix failures");
> +
> +static int pmc_core_suspend(struct device *dev)
> +{
> +	struct pmc_dev *pmcdev = dev_get_drvdata(dev);
> +
> +	/* Save PC10 and S0ix residency for checking later */
> +	if (warn_on_s0ix_failures &&
> +	    !rdmsrl_safe(MSR_PKG_C10_RESIDENCY, &pmcdev->pc10_counter) &&
> +	    !pmc_core_dev_state_get(pmcdev, &pmcdev->s0ix_counter))
> +		pmcdev->check_counters = true;
> +	else
> +		pmcdev->check_counters = false;
> +
> +	return 0;
> +}
> +
> +static inline bool pc10_failed(struct pmc_dev *pmcdev)
> +{
> +	u64 pc10_counter;
> +
> +	if (!rdmsrl_safe(MSR_PKG_C10_RESIDENCY, &pc10_counter) &&
> +	    pc10_counter == pmcdev->pc10_counter)
> +		return true;
> +	else
> +		return false;
> +}
> +
> +static inline bool s0ix_failed(struct pmc_dev *pmcdev)
> +{
> +	u64 s0ix_counter;
> +
> +	if (!pmc_core_dev_state_get(pmcdev, &s0ix_counter) &&
> +	    s0ix_counter == pmcdev->s0ix_counter)
> +		return true;
> +	else
> +		return false;
> +}
> +
> +static int pmc_core_resume(struct device *dev)
> +{
> +	struct pmc_dev *pmcdev = dev_get_drvdata(dev);
> +
> +	if (!pmcdev->check_counters)
> +		return 0;
> +
> +	if (pc10_failed(pmcdev)) {
> +		dev_info(dev, "PC10 entry had failed (PC10 cnt=0x%llx)\n",
> +			 pmcdev->pc10_counter);
> +	} else if (s0ix_failed(pmcdev)) {
> +
> +		const struct pmc_bit_map **maps = pmcdev->map->slps0_dbg_maps;

slps0_dbg feature is not available on Skylake and Kabylake. PCH IP power
gating status is available on all.

> +		const struct pmc_bit_map *map;
> +		int offset = pmcdev->map->slps0_dbg_offset;
> +		u32 data;
> +
> +		dev_warn(dev, "S0ix entry had failed (S0ix cnt=%llu)\n",
> +			 pmcdev->s0ix_counter);

I feel this dev_warn may be frowned upon and should be possible kept behind
something like pm_debug_messages_on though module param helps mitigate it.

> +		while (*maps) {
> +			map = *maps;
> +			data = pmc_core_reg_read(pmcdev, offset);
> +			offset += 4;
> +			while (map->name) {
> +				dev_warn(dev, "SLP_S0_DBG: %-32s\tState: %s\n",
> +					 map->name,
> +					 data & map->bit_mask ? "Yes" : "No");
> +				++map;
> +			}
> +			++maps;
> +		}
> +	}
> +	return 0;
> +}
> +
> +#endif
> +
> +const struct dev_pm_ops pmc_core_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(pmc_core_suspend, pmc_core_resume)
> +};
> +
>  static struct platform_driver pmc_core_driver = {
>  	.driver = {
>  		.name = "pmc_core",
> +		.pm = &pmc_core_pm_ops
>  	},
>  	.probe = pmc_core_probe,
>  	.remove = pmc_core_remove,
> diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
> index 88d9c0653a5f..fdee5772e532 100644
> --- a/drivers/platform/x86/intel_pmc_core.h
> +++ b/drivers/platform/x86/intel_pmc_core.h
> @@ -241,6 +241,9 @@ struct pmc_reg_map {
>   * @pmc_xram_read_bit:	flag to indicate whether PMC XRAM shadow registers
>   *			used to read MPHY PG and PLL status are available
>   * @mutex_lock:		mutex to complete one transcation
> + * @check_counters:	On resume, check if counters are getting incremented
> + * @pc10_counter:	PC10 residency counter
> + * @s0ix_counter:	S0ix residency (step adjusted)
>   *
>   * pmc_dev contains info about power management controller device.
>   */
> @@ -253,6 +256,10 @@ struct pmc_dev {
>  #endif /* CONFIG_DEBUG_FS */
>  	int pmc_xram_read_bit;
>  	struct mutex lock; /* generic mutex lock for PMC Core */
> +
> +	bool check_counters; /* Check for counter increments on resume */
> +	u64 pc10_counter;
> +	u64 s0ix_counter;
>  };
>  
>  #endif /* PMC_CORE_H */
> -- 
> 2.21.0.360.g471c308f928-goog
> 

-- 
Best Regards,
Rajneesh
