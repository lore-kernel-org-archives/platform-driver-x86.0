From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] platform/x86: intel_pmc_core: transform Pkg C-state
 residency from TSC ticks into microseconds
Date: Sat, 29 Jun 2019 16:24:11 +0300
Message-ID: <CAHp75VdnL1CHvbo+JWwKVhCaqnT45GVVjtLKppnvnbOPfvbURw@mail.gmail.com>
References: <20190528025727.6014-1-harry.pan@intel.com> <20190619082801.21699-1-harry.pan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190619082801.21699-1-harry.pan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Harry Pan <harry.pan@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, gs0622@gmail.com, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 19, 2019 at 11:29 AM Harry Pan <harry.pan@intel.com> wrote:
>
> Refer to the Intel SDM Vol.4, the package C-state residency counters
> of modern IA micro-architecture are all ticking in TSC frequency,
> hence we can apply simple math to transform the ticks into microseconds.
> i.e.,
> residency (ms) = count / tsc_khz
> residency (us) = count / tsc_khz * 1000
>
> This also aligns to other sysfs debug entries of residency counter in
> the same metric in microseconds, benefits reading and scripting.
>
> v2: restore the accidentally deleted newline, no function change.
> v3: apply kernel do_div() macro to calculate division
>
> Signed-off-by: Harry Pan <harry.pan@intel.com>
>

Pushed to my review and testing queue, thanks!

> ---
>
>  drivers/platform/x86/intel_pmc_core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index f2c621b55f49..ab798efacc85 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -24,6 +24,7 @@
>  #include <asm/cpu_device_id.h>
>  #include <asm/intel-family.h>
>  #include <asm/msr.h>
> +#include <asm/tsc.h>
>
>  #include "intel_pmc_core.h"
>
> @@ -738,7 +739,9 @@ static int pmc_core_pkgc_show(struct seq_file *s, void *unused)
>                 if (rdmsrl_safe(map[index].bit_mask, &pcstate_count))
>                         continue;
>
> -               seq_printf(s, "%-8s : 0x%llx\n", map[index].name,
> +               pcstate_count *= 1000;
> +               do_div(pcstate_count, tsc_khz);
> +               seq_printf(s, "%-8s : %llu\n", map[index].name,
>                            pcstate_count);
>         }
>
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
