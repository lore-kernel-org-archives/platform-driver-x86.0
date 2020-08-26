From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 01/24] Input: bcm-keypad - Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 21:57:43 +0200
Message-ID: <858aaca7-5648-83a0-6cb4-213c62fee4a6@redhat.com>
References: <20200826181706.11098-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-1-krzk@kernel.org>
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

As someone who has added the if (error != -EPROBE_DEFER) dev_err()
pattern in way too many places myself, I'm quite happy to see this
new (I presume?) helper and this nice cleanup series.

The entire series looks good to me, and you can add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

To the entire series.

Regards,

Hans



On 8/26/20 8:16 PM, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   drivers/input/keyboard/bcm-keypad.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/keyboard/bcm-keypad.c b/drivers/input/keyboard/bcm-keypad.c
> index 2b771c3a5578..1bf71e7c9e0d 100644
> --- a/drivers/input/keyboard/bcm-keypad.c
> +++ b/drivers/input/keyboard/bcm-keypad.c
> @@ -379,11 +379,9 @@ static int bcm_kp_probe(struct platform_device *pdev)
>   	kp->clk = devm_clk_get(&pdev->dev, "peri_clk");
>   	if (IS_ERR(kp->clk)) {
>   		error = PTR_ERR(kp->clk);
> -		if (error != -ENOENT) {
> -			if (error != -EPROBE_DEFER)
> -				dev_err(&pdev->dev, "Failed to get clock\n");
> -			return error;
> -		}
> +		if (error != -ENOENT)
> +			return dev_err_probe(&pdev->dev, error, "Failed to get clock\n");
> +
>   		dev_dbg(&pdev->dev,
>   			"No clock specified. Assuming it's enabled\n");
>   		kp->clk = NULL;
> 
