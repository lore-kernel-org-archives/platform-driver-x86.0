From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86/pcengines-apuv2: use KEY_RESTART for front button
Date: Thu, 25 Jul 2019 20:17:57 +0300
Message-ID: <CAHp75Vch3KNCkwp69a_fBtMy3B3k=NEbAmPZE2cn5HSn577HOw@mail.gmail.com>
References: <1563795379-7521-1-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563795379-7521-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 22, 2019 at 2:36 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> From: Enrico Weigelt <info@metux.net>
>
> The keycode KEY_RESTART is more appropriate for the front button,
> as most people use it for things like restart or factory reset.
>

Should it go as Fixes?

> Signed-off-by: Enrico Weigelt <info@metux.net>
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
