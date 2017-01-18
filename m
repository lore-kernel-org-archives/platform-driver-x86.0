From: Tim Chen <tim.c.chen@linux.intel.com>
Subject: Re: [PATCH v2] platform: x86: Support Turbo Boost Max 3.0 for non
 HWP systems
Date: Wed, 18 Jan 2017 14:40:50 -0800
Message-ID: <1484779250.2833.34.camel@linux.intel.com>
References: <1484764155-183890-1-git-send-email-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484764155-183890-1-git-send-email-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, dvhart@infradead.org, andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2017-01-18 at 10:29 -0800, Srinivas Pandruvada wrote:
> 
> +
> +static int itmt_legacy_cpu_online(unsigned int cpu)
> +{
> +	static u32 max_highest_perf = 0, min_highest_perf = U32_MAX;

Should the max_highest_perf and min_highest_perf be defined and initialized
outside this function?  Otherwise the max and min value will be lost and reset
each time a new cpu comes online.

We will always find max_highest_perf == min_highest_perf.

Tim 

> +	int priority;
> +
> +	priority = get_oc_core_priority(cpu);
> +	if (priority < 0)
> +		return 0;
> +
> +	sched_set_itmt_core_prio(priority, cpu);
> +
> +	/* Enable ITMT feature when a core with different priority is found */
> +	if (max_highest_perf <= min_highest_perf) {
> +		if (priority > max_highest_perf)
> +			max_highest_perf = priority;
> +
> +		if (priority < min_highest_perf)
> +			min_highest_perf = priority;
> +
> +		if (max_highest_perf > min_highest_perf)
> +			schedule_work(&sched_itmt_work);
> +	}
> +
> +	return 0;
> +}
> +
