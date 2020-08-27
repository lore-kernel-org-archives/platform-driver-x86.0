From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 18/27] Input: resistive-adc-touch - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 20:58:20 +0200
Message-ID: <20200827185829.30096-19-krzk@kernel.org>
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
 drivers/input/touchscreen/resistive-adc-touch.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
index cfc8bb4553f7..46b5a6caef84 100644
--- a/drivers/input/touchscreen/resistive-adc-touch.c
+++ b/drivers/input/touchscreen/resistive-adc-touch.c
@@ -108,12 +108,8 @@ static int grts_probe(struct platform_device *pdev)
 
 	/* get the channels from IIO device */
 	st->iio_chans = devm_iio_channel_get_all(dev);
-	if (IS_ERR(st->iio_chans)) {
-		error = PTR_ERR(st->iio_chans);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "can't get iio channels.\n");
-		return error;
-	}
+	if (IS_ERR(st->iio_chans))
+		return dev_err_probe(dev, PTR_ERR(st->iio_chans), "can't get iio channels\n");
 
 	chan = &st->iio_chans[0];
 	st->pressure = false;
-- 
2.17.1
