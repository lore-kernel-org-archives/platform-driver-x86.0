From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 04/24] Input: gpio-vibra - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:03:52 +0300
Message-ID: <CAHp75Vey_w7m4TZM9+=df-FMO6YW5DiSMQsupZsMb92Awg_x1Q@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-4-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input <linux-input@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 9:20 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

>         vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
>         err = PTR_ERR_OR_ZERO(vibrator->vcc);
> -       if (err) {
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Failed to request regulator: %d\n",
> -                               err);
> -               return err;
> -       }
> +       if (err)
> +               return dev_err_probe(&pdev->dev, err, "Failed to request regulator\n");

Can it be rather
  if (IS_ERR())
    return dev_err_probe(dev, PTR_ERR());
w/o err be involved?

>         vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
>         err = PTR_ERR_OR_ZERO(vibrator->gpio);
> -       if (err) {
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Failed to request main gpio: %d\n",
> -                               err);
> -               return err;
> -       }
> +       if (err)
> +               return dev_err_probe(&pdev->dev, err, "Failed to request main gpio\n");

Ditto.


-- 
With Best Regards,
Andy Shevchenko
