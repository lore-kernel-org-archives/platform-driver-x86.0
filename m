From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86/pcengines-apuv2: add mpcie reset gpio export
Date: Wed, 31 Jul 2019 12:42:55 +0300
Message-ID: <CAHp75VfoVr8wjeNj5KBUsexgREaCJYcr=1dPLDcQNN=VUAtdTw@mail.gmail.com>
References: <1564557670-10849-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564557670-10849-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 31, 2019 at 10:21 AM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> From: Florian Eckert <fe@dev.tdt.de>
>
> On APUx we have also mpcie2/mpcie3 reset pins. To make it possible to reset
> the ports from the userspace, add the definition to this platform
> device. The gpio can then be exported by the legancy gpio subsystem to
> toggle the mpcie reset pin.
>
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> Acked-By: Enrico Weigelt <info@metux.net>

I'm not sure why you resend this, where is the changelog, where is the
version bump?..

> Author: Florian Eckert <fe@dev.tdt.de>

...moreover, what's this? We have From line and the first SoB in the
chain for authorship. If, in case, the author is not available and
some rework done, we usually give a credit as Co-developed-by or in
the commit message.

> ---
>  drivers/platform/x86/pcengines-apuv2.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index e4c68ef..56703656 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -32,6 +32,8 @@
>  #define APU2_GPIO_REG_LED3             AMD_FCH_GPIO_REG_GPIO59_DEVSLP1
>  #define APU2_GPIO_REG_MODESW           AMD_FCH_GPIO_REG_GPIO32_GE1
>  #define APU2_GPIO_REG_SIMSWAP          AMD_FCH_GPIO_REG_GPIO33_GE2
> +#define APU2_GPIO_REG_MPCIE2           AMD_FCH_GPIO_REG_GPIO59_DEVSLP0
> +#define APU2_GPIO_REG_MPCIE3           AMD_FCH_GPIO_REG_GPIO51
>
>  /* order in which the gpio lines are defined in the register list */
>  #define APU2_GPIO_LINE_LED1            0
> @@ -39,6 +41,8 @@
>  #define APU2_GPIO_LINE_LED3            2
>  #define APU2_GPIO_LINE_MODESW          3
>  #define APU2_GPIO_LINE_SIMSWAP         4
> +#define APU2_GPIO_LINE_MPCIE2          5
> +#define APU2_GPIO_LINE_MPCIE3          6
>
>  /* gpio device */
>
> @@ -48,6 +52,8 @@
>         [APU2_GPIO_LINE_LED3]           = APU2_GPIO_REG_LED3,
>         [APU2_GPIO_LINE_MODESW]         = APU2_GPIO_REG_MODESW,
>         [APU2_GPIO_LINE_SIMSWAP]        = APU2_GPIO_REG_SIMSWAP,
> +       [APU2_GPIO_LINE_MPCIE2]         = APU2_GPIO_REG_MPCIE2,
> +       [APU2_GPIO_LINE_MPCIE3]         = APU2_GPIO_REG_MPCIE3,
>  };
>
>  static const char * const apu2_gpio_names[] = {
> @@ -56,6 +62,8 @@
>         [APU2_GPIO_LINE_LED3]           = "front-led3",
>         [APU2_GPIO_LINE_MODESW]         = "front-button",
>         [APU2_GPIO_LINE_SIMSWAP]        = "simswap",
> +       [APU2_GPIO_LINE_MPCIE2]         = "mpcie2_reset",
> +       [APU2_GPIO_LINE_MPCIE3]         = "mpcie3_reset",
>  };
>
>  static const struct amd_fch_gpio_pdata board_apu2 = {
> --
> 1.9.1
>


-- 
With Best Regards,
Andy Shevchenko
