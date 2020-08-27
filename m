From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 24/24] Input: sx8643 - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:20:00 +0300
Message-ID: <CAHp75VdygxySau_Ma5YqARgR92BNM+AK3yn2rThYxFEmzdYSLg@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-24-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-24-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input <linux-input@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 9:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Just in case if you want to save more LOCs, you may in some drivers
introduce temporary variable for device pointer, like

struct device *dev = &client->dev;

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/touchscreen/sx8654.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/input/touchscreen/sx8654.c b/drivers/input/touchscreen/sx8654.c
> index de85e57b2486..d2ed9be64c3a 100644
> --- a/drivers/input/touchscreen/sx8654.c
> +++ b/drivers/input/touchscreen/sx8654.c
> @@ -323,13 +323,9 @@ static int sx8654_probe(struct i2c_client *client,
>
>         sx8654->gpio_reset = devm_gpiod_get_optional(&client->dev, "reset",
>                                                      GPIOD_OUT_HIGH);
> -       if (IS_ERR(sx8654->gpio_reset)) {
> -               error = PTR_ERR(sx8654->gpio_reset);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(&client->dev, "unable to get reset-gpio: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(sx8654->gpio_reset))
> +               return dev_err_probe(&client->dev, PTR_ERR(sx8654->gpio_reset),
> +                                    "unable to get reset-gpio\n");
>         dev_dbg(&client->dev, "got GPIO reset pin\n");
>
>         sx8654->data = device_get_match_data(&client->dev);
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
