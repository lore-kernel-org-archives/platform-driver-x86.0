From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 09/24] Input: bu21013_ts - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:10:38 +0300
Message-ID: <CAHp75VevroOYYYBnCAHUqhkkeYcAHLrSwnT3wnxj1Mc4k8sfng@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-9-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-9-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input <linux-input@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 9:19 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

>         ts->cs_gpiod = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
>         error = PTR_ERR_OR_ZERO(ts->cs_gpiod);

> +       if (error)
> +               return dev_err_probe(&client->dev, error, "failed to get CS GPIO\n");
> +

if (IS_ERR())
 return ... PTR_ERR()...


-- 
With Best Regards,
Andy Shevchenko
