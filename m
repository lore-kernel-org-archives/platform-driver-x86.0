From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 14/24] Input: ektf2127 - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:12:49 +0300
Message-ID: <CAHp75Vf2=qM4nvYMRQccJgHhZytXt9GU4KCBv8HwHnW+EcPvnw@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-14-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-14-krzk@kernel.org>
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
>  drivers/input/touchscreen/ektf2127.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/touchscreen/ektf2127.c b/drivers/input/touchscreen/ektf2127.c
> index eadd389cf81f..cd41483cfae5 100644
> --- a/drivers/input/touchscreen/ektf2127.c
> +++ b/drivers/input/touchscreen/ektf2127.c
> @@ -237,12 +237,8 @@ static int ektf2127_probe(struct i2c_client *client,
>
>         /* This requests the gpio *and* turns on the touchscreen controller */
>         ts->power_gpios = devm_gpiod_get(dev, "power", GPIOD_OUT_HIGH);
> -       if (IS_ERR(ts->power_gpios)) {
> -               error = PTR_ERR(ts->power_gpios);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Error getting power gpio: %d\n", error);
> -               return error;
> -       }
> +       if (IS_ERR(ts->power_gpios))
> +               return dev_err_probe(dev, PTR_ERR(ts->power_gpios), "Error getting power gpio\n");
>
>         input = devm_input_allocate_device(dev);
>         if (!input)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
