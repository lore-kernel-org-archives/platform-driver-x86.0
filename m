From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86/pcengines-apuv2: use KEY_RESTART for
 front button
Date: Thu, 1 Aug 2019 18:00:46 +0300
Message-ID: <CAHp75Vem8QZVGx6x0p3JgxA6kH3pG+1_zU=cgiDUDSC5p2ODDQ@mail.gmail.com>
References: <1564081563-28322-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564081563-28322-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 25, 2019 at 10:06 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> From: Enrico Weigelt <info@metux.net>
>
> The keycode KEY_RESTART is more appropriate for the front button,
> as most people use it for things like restart or factory reset.
>

Applied, thanks!

> Signed-off-by: Enrico Weigelt <info@metux.net>
> Fixes: f8eb0235f65989fc5521c40c78d1261e7f25cdbe ("x86: pcengines apuv2 gpio/leds/keys platform driver")

Please, use allowed minimum (12 nowadays) characters of hash.

> ---
>  drivers/platform/x86/pcengines-apuv2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index b0d3110..4138007c 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -93,7 +93,7 @@
>
>  static struct gpio_keys_button apu2_keys_buttons[] = {
>         {
> -               .code                   = KEY_SETUP,
> +               .code                   = KEY_RESTART,
>                 .active_low             = 1,
>                 .desc                   = "front button",
>                 .type                   = EV_KEY,
> --
> 1.9.1
>


-- 
With Best Regards,
Andy Shevchenko
