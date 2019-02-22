From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Avoid a u32 overflow
Date: Fri, 22 Feb 2019 09:10:27 +0530
Message-ID: <6dc61237-5424-506c-2d31-11658cc52caf@linux.intel.com>
References: <20190216001920.178053-1-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190216001920.178053-1-rajatja@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rajat Jain <rajatja@google.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: rajatxjain@gmail.com
List-Id: platform-driver-x86.vger.kernel.org


On 16-Feb-19 5:49 AM, Rajat Jain wrote:
> The register (SLP_S0_RES) at offset slp_s0_offset is a 32 bit register.
> The pmc_core_adjust_slp_s0_step() could overflow the u32 value while
> returning it after adjusting the step. Thus change to u64, this is
> already accounted for in debugfs attribute (that wants to output a
> 64 bit value).
>
> Signed-off-by: Rajat Jain <rajatja@google.com>

Acked-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>

> ---
>   drivers/platform/x86/intel_pmc_core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 22dbf115782e..f90f4dd25151 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -328,9 +328,9 @@ static inline void pmc_core_reg_write(struct pmc_dev *pmcdev, int
>   	writel(val, pmcdev->regbase + reg_offset);
>   }
>   
> -static inline u32 pmc_core_adjust_slp_s0_step(u32 value)
> +static inline u64 pmc_core_adjust_slp_s0_step(u32 value)
>   {
> -	return value * SPT_PMC_SLP_S0_RES_COUNTER_STEP;
> +	return (u64)value * SPT_PMC_SLP_S0_RES_COUNTER_STEP;
>   }
>   
>   static int pmc_core_dev_state_get(void *data, u64 *val)
>
>
