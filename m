From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 09/27] Input: chipone_icn8318 - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 20:58:11 +0200
Message-ID: <20200827185829.30096-10-krzk@kernel.org>
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
 drivers/input/touchscreen/chipone_icn8318.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/chipone_icn8318.c b/drivers/input/touchscreen/chipone_icn8318.c
index d91d2fd78649..5bee007184c4 100644
--- a/drivers/input/touchscreen/chipone_icn8318.c
+++ b/drivers/input/touchscreen/chipone_icn8318.c
@@ -194,12 +194,8 @@ static int icn8318_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	data->wake_gpio = devm_gpiod_get(dev, "wake", GPIOD_OUT_LOW);
-	if (IS_ERR(data->wake_gpio)) {
-		error = PTR_ERR(data->wake_gpio);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Error getting wake gpio: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(data->wake_gpio))
+		return dev_err_probe(dev, PTR_ERR(data->wake_gpio), "Error getting wake gpio\n");
 
 	input = devm_input_allocate_device(dev);
 	if (!input)
-- 
2.17.1
