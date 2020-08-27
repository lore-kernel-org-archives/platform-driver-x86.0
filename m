From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 12/24] Input: cy8ctma140 - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:11:52 +0300
Message-ID: <CAHp75VeRGTp+SW9jYM5_gVdc5EXzb8Y1Ba1czhMiS3WZ78idCg@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-12-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-12-krzk@kernel.org>
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
>  drivers/input/touchscreen/cy8ctma140.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/touchscreen/cy8ctma140.c b/drivers/input/touchscreen/cy8ctma140.c
> index a9be29139cbf..23da5bb00ead 100644
> --- a/drivers/input/touchscreen/cy8ctma140.c
> +++ b/drivers/input/touchscreen/cy8ctma140.c
> @@ -259,12 +259,8 @@ static int cy8ctma140_probe(struct i2c_client *client,
>         ts->regulators[1].supply = "vdd";
>         error = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->regulators),
>                                       ts->regulators);
> -       if (error) {
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get regulators %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (error)
> +               return dev_err_probe(dev, error, "Failed to get regulators\n");
>
>         error = cy8ctma140_power_up(ts);
>         if (error)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
