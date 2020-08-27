From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 13/27] Input: elants_i2c - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 20:58:15 +0200
Message-ID: <20200827185829.30096-14-krzk@kernel.org>
References: <20200827185829.30096-1-krzk@kernel.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200827185829.30096-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, clang-built-linux@googlegroups.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/touchscreen/elants_i2c.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index b0bd5bb079be..ad299eb333f1 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1245,24 +1245,14 @@ static int elants_i2c_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, ts);
 
 	ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
-	if (IS_ERR(ts->vcc33)) {
-		error = PTR_ERR(ts->vcc33);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to get 'vcc33' regulator: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(ts->vcc33))
+		return dev_err_probe(&client->dev, PTR_ERR(ts->vcc33),
+				     "Failed to get 'vcc33' regulator\n");
 
 	ts->vccio = devm_regulator_get(&client->dev, "vccio");
-	if (IS_ERR(ts->vccio)) {
-		error = PTR_ERR(ts->vccio);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to get 'vccio' regulator: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(ts->vccio))
+		return dev_err_probe(&client->dev, PTR_ERR(ts->vccio),
+				     "Failed to get 'vccio' regulator\n");
 
 	ts->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ts->reset_gpio)) {
-- 
2.17.1
