From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 20/24] Input: resistive-adc-touch - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:17:10 +0300
Message-ID: <CAHp75VdMqB2-TrNPvqp+gMbyY39ytJ9O8ZM5cY1r2kVdi4DbzA@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-20-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-20-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
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
>  drivers/input/touchscreen/resistive-adc-touch.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
> index cfc8bb4553f7..46b5a6caef84 100644
> --- a/drivers/input/touchscreen/resistive-adc-touch.c
> +++ b/drivers/input/touchscreen/resistive-adc-touch.c
> @@ -108,12 +108,8 @@ static int grts_probe(struct platform_device *pdev)
>
>         /* get the channels from IIO device */
>         st->iio_chans = devm_iio_channel_get_all(dev);
> -       if (IS_ERR(st->iio_chans)) {
> -               error = PTR_ERR(st->iio_chans);
> -               if (error != -EPROBE_DEFER)
> -                       dev_err(dev, "can't get iio channels.\n");
> -               return error;
> -       }
> +       if (IS_ERR(st->iio_chans))
> +               return dev_err_probe(dev, PTR_ERR(st->iio_chans), "can't get iio channels\n");
>
>         chan = &st->iio_chans[0];
>         st->pressure = false;
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
