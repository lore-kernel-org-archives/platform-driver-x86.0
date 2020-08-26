From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 22/24] Input: sis_i2c - Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 20:17:04 +0200
Message-ID: <20200826181706.11098-22-krzk@kernel.org>
References: <20200826181706.11098-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200826181706.11098-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/input/touchscreen/sis_i2c.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/sis_i2c.c b/drivers/input/touchscreen/sis_i2c.c
index 6274555f1673..348a2ba9b7c9 100644
--- a/drivers/input/touchscreen/sis_i2c.c
+++ b/drivers/input/touchscreen/sis_i2c.c
@@ -311,23 +311,15 @@ static int sis_ts_probe(struct i2c_client *client,
 
 	ts->attn_gpio = devm_gpiod_get_optional(&client->dev,
 						"attn", GPIOD_IN);
-	if (IS_ERR(ts->attn_gpio)) {
-		error = PTR_ERR(ts->attn_gpio);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to get attention GPIO: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(ts->attn_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(ts->attn_gpio),
+				     "Failed to get attention GPIO\n");
 
 	ts->reset_gpio = devm_gpiod_get_optional(&client->dev,
 						 "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ts->reset_gpio)) {
-		error = PTR_ERR(ts->reset_gpio);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to get reset GPIO: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(ts->reset_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(ts->reset_gpio),
+				     "Failed to get reset GPIO\n");
 
 	sis_ts_reset(ts);
 
-- 
2.17.1
