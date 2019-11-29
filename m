From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: pmc_atom: Add Siemens CONNECT X300 to
 critclk_systems DMI table
Date: Fri, 29 Nov 2019 12:15:38 +0200
Message-ID: <CAHp75Vc5A8pX1az+vH1E-d_4awKnyh60=KUYFbyT2ahEsQTkGQ@mail.gmail.com>
References: <20191129091650.4765-1-michael.haener@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191129091650.4765-1-michael.haener@siemens.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Haener <michael.haener@siemens.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 29, 2019 at 11:19 AM Michael Haener
<michael.haener@siemens.com> wrote:
>
> The CONNECT X300 uses the PMC clock for on-board components and gets
> stuck during boot if the clock is disabled. Therefore, add this
> device to the critical systems list.
> Tested on CONNECT X300.

Thank you for your patch!
Can you be more specific about the clock (which one? For example plt2)
and if possible type of hardware IP which is connected to it (for
example, Realtek Ethernet)?

> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> Signed-off-by: Michael Haener <michael.haener@siemens.com>
> ---
>  drivers/platform/x86/pmc_atom.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index 07d1b911e72f..57f06ca114a6 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -429,6 +429,14 @@ static const struct dmi_system_id critclk_systems[] = {
>                         DMI_MATCH(DMI_PRODUCT_VERSION, "6AV7882-0"),
>                 },
>         },
> +       {
> +               .ident = "CONNECT X300",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "A5E45074588")
> +               },
> +       },
> +
>         { /*sentinel*/ }
>  };
>
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
