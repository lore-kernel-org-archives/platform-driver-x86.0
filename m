From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 08/24] Input: elan_i2c - Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 20:16:50 +0200
Message-ID: <20200826181706.11098-8-krzk@kernel.org>
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
 drivers/input/mouse/elan_i2c_core.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index c599e21a8478..d703b0d5a3bd 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1229,13 +1229,8 @@ static int elan_probe(struct i2c_client *client,
 	mutex_init(&data->sysfs_mutex);
 
 	data->vcc = devm_regulator_get(dev, "vcc");
-	if (IS_ERR(data->vcc)) {
-		error = PTR_ERR(data->vcc);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'vcc' regulator: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(data->vcc))
+		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
 	error = regulator_enable(data->vcc);
 	if (error) {
-- 
2.17.1
