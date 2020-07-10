From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: update TGL's LPM0 reg bit
 map name
Date: Fri, 10 Jul 2020 23:36:28 +0300
Message-ID: <CAHp75VfzHCudPC90j=6T1UQqF8TPmxXk0wQ_AS4aU5Dc3tjjcg@mail.gmail.com>
References: <20200625061616.85278-1-sathyanarayana.nujella@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200625061616.85278-1-sathyanarayana.nujella@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Gayatri Kammela <gayatri.kammela@intel.com>, Arava Jairaj <jairaj.arava@intel.com>, "David E . Box" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jun 25, 2020 at 9:16 AM Sathyanarayana Nujella
<sathyanarayana.nujella@intel.com> wrote:
>
> PMC debug tools use lpm0's 23rd bit to reflect Main PLL, not just
> Audio PLL. So, update tgl_lpm0 debug reg bit map name.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
> Signed-off-by: Arava Jairaj <jairaj.arava@intel.com>
> Acked-by: David E. Box <david.e.box@intel.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index d2a5d4c36715..60bf93638f55 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -415,7 +415,7 @@ static const struct pmc_bit_map tgl_lpm0_map[] = {
>         {"PCIe_Gen3PLL_OFF_STS",                BIT(20)},
>         {"OPIOPLL_OFF_STS",                     BIT(21)},
>         {"OCPLL_OFF_STS",                       BIT(22)},
> -       {"AudioPLL_OFF_STS",                    BIT(23)},
> +       {"MainPLL_OFF_STS",                     BIT(23)},
>         {"MIPIPLL_OFF_STS",                     BIT(24)},
>         {"Fast_XTAL_Osc_OFF_STS",               BIT(25)},
>         {"AC_Ring_Osc_OFF_STS",                 BIT(26)},
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
