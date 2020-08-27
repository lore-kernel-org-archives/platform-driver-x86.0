From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 16/24] Input: goodix - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:13:43 +0300
Message-ID: <CAHp75VcijLOjjjhX+um8dnLoq3=g0BwHK7zMoKuV6DO26qVDXg@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-16-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-16-krzk@kernel.org>
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
>  drivers/input/touchscreen/goodix.c | 40 ++++++++----------------------
>  1 file changed, 11 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 02c75ea385e0..48c4c3d297fe 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -864,7 +864,6 @@ static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
>   */
>  static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>  {
> -       int error;
>         struct device *dev;
>         struct gpio_desc *gpiod;
>         bool added_acpi_mappings = false;
> @@ -874,33 +873,20 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>         dev = &ts->client->dev;
>
>         ts->avdd28 = devm_regulator_get(dev, "AVDD28");
> -       if (IS_ERR(ts->avdd28)) {
> -               error = PTR_ERR(ts->avdd28);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev,
> -                               "Failed to get AVDD28 regulator: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->avdd28))
> +               return dev_err_probe(dev, PTR_ERR(ts->avdd28), "Failed to get AVDD28 regulator\n");
>
>         ts->vddio = devm_regulator_get(dev, "VDDIO");
> -       if (IS_ERR(ts->vddio)) {
> -               error = PTR_ERR(ts->vddio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev,
> -                               "Failed to get VDDIO regulator: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->vddio))
> +               return dev_err_probe(dev, PTR_ERR(ts->vddio), "Failed to get VDDIO regulator\n");
>
>  retry_get_irq_gpio:
>         /* Get the interrupt GPIO pin number */
>         gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_INT_NAME, GPIOD_IN);
> -       if (IS_ERR(gpiod)) {
> -               error = PTR_ERR(gpiod);
> -               if (error != -EPROBE_DEFER)
> -                       dev_dbg(dev, "Failed to get %s GPIO: %d\n",
> -                               GOODIX_GPIO_INT_NAME, error);
> -               return error;
> -       }
> +       if (IS_ERR(gpiod))
> +               return dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get %s GPIO\n",
> +                                    GOODIX_GPIO_INT_NAME);
> +
>         if (!gpiod && has_acpi_companion(dev) && !added_acpi_mappings) {
>                 added_acpi_mappings = true;
>                 if (goodix_add_acpi_gpio_mappings(ts) == 0)
> @@ -911,13 +897,9 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>
>         /* Get the reset line GPIO pin number */
>         gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_RST_NAME, GPIOD_IN);
> -       if (IS_ERR(gpiod)) {
> -               error = PTR_ERR(gpiod);
> -               if (error != -EPROBE_DEFER)
> -                       dev_dbg(dev, "Failed to get %s GPIO: %d\n",
> -                               GOODIX_GPIO_RST_NAME, error);
> -               return error;
> -       }
> +       if (IS_ERR(gpiod))
> +               return dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get %s GPIO\n",
> +                                    GOODIX_GPIO_RST_NAME);
>
>         ts->gpiod_rst = gpiod;
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
