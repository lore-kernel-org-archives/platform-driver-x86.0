From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Add ICL-NNPI support to PMC Core
Date: Sat, 29 Jun 2019 16:18:45 +0300
Message-ID: <CAHp75VfMdKqpC3_gF-VzcJQqiWM9E0irORr60KLXyu8HuQg9KA@mail.gmail.com>
References: <20190614080940.13640-1-rajneesh.bhardwaj@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614080940.13640-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 14, 2019 at 11:14 AM Rajneesh Bhardwaj
<rajneesh.bhardwaj@linux.intel.com> wrote:
>
> Ice Lake Neural Network Processor for deep learning inference a.k.a.
> ICL-NNPI can re-use Ice Lake Mobile regmap to enable Intel PMC Core
> driver on it.
>

This will be postponed till next cycle since the CPU model will not
appear before merge window.
So, please, resend than (I guess somewhat in a month).

> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: platform-driver-x86@vger.kernel.org
> Link: https://lkml.org/lkml/2019/6/5/1034
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 1d902230ba61..be6cda89dcf5 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -815,6 +815,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
>         INTEL_CPU_FAM6(KABYLAKE_DESKTOP, spt_reg_map),
>         INTEL_CPU_FAM6(CANNONLAKE_MOBILE, cnp_reg_map),
>         INTEL_CPU_FAM6(ICELAKE_MOBILE, icl_reg_map),
> +       INTEL_CPU_FAM6(ICELAKE_NNPI, icl_reg_map),
>         {}
>  };
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
