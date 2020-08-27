From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 22/24] Input: sis_i2c - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:18:06 +0300
Message-ID: <CAHp75Vex+1nx5ue+mYSwRTzjMOJPeghqLfg2csk3XfvhUr4avA@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-22-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-22-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input <linux-input@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 9:20 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/touchscreen/sis_i2c.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/touchscreen/sis_i2c.c b/drivers/input/touchscreen/sis_i2c.c
> index 6274555f1673..348a2ba9b7c9 100644
> --- a/drivers/input/touchscreen/sis_i2c.c
> +++ b/drivers/input/touchscreen/sis_i2c.c
> @@ -311,23 +311,15 @@ static int sis_ts_probe(struct i2c_client *client,
>
>         ts->attn_gpio = devm_gpiod_get_optional(&client->dev,
>                                                 "attn", GPIOD_IN);
> -       if (IS_ERR(ts->attn_gpio)) {
> -               error = PTR_ERR(ts->attn_gpio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get attention GPIO: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->attn_gpio))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->attn_gpio),
> +                                    "Failed to get attention GPIO\n");
>
>         ts->reset_gpio = devm_gpiod_get_optional(&client->dev,
>                                                  "reset", GPIOD_OUT_LOW);
> -       if (IS_ERR(ts->reset_gpio)) {
> -               error = PTR_ERR(ts->reset_gpio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get reset GPIO: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->reset_gpio))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->reset_gpio),
> +                                    "Failed to get reset GPIO\n");
>
>         sis_ts_reset(ts);
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
