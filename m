From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 18/24] Input: pixcir_i2c_ts - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:15:20 +0300
Message-ID: <CAHp75Ve84KQ3Rysq9oHzuCKSaX-Xu4LbAvwih=10qEBXBk7bbw@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-18-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-18-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input <linux-input@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 9:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/touchscreen/pixcir_i2c_ts.c | 38 +++++++----------------
>  1 file changed, 12 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
> index 9aa098577350..fb37567e2d7e 100644
> --- a/drivers/input/touchscreen/pixcir_i2c_ts.c
> +++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
> @@ -515,41 +515,27 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client,
>         input_set_drvdata(input, tsdata);
>
>         tsdata->gpio_attb = devm_gpiod_get(dev, "attb", GPIOD_IN);
> -       if (IS_ERR(tsdata->gpio_attb)) {
> -               error = PTR_ERR(tsdata->gpio_attb);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to request ATTB gpio: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(tsdata->gpio_attb))
> +               return dev_err_probe(dev, PTR_ERR(tsdata->gpio_attb),
> +                                    "Failed to request ATTB gpio\n");
>
>         tsdata->gpio_reset = devm_gpiod_get_optional(dev, "reset",
>                                                      GPIOD_OUT_LOW);
> -       if (IS_ERR(tsdata->gpio_reset)) {
> -               error = PTR_ERR(tsdata->gpio_reset);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to request RESET gpio: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(tsdata->gpio_reset))
> +               return dev_err_probe(dev, PTR_ERR(tsdata->gpio_reset),
> +                                    "Failed to request RESET gpio\n");
>
>         tsdata->gpio_wake = devm_gpiod_get_optional(dev, "wake",
>                                                     GPIOD_OUT_HIGH);
> -       if (IS_ERR(tsdata->gpio_wake)) {
> -               error = PTR_ERR(tsdata->gpio_wake);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get wake gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(tsdata->gpio_wake))
> +               return dev_err_probe(dev, PTR_ERR(tsdata->gpio_wake),
> +                                    "Failed to get wake gpio\n");
>
>         tsdata->gpio_enable = devm_gpiod_get_optional(dev, "enable",
>                                                       GPIOD_OUT_HIGH);
> -       if (IS_ERR(tsdata->gpio_enable)) {
> -               error = PTR_ERR(tsdata->gpio_enable);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get enable gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(tsdata->gpio_enable))
> +               return dev_err_probe(dev, PTR_ERR(tsdata->gpio_enable),
> +                                    "Failed to get enable gpio\n");
>
>         if (tsdata->gpio_enable)
>                 msleep(100);
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
