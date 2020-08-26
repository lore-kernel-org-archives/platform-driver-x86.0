From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 02/24] Input: gpio_keys - Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 20:16:44 +0200
Message-ID: <20200826181706.11098-2-krzk@kernel.org>
References: <20200826181706.11098-1-krzk@kernel.org>
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-1-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/input/keyboard/gpio_keys.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index f2d4e4daa818..6f670cbe8a8b 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -505,10 +505,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 				 */
 				bdata->gpiod = NULL;
 			} else {
-				if (error != -EPROBE_DEFER)
-					dev_err(dev, "failed to get gpio: %d\n",
-						error);
-				return error;
+				return dev_err_probe(dev, error, "failed to get gpio\n");
 			}
 		}
 	} else if (gpio_is_valid(button->gpio)) {
-- 
2.17.1
