From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 19/24] Input: raydium_i2c_ts - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:16:22 +0300
Message-ID: <CAHp75VezmFsK0eiEk-4ZzcSfnHP4y6N4Qfds4paBJhkHYL85Bw@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-19-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-19-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
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
>  drivers/input/touchscreen/raydium_i2c_ts.c | 30 +++++++---------------
>  1 file changed, 9 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
> index fe245439adee..4017775f6466 100644
> --- a/drivers/input/touchscreen/raydium_i2c_ts.c
> +++ b/drivers/input/touchscreen/raydium_i2c_ts.c
> @@ -1015,32 +1015,20 @@ static int raydium_i2c_probe(struct i2c_client *client,
>         i2c_set_clientdata(client, ts);
>
>         ts->avdd = devm_regulator_get(&client->dev, "avdd");
> -       if (IS_ERR(ts->avdd)) {
> -               error = PTR_ERR(ts->avdd);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get 'avdd' regulator: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->avdd))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->avdd),
> +                                    "Failed to get 'avdd' regulator\n");
>
>         ts->vccio = devm_regulator_get(&client->dev, "vccio");
> -       if (IS_ERR(ts->vccio)) {
> -               error = PTR_ERR(ts->vccio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get 'vccio' regulator: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->vccio))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->vccio),
> +                                    "Failed to get 'vccio' regulator\n");
>
>         ts->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
>                                                  GPIOD_OUT_LOW);
> -       if (IS_ERR(ts->reset_gpio)) {
> -               error = PTR_ERR(ts->reset_gpio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "failed to get reset gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->reset_gpio))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->reset_gpio),
> +                                    "Failed to get reset gpio\n");
>
>         error = raydium_i2c_power_on(ts);
>         if (error)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
