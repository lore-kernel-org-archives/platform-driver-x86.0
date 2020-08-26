From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 02/24] Input: gpio_keys - Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 22:13:34 +0300
Message-ID: <20200826191334.GX1891694@smile.fi.intel.com>
References: <20200826181706.11098-1-krzk@kernel.org>
 <20200826181706.11098-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200826181706.11098-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 08:16:44PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -505,10 +505,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
>  				 */
>  				bdata->gpiod = NULL;

gpiod_get_optional()?
Do not see much context though (but please double check your series for these
kind of things).

>  			} else {
> -				if (error != -EPROBE_DEFER)
> -					dev_err(dev, "failed to get gpio: %d\n",
> -						error);
> -				return error;
> +				return dev_err_probe(dev, error, "failed to get gpio\n");
>  			}
>  		}
>  	} else if (gpio_is_valid(button->gpio)) {

-- 
With Best Regards,
Andy Shevchenko
