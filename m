From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: pmc_atom: Add CB4063 Beckhoff Automation
 board to critclk_systems DMI table
Date: Sat, 29 Jun 2019 17:18:44 +0300
Message-ID: <CAHp75VfT6NvAv8C-bNKu36_9R=H1f05QRQppNA19R7O=1qhzRQ@mail.gmail.com>
References: <20190618133102.8083-1-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618133102.8083-1-linux-kernel-dev@beckhoff.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel-dev@beckhoff.com
Cc: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 18, 2019 at 4:34 PM <linux-kernel-dev@beckhoff.com> wrote:
>
> From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
>
> The CB4063 board uses pmc_plt_clk* clocks for ethernet controllers. This
> adds it to the critclk_systems DMI table so the clocks are marked as
> CLK_CRITICAL and not turned off.
>

Pushed to my review and testing queue, thanks!

> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> Signed-off-by: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
> ---
>  drivers/platform/x86/pmc_atom.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index be802fd2182d..551ed44dd361 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -412,6 +412,14 @@ static const struct dmi_system_id critclk_systems[] = {
>                         DMI_MATCH(DMI_BOARD_NAME, "CB3163"),
>                 },
>         },
> +       {
> +               /* pmc_plt_clk* - are used for ethernet controllers */
> +               .ident = "Beckhoff CB4063",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "CB4063"),
> +               },
> +       },
>         {
>                 /* pmc_plt_clk* - are used for ethernet controllers */
>                 .ident = "Beckhoff CB6263",
> --
> 2.22.0



-- 
With Best Regards,
Andy Shevchenko
