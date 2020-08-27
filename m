From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 07/27] Input: bu21013_ts - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 22:39:54 +0300
Message-ID: <CAHp75VcHpPTAJxd9bTbEkEW=4F1FCzTzHS=DCDWnvsjjXvMV=A@mail.gmail.com>
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-8-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200827185829.30096-8-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-input <linux-input@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 27, 2020 at 9:59 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> ---
>
> Changes since v1:
> 1. Remove unneeded PTR_ERR_OR_ZERO, as pointed by Andy.
> ---
>  drivers/input/touchscreen/bu21013_ts.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
> index 2f1f0d7607f8..86bd38243d6c 100644
> --- a/drivers/input/touchscreen/bu21013_ts.c
> +++ b/drivers/input/touchscreen/bu21013_ts.c
> @@ -496,12 +496,10 @@ static int bu21013_probe(struct i2c_client *client,
>
>         /* Named "CS" on the chip, DT binding is "reset" */
>         ts->cs_gpiod = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
> -       error = PTR_ERR_OR_ZERO(ts->cs_gpiod);
> -       if (error) {
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev, "failed to get CS GPIO\n");
> -               return error;
> -       }
> +       if (IS_ERR(ts->cs_gpiod))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->cs_gpiod),
> +                                    "failed to get CS GPIO\n");
> +
>         gpiod_set_consumer_name(ts->cs_gpiod, "BU21013 CS");
>
>         error = devm_add_action_or_reset(&client->dev,
> @@ -516,11 +514,8 @@ static int bu21013_probe(struct i2c_client *client,
>         ts->int_gpiod = devm_gpiod_get_optional(&client->dev,
>                                                 "touch", GPIOD_IN);
>         error = PTR_ERR_OR_ZERO(ts->int_gpiod);
> -       if (error) {
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev, "failed to get INT GPIO\n");
> -               return error;
> -       }
> +       if (error)
> +               return dev_err_probe(&client->dev, error, "failed to get INT GPIO\n");
>
>         if (ts->int_gpiod)
>                 gpiod_set_consumer_name(ts->int_gpiod, "BU21013 INT");
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
