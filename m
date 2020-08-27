From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 07/24] Input: rotary_encoder - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 12:08:15 +0300
Message-ID: <CAHp75VdqgEvcs_LAHBV=O57vVMVrjUnfVr3anzJmtFMKYyeMkw@mail.gmail.com>
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-7-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-7-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input <linux-input@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 9:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/input/misc/rotary_encoder.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/misc/rotary_encoder.c b/drivers/input/misc/rotary_encoder.c
> index 6d613f2a017c..ea56c9f4975a 100644
> --- a/drivers/input/misc/rotary_encoder.c
> +++ b/drivers/input/misc/rotary_encoder.c
> @@ -236,12 +236,8 @@ static int rotary_encoder_probe(struct platform_device *pdev)
>                 device_property_read_bool(dev, "rotary-encoder,relative-axis");
>
>         encoder->gpios = devm_gpiod_get_array(dev, NULL, GPIOD_IN);
> -       if (IS_ERR(encoder->gpios)) {
> -               err = PTR_ERR(encoder->gpios);
> -               if (err != -EPROBE_DEFER)
> -                       dev_err(dev, "unable to get gpios: %d\n", err);
> -               return err;
> -       }
> +       if (IS_ERR(encoder->gpios))
> +               return dev_err_probe(dev, PTR_ERR(encoder->gpios), "unable to get gpios\n");
>         if (encoder->gpios->ndescs < 2) {
>                 dev_err(dev, "not enough gpios found\n");
>                 return -EINVAL;
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
