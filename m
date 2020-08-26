From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 04/24] Input: gpio-vibra - Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 20:16:46 +0200
Message-ID: <20200826181706.11098-4-krzk@kernel.org>
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
 drivers/input/misc/gpio-vibra.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/input/misc/gpio-vibra.c b/drivers/input/misc/gpio-vibra.c
index f79f75595dd7..53042e0ba9ee 100644
--- a/drivers/input/misc/gpio-vibra.c
+++ b/drivers/input/misc/gpio-vibra.c
@@ -114,21 +114,13 @@ static int gpio_vibrator_probe(struct platform_device *pdev)
 
 	vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
 	err = PTR_ERR_OR_ZERO(vibrator->vcc);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request regulator: %d\n",
-				err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "Failed to request regulator\n");
 
 	vibrator->gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
 	err = PTR_ERR_OR_ZERO(vibrator->gpio);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request main gpio: %d\n",
-				err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "Failed to request main gpio\n");
 
 	INIT_WORK(&vibrator->play_work, gpio_vibrator_play_work);
 
-- 
2.17.1
