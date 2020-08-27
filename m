From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 25/27] Input: gpio_keys - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 20:58:27 +0200
Message-ID: <20200827185829.30096-26-krzk@kernel.org>
References: <20200827185829.30096-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200827185829.30096-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, clang-built-linux@googlegroups.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe() and devm_fwnode_gpiod_get_optional().   Less code and
the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

---

Changes since v2:
1. Preserve comment,
2. Include <device.h> to fix warning on clang (reported by kbuild),
3. Fix use of uninitialized "error" variable.

Changes since v1:
1. Use devm_fwnode_gpiod_get_optional
---
 drivers/input/keyboard/gpio_keys.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index f2d4e4daa818..160d94b1c2c0 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -18,6 +18,7 @@
 #include <linux/sysctl.h>
 #include <linux/proc_fs.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
@@ -494,23 +495,13 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 	spin_lock_init(&bdata->lock);
 
 	if (child) {
-		bdata->gpiod = devm_fwnode_gpiod_get(dev, child,
-						     NULL, GPIOD_IN, desc);
-		if (IS_ERR(bdata->gpiod)) {
-			error = PTR_ERR(bdata->gpiod);
-			if (error == -ENOENT) {
-				/*
-				 * GPIO is optional, we may be dealing with
-				 * purely interrupt-driven setup.
-				 */
-				bdata->gpiod = NULL;
-			} else {
-				if (error != -EPROBE_DEFER)
-					dev_err(dev, "failed to get gpio: %d\n",
-						error);
-				return error;
-			}
-		}
+		/*
+		 * GPIO is optional, we may be dealing with purely
+		 * interrupt-driven setup.
+		 */
+		bdata->gpiod = devm_fwnode_gpiod_get_optional(dev, child, NULL, GPIOD_IN, desc);
+		if (IS_ERR(bdata->gpiod))
+			return dev_err_probe(dev, PTR_ERR(bdata->gpiod), "failed to get gpio\n");
 	} else if (gpio_is_valid(button->gpio)) {
 		/*
 		 * Legacy GPIO number, so request the GPIO here and
-- 
2.17.1
