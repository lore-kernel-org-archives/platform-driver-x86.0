From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 27/27] Input: bu21029_ts - Use local 'client->dev' variable in probe()
Date: Thu, 27 Aug 2020 20:58:29 +0200
Message-ID: <20200827185829.30096-28-krzk@kernel.org>
References: <20200827185829.30096-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200827185829.30096-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, clang-built-linux@googlegroups.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

'dev' is shorter and simpler than '&client->dev' and in few cases it
allows to skip line wrapping. Probe function uses '&client->dev' a lot,
so this improves readability slightly.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. New patch
---
 drivers/input/touchscreen/bu21029_ts.c | 37 +++++++++++---------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
index 96c178b606dc..78e256254764 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -334,6 +334,7 @@ static void bu21029_stop_chip(struct input_dev *dev)
 static int bu21029_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
+	struct device *dev = &client->dev;
 	struct bu21029_ts_data *bu21029;
 	struct input_dev *in_dev;
 	int error;
@@ -342,37 +343,33 @@ static int bu21029_probe(struct i2c_client *client,
 				     I2C_FUNC_SMBUS_WRITE_BYTE |
 				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA |
 				     I2C_FUNC_SMBUS_READ_I2C_BLOCK)) {
-		dev_err(&client->dev,
-			"i2c functionality support is not sufficient\n");
+		dev_err(dev, "i2c functionality support is not sufficient\n");
 		return -EIO;
 	}
 
-	bu21029 = devm_kzalloc(&client->dev, sizeof(*bu21029), GFP_KERNEL);
+	bu21029 = devm_kzalloc(dev, sizeof(*bu21029), GFP_KERNEL);
 	if (!bu21029)
 		return -ENOMEM;
 
-	error = device_property_read_u32(&client->dev, "rohm,x-plate-ohms",
-					 &bu21029->x_plate_ohms);
+	error = device_property_read_u32(dev, "rohm,x-plate-ohms", &bu21029->x_plate_ohms);
 	if (error) {
-		dev_err(&client->dev,
-			"invalid 'x-plate-ohms' supplied: %d\n", error);
+		dev_err(dev, "invalid 'x-plate-ohms' supplied: %d\n", error);
 		return error;
 	}
 
-	bu21029->vdd = devm_regulator_get(&client->dev, "vdd");
+	bu21029->vdd = devm_regulator_get(dev, "vdd");
 	if (IS_ERR(bu21029->vdd))
-		return dev_err_probe(&client->dev, PTR_ERR(bu21029->vdd),
+		return dev_err_probe(dev, PTR_ERR(bu21029->vdd),
 				     "failed to acquire 'vdd' supply\n");
 
-	bu21029->reset_gpios = devm_gpiod_get_optional(&client->dev,
-						       "reset", GPIOD_OUT_HIGH);
+	bu21029->reset_gpios = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(bu21029->reset_gpios))
-		return dev_err_probe(&client->dev, PTR_ERR(bu21029->reset_gpios),
+		return dev_err_probe(dev, PTR_ERR(bu21029->reset_gpios),
 				     "failed to acquire 'reset' gpio\n");
 
-	in_dev = devm_input_allocate_device(&client->dev);
+	in_dev = devm_input_allocate_device(dev);
 	if (!in_dev) {
-		dev_err(&client->dev, "unable to allocate input device\n");
+		dev_err(dev, "unable to allocate input device\n");
 		return -ENOMEM;
 	}
 
@@ -394,19 +391,17 @@ static int bu21029_probe(struct i2c_client *client,
 	input_set_drvdata(in_dev, bu21029);
 
 	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
-	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  NULL, bu21029_touch_soft_irq,
-					  IRQF_ONESHOT, DRIVER_NAME, bu21029);
+	error = devm_request_threaded_irq(dev, client->irq, NULL,
+					  bu21029_touch_soft_irq, IRQF_ONESHOT,
+					  DRIVER_NAME, bu21029);
 	if (error) {
-		dev_err(&client->dev,
-			"unable to request touch irq: %d\n", error);
+		dev_err(dev, "unable to request touch irq: %d\n", error);
 		return error;
 	}
 
 	error = input_register_device(in_dev);
 	if (error) {
-		dev_err(&client->dev,
-			"unable to register input device: %d\n", error);
+		dev_err(dev, "unable to register input device: %d\n", error);
 		return error;
 	}
 
-- 
2.17.1
