From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 21/24] Input: silead - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:17:36 +0300
Message-ID: <CAHp75VcqLNm=_BPfrOE2o46WOQXo9BTYEi4O6eNh+Xu_j7hwDg@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-21-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-21-krzk@kernel.org>
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
>  drivers/input/touchscreen/silead.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 8fa2f3b7cfd8..754debb4b2c4 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -512,11 +512,9 @@ static int silead_ts_probe(struct i2c_client *client,
>
>         /* Power GPIO pin */
>         data->gpio_power = devm_gpiod_get_optional(dev, "power", GPIOD_OUT_LOW);
> -       if (IS_ERR(data->gpio_power)) {
> -               if (PTR_ERR(data->gpio_power) != -EPROBE_DEFER)
> -                       dev_err(dev, "Shutdown GPIO request failed\n");
> -               return PTR_ERR(data->gpio_power);
> -       }
> +       if (IS_ERR(data->gpio_power))
> +               return dev_err_probe(dev, PTR_ERR(data->gpio_power),
> +                                    "Shutdown GPIO request failed\n");
>
>         error = silead_ts_setup(client);
>         if (error)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
