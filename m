From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 01/27] Input: gpio_keys_polled - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 20:58:03 +0200
Message-ID: <20200827185829.30096-2-krzk@kernel.org>
References: <20200827185829.30096-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200827185829.30096-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, clang-built-linux@googlegroups.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/keyboard/gpio_keys_polled.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index c3937d2fc744..ba00ecfbd343 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -299,13 +299,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 							     NULL, GPIOD_IN,
 							     button->desc);
 			if (IS_ERR(bdata->gpiod)) {
-				error = PTR_ERR(bdata->gpiod);
-				if (error != -EPROBE_DEFER)
-					dev_err(dev,
-						"failed to get gpio: %d\n",
-						error);
 				fwnode_handle_put(child);
-				return error;
+				return dev_err_probe(dev, PTR_ERR(bdata->gpiod),
+						     "failed to get gpio\n");
 			}
 		} else if (gpio_is_valid(button->gpio)) {
 			/*
-- 
2.17.1
