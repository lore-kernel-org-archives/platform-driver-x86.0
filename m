From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 04/27] Input: pwm-vibra - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 22:39:17 +0300
Message-ID: <CAHp75VfAn8oCqgXOWhsixZSs4FTkDACP3+3CgDdmQkPKQJg1aw@mail.gmail.com>
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-5-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200827185829.30096-5-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-input <linux-input@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 27, 2020 at 9:58 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> ---
>
> Changes since v1:
> 1. Remove unneeded PTR_ERR_OR_ZERO, as pointed by Andy.
> ---
>  drivers/input/misc/pwm-vibra.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/misc/pwm-vibra.c b/drivers/input/misc/pwm-vibra.c
> index 81e777a04b88..45c4f6a02177 100644
> --- a/drivers/input/misc/pwm-vibra.c
> +++ b/drivers/input/misc/pwm-vibra.c
> @@ -134,22 +134,14 @@ static int pwm_vibrator_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
> -       err = PTR_ERR_OR_ZERO(vibrator->vcc);
> -       if (err) {
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Failed to request regulator: %d",
> -                               err);
> -               return err;
> -       }
> +       if (IS_ERR(vibrator->vcc))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->vcc),
> +                                    "Failed to request regulator\n");
>
>         vibrator->pwm = devm_pwm_get(&pdev->dev, "enable");
> -       err = PTR_ERR_OR_ZERO(vibrator->pwm);
> -       if (err) {
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Failed to request main pwm: %d",
> -                               err);
> -               return err;
> -       }
> +       if (IS_ERR(vibrator->pwm))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(vibrator->pwm),
> +                                    "Failed to request main pwm\n");
>
>         INIT_WORK(&vibrator->play_work, pwm_vibrator_play_work);
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
