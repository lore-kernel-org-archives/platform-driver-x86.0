From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 23/24] Input: surface3_spi - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:18:46 +0300
Message-ID: <CAHp75VdKxibhohQEEbtF4Er=OYLVqFc-7-GoAZ+O2mL3Vi4s3w@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-23-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-23-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input <linux-input@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 9:22 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/touchscreen/surface3_spi.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
> index ce4828b1415a..25bb77ddf2ef 100644
> --- a/drivers/input/touchscreen/surface3_spi.c
> +++ b/drivers/input/touchscreen/surface3_spi.c
> @@ -223,7 +223,6 @@ static void surface3_spi_power(struct surface3_ts_data *data, bool on)
>   */
>  static int surface3_spi_get_gpio_config(struct surface3_ts_data *data)
>  {
> -       int error;
>         struct device *dev;
>         struct gpio_desc *gpiod;
>         int i;
> @@ -233,15 +232,9 @@ static int surface3_spi_get_gpio_config(struct surface3_ts_data *data)
>         /* Get the reset lines GPIO pin number */
>         for (i = 0; i < 2; i++) {
>                 gpiod = devm_gpiod_get_index(dev, NULL, i, GPIOD_OUT_LOW);
> -               if (IS_ERR(gpiod)) {
> -                       error = PTR_ERR(gpiod);
> -                       if (error != -EPROBE_DEFER)
> -                               dev_err(dev,
> -                                       "Failed to get power GPIO %d: %d\n",
> -                                       i,
> -                                       error);
> -                       return error;
> -               }
> +               if (IS_ERR(gpiod))
> +                       return dev_err_probe(dev, PTR_ERR(gpiod),
> +                                            "Failed to get power GPIO %d\n", i);
>
>                 data->gpiod_rst[i] = gpiod;
>         }
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
