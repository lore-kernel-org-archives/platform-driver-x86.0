From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 11/24] Input: chipone_icn8318 - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:11:24 +0300
Message-ID: <CAHp75VdUf84UwreCeZzUwgv88-rtNH88WTGTsK3ixV-1Fnckvg@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-11-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-11-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
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
>  drivers/input/touchscreen/chipone_icn8318.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/touchscreen/chipone_icn8318.c b/drivers/input/touchscreen/chipone_icn8318.c
> index d91d2fd78649..5bee007184c4 100644
> --- a/drivers/input/touchscreen/chipone_icn8318.c
> +++ b/drivers/input/touchscreen/chipone_icn8318.c
> @@ -194,12 +194,8 @@ static int icn8318_probe(struct i2c_client *client,
>                 return -ENOMEM;
>
>         data->wake_gpio = devm_gpiod_get(dev, "wake", GPIOD_OUT_LOW);
> -       if (IS_ERR(data->wake_gpio)) {
> -               error = PTR_ERR(data->wake_gpio);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Error getting wake gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(data->wake_gpio))
> +               return dev_err_probe(dev, PTR_ERR(data->wake_gpio), "Error getting wake gpio\n");
>
>         input = devm_input_allocate_device(dev);
>         if (!input)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
