From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 02/27] Input: gpio-vibra - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 22:36:31 +0300
Message-ID: <CAHp75VfFMv9kMi0skDmNVm2kdqh+PvvXJOeZzePuPfvLpGNiHQ@mail.gmail.com>
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200827185829.30096-3-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-input <linux-input@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 27, 2020 at 9:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> ---
>
> Changes since v1:
> 1. Remove unneeded PTR_ERR_OR_ZERO, as pointed by Andy.
> ---
>  drivers/input/misc/gpio-vibra.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
> index f79f75595dd7..13c69f173620 100644
> --- a/drivers/input/misc/gpio-vibra.c
> +++ b/drivers/input/misc/gpio-vibra.c
> @@ -113,22 +113,14 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
> -       err = PTR_ERR_OR_ZERO(vibrator->vcc);
> -       if (err) {
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Failed to request regulator: %d\n",
> -                               err);
> -               return err;
> -       }
> +       if (IS_ERR(vibrator->vcc))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->vcc),
> +                                    "Failed to request regulator\n");
>
>         vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
> -       err = PTR_ERR_OR_ZERO(vibrator->gpio);
> -       if (err) {
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Failed to request main gpio: %d\n",
> -                               err);
> -               return err;
> -       }
> +       if (IS_ERR(vibrator->gpio))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->gpio),
> +                                    "Failed to request main gpio\n");
>
>         INIT_WORK(&vibrator->play_work, gpio_vibrator_play_work);
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
