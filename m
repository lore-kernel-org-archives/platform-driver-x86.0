From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_ips: remove redundant variables slope
 and offset
Date: Fri, 13 Jul 2018 17:52:24 +0300
Message-ID: <CAHp75VcHniqfcsSZmZY-qU=Cx8u64u-ixuhvRbV2wFXVeJW4rg@mail.gmail.com>
References: <20180711080910.4769-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180711080910.4769-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 11, 2018 at 11:09 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Variables slope and offset are being assigned but are never used hence
> they are redundant and can be removed.
>

Sounds like some half-baked calculus and perhaps would be fixed
better. Though, no one complained so far and git will keep previous
version in index anyway.

> Cleans up clang warnings:
> warning: variable 'slope' set but not used [-Wunused-but-set-variable]
> warning: variable 'offset' set but not used [-Wunused-but-set-variable]
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/platform/x86/intel_ips.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> index 014fc1634a3d..c5ece7ef08c6 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -858,10 +858,7 @@ static u16 read_mgtv(struct ips_driver *ips)
>
>  static u16 read_ptv(struct ips_driver *ips)
>  {
> -       u16 val, slope, offset;
> -
> -       slope = (ips->pta_val & PTA_SLOPE_MASK) >> PTA_SLOPE_SHIFT;
> -       offset = ips->pta_val & PTA_OFFSET_MASK;
> +       u16 val;
>
>         val = thm_readw(THM_PTV) & PTV_MASK;
>
> --
> 2.17.1
>



-- 
With Best Regards,
Andy Shevchenko
