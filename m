From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 05/24] Input: pwm-beeper - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:07:32 +0300
Message-ID: <CAHp75VdPm2C_PzN7jXrNsCMf55R8ZkSwyxM3-GPTdJyL8+5EFA@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-5-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-5-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input <linux-input@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 9:18 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/misc/pwm-beeper.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/misc/pwm-beeper.c b/drivers/input/misc/pwm-beeper.c
> index d6b12477748a..8c0085e8c552 100644
> --- a/drivers/input/misc/pwm-beeper.c
> +++ b/drivers/input/misc/pwm-beeper.c
> @@ -132,13 +132,8 @@ static int pwm_beeper_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         beeper->pwm = devm_pwm_get(dev, NULL);
> -       if (IS_ERR(beeper->pwm)) {
> -               error = PTR_ERR(beeper->pwm);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to request PWM device: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(beeper->pwm))
> +               return dev_err_probe(dev, PTR_ERR(beeper->pwm), "Failed to request PWM device\n");
>
>         /* Sync up PWM state and ensure it is off. */
>         pwm_init_state(beeper->pwm, &state);
> @@ -151,13 +146,9 @@ static int pwm_beeper_probe(struct platform_device *pdev)
>         }
>
>         beeper->amplifier = devm_regulator_get(dev, "amp");
> -       if (IS_ERR(beeper->amplifier)) {
> -               error = PTR_ERR(beeper->amplifier);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get 'amp' regulator: %d\n",
> -                               error);
> -               return error;
> -       }
> +       if (IS_ERR(beeper->amplifier))
> +               return dev_err_probe(dev, PTR_ERR(beeper->amplifier),
> +                                    "Failed to get 'amp' regulator\n");
>
>         INIT_WORK(&beeper->work, pwm_beeper_work);
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
