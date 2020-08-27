From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 17/24] Input: melfas_mip4 - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:14:52 +0300
Message-ID: <CAHp75VfHtwytOQNiCFdrS-BCw-Gjmpj3NVn_-YGT_QD958h3Fw@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-17-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-17-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
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
>  drivers/input/touchscreen/melfas_mip4.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
> index f67efdd040b2..d43a8643adcd 100644
> --- a/drivers/input/touchscreen/melfas_mip4.c
> +++ b/drivers/input/touchscreen/melfas_mip4.c
> @@ -1451,13 +1451,8 @@ static int mip4_probe(struct i2c_client *client, const struct i2c_device_id *id)
>
>         ts->gpio_ce = devm_gpiod_get_optional(&client->dev,
>                                               "ce", GPIOD_OUT_LOW);
> -       if (IS_ERR(ts->gpio_ce)) {
> -               error = PTR_ERR(ts->gpio_ce);
> -               if (error != EPROBE_DEFER)
> -                       dev_err(&client->dev,
> -                               "Failed to get gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->gpio_ce))
> +               return dev_err_probe(&client->dev, PTR_ERR(ts->gpio_ce), "Failed to get gpio\n");
>
>         error = mip4_power_on(ts);
>         if (error)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
