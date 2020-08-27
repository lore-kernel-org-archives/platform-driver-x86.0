From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 10/24] Input: bu21029_ts - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:11:01 +0300
Message-ID: <CAHp75Vfmec6oaAWCkO7M_8uJk7Y1-x3Pz5AJVx_D3XGkRmQVvg@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-10-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-10-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input <linux-input@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 9:19 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/touchscreen/bu21029_ts.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
> index 49a8d4bbca3a..96c178b606dc 100644
> --- a/drivers/input/touchscreen/bu21029_ts.c
> +++ b/drivers/input/touchscreen/bu21029_ts.c
> @@ -360,23 +360,15 @@ static int bu21029_probe(struct i2c_client *client,
>         }
>
>         bu21029->vdd = devm_regulator_get(&client->dev, "vdd");
> -       if (IS_ERR(bu21029->vdd)) {
> -               error = PTR_ERR(bu21029->vdd);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "failed to acquire 'vdd' supply: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(bu21029->vdd))
> +               return dev_err_probe(&client->dev, PTR_ERR(bu21029->vdd),
> +                                    "failed to acquire 'vdd' supply\n");
>
>         bu21029->reset_gpios = devm_gpiod_get_optional(&client->dev,
>                                                        "reset", GPIOD_OUT_HIGH);
> -       if (IS_ERR(bu21029->reset_gpios)) {
> -               error = PTR_ERR(bu21029->reset_gpios);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "failed to acquire 'reset' gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(bu21029->reset_gpios))
> +               return dev_err_probe(&client->dev, PTR_ERR(bu21029->reset_gpios),
> +                                    "failed to acquire 'reset' gpio\n");
>
>         in_dev = devm_input_allocate_device(&client->dev);
>         if (!in_dev) {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
