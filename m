From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] [drivers/x86] fix bound check in pmc_core_mphy_pg_show
Date: Fri, 10 Jul 2020 23:35:56 +0300
Message-ID: <CAHp75VcQRLT6z0wb+iCfWr1hmrcLS0Rg6TpTx5rK1EbvPzq9VA@mail.gmail.com>
References: <20200624033126.5972-1-gaurav1086@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200624033126.5972-1-gaurav1086@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gaurav Singh <gaurav1086@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:INTEL PMC CORE DRIVER" <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 24, 2020 at 6:31 AM Gaurav Singh <gaurav1086@gmail.com> wrote:
>
> Check bounds before accessing map[].
>

Pushed to my review and testing queue, thanks!


> Signed-off-by: Gaurav Singh <gaurav1086@gmail.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 7c8bdab078cf..f571f9cf7217 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -795,7 +795,7 @@ static int pmc_core_mphy_pg_show(struct seq_file *s, void *unused)
>         msleep(10);
>         val_high = pmc_core_reg_read(pmcdev, SPT_PMC_MFPMC_OFFSET);
>
> -       for (index = 0; map[index].name && index < 8; index++) {
> +       for (index = 0; index < 8 && map[index].name; index++) {
>                 seq_printf(s, "%-32s\tState: %s\n",
>                            map[index].name,
>                            map[index].bit_mask & val_low ? "Not power gated" :
> --
> 2.17.1
>


--
With Best Regards,
Andy Shevchenko
