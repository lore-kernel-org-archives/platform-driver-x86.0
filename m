From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 10/27] Input: cy8ctma140 - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 20:58:12 +0200
Message-ID: <20200827185829.30096-11-krzk@kernel.org>
References: <20200827185829.30096-1-krzk@kernel.org>
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200827185829.30096-1-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, clang-built-linux@googlegroups.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/touchscreen/cy8ctma140.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/cy8ctma140.c b/drivers/input/touchscreen/cy8ctma140.c
index a9be29139cbf..23da5bb00ead 100644
--- a/drivers/input/touchscreen/cy8ctma140.c
+++ b/drivers/input/touchscreen/cy8ctma140.c
@@ -259,12 +259,8 @@ static int cy8ctma140_probe(struct i2c_client *client,
 	ts->regulators[1].supply = "vdd";
 	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->regulators),
 				      ts->regulators);
-	if (error) {
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get regulators %d\n",
-				error);
-		return error;
-	}
+	if (error)
+		return dev_err_probe(dev, error, "Failed to get regulators\n");
 
 	error = cy8ctma140_power_up(ts);
 	if (error)
-- 
2.17.1
