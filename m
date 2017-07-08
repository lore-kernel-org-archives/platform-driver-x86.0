From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 1/5] x86: stub out pmc function
Date: Sat, 8 Jul 2017 19:00:43 +0300
Message-ID: <CAHp75VeB_osvYsgmo5WcDbjB+ZWYVEG6CP043KxFoPximDReHA@mail.gmail.com>
References: <20170708000303.21863-1-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20170708000303.21863-1-dbasehore@chromium.org>
Sender: linux-pm-owner@vger.kernel.org
To: Derek Basehore <dbasehore@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, "x86@kernel.org" <x86@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jul 8, 2017 at 3:02 AM, Derek Basehore <dbasehore@chromium.org> wrote:
> This creates an inline function of intel_pmc_slp_s0_counter_read for
> !CONFIG_INTEL_PMC_CORE.

it doesn't make sense alone.
There is a plan to move this header to where it nowadays belongs to, i.e.
include/linux/platform_data/x86/.

Please, do this relocation first.

>
> Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> ---
>  arch/x86/include/asm/pmc_core.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/pmc_core.h b/arch/x86/include/asm/pmc_core.h
> index d4855f11136d..5d142d915f30 100644
> --- a/arch/x86/include/asm/pmc_core.h
> +++ b/arch/x86/include/asm/pmc_core.h
> @@ -22,6 +22,10 @@
>  #define _ASM_PMC_CORE_H
>
>  /* API to read SLP_S0_RESIDENCY counter */
> -int intel_pmc_slp_s0_counter_read(u32 *data);
> +#ifdef CONFIG_INTEL_PMC_CORE
> +extern int intel_pmc_slp_s0_counter_read(u32 *data);
> +#else
> +static inline int intel_pmc_slp_s0_counter_read(u32 *data) { return -EPERM; }
> +#endif
>
>  #endif /* _ASM_PMC_CORE_H */
> --
> 2.13.2.725.g09c95d1e9-goog
>



-- 
With Best Regards,
Andy Shevchenko
