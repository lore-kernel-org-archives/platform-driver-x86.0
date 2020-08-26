From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 13/24] Input: edf-ft5x06 - Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 20:16:55 +0200
Message-ID: <20200826181706.11098-13-krzk@kernel.org>
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
 drivers/input/touchscreen/edt-ft5x06.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 6ff81d48da86..d4827ac963b0 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1098,13 +1098,9 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client,
 	tsdata->max_support_points = chip_data->max_support_points;
 
 	tsdata->vcc = devm_regulator_get(&client->dev, "vcc");
-	if (IS_ERR(tsdata->vcc)) {
-		error = PTR_ERR(tsdata->vcc);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"failed to request regulator: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(tsdata->vcc))
+		return dev_err_probe(&client->dev, PTR_ERR(tsdata->vcc),
+				     "failed to request regulator\n");
 
 	error = regulator_enable(tsdata->vcc);
 	if (error < 0) {
-- 
2.17.1
