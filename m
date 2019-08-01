From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform: x86: pcengines-apu2: wire up simswitch gpio as led
Date: Thu, 1 Aug 2019 18:01:13 +0300
Message-ID: <CAHp75Ver+VL1RHB9oD0voSsLNYTtJovS=haz9MjFu+kUdS3A5A@mail.gmail.com>
References: <1564411166-23693-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564411166-23693-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 29, 2019 at 5:39 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> From: Enrico Weigelt <info@metux.net>
>
> The APU3+ boards have two SIM sockets, while only one of them
> can be routed to the mpcie slots at a time. Selection is done
> via simswap gpio.
>
> We currently don't have a fitting subsystem for those cases yet,
> so just wire it up to a LED for the time being. While this isn't
> really semantically correct, it's a good compromise.
>

Applied, thanks!

> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>  drivers/platform/x86/pcengines-apuv2.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index b0d3110..adecd6a 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -69,7 +69,8 @@
>  static const struct gpio_led apu2_leds[] = {
>         { .name = "apu:green:1" },
>         { .name = "apu:green:2" },
> -       { .name = "apu:green:3" }
> +       { .name = "apu:green:3" },
> +       { .name = "apu:simswap" },
>  };
>
>  static const struct gpio_led_platform_data apu2_leds_pdata = {
> @@ -86,6 +87,8 @@
>                                 NULL, 1, GPIO_ACTIVE_LOW),
>                 GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_LED3,
>                                 NULL, 2, GPIO_ACTIVE_LOW),
> +               GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_REG_SIMSWAP,
> +                               NULL, 3, GPIO_ACTIVE_LOW),
>         }
>  };
>
> --
> 1.9.1
>


-- 
With Best Regards,
Andy Shevchenko
