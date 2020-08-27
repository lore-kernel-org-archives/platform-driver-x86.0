From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 03/24] Input: gpio_keys_polled - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:05:24 +0300
Message-ID: <CAHp75Vc5XqsByQ35gx83NiuHor-doa5MZ_P+6may0q5MnAFgDg@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-3-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input <linux-input@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 9:18 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/keyboard/gpio_keys_polled.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
> index c3937d2fc744..ba00ecfbd343 100644
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@ -299,13 +299,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>                                                              NULL, GPIOD_IN,
>                                                              button->desc);
>                         if (IS_ERR(bdata->gpiod)) {
> -                               error = PTR_ERR(bdata->gpiod);
> -                               if (error != -EPROBE_DEFER)
> -                                       dev_err(dev,
> -                                               "failed to get gpio: %d\n",
> -                                               error);
>                                 fwnode_handle_put(child);
> -                               return error;
> +                               return dev_err_probe(dev, PTR_ERR(bdata->gpiod),
> +                                                    "failed to get gpio\n");
>                         }
>                 } else if (gpio_is_valid(button->gpio)) {
>                         /*
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
