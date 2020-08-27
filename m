From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 15/24] Input: elants_i2c - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:13:09 +0300
Message-ID: <CAHp75Vef81HYbXdi=KYUM+9c-g9XoQ4tXjQ_VLr_1t9QWL2Vtw@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-15-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-15-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
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
>  drivers/input/touchscreen/elants_i2c.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index b0bd5bb079be..ad299eb333f1 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1245,24 +1245,14 @@ static int elants_i2c_probe(struct i2c_client *client,
>         i2c_set_clientdata(client, ts);
>
>         ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
> -       if (IS_ERR(ts->vcc33)) {
> -               error = PTR_ERR(ts->vcc33);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get 'vcc33' regulator: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->vcc33))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->vcc33),
> +                                    "Failed to get 'vcc33' regulator\n");
>
>         ts->vccio = devm_regulator_get(&client->dev, "vccio");
> -       if (IS_ERR(ts->vccio)) {
> -               error = PTR_ERR(ts->vccio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get 'vccio' regulator: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->vccio))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->vccio),
> +                                    "Failed to get 'vccio' regulator\n");
>
>         ts->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
>         if (IS_ERR(ts->reset_gpio)) {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
