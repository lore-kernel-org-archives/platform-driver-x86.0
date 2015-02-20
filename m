From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFT PATCH v3 2/2] compal-laptop: Check return value of
 power_supply_register
Date: Fri, 20 Feb 2015 14:13:35 +0100
Message-ID: <1424438015-3006-2-git-send-email-k.kozlowski@samsung.com>
References: <1424438015-3006-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <1424438015-3006-1-git-send-email-k.kozlowski@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Matthew Garrett <matthew.garrett@nebula.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The return value of power_supply_register() call was not checked and
even on error probe() function returned 0. If registering failed then
during unbind the driver tried to unregister power supply which was not
actually registered.

This could lead to memory corruption because power_supply_unregister()
unconditionally cleans up given power supply.

Fix this by checking return status of power_supply_register() call. In
case of failure, clean up sysfs entries and fail the probe.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Fixes: 9be0fcb5ed46 ("compal-laptop: add JHL90, battery & hwmon interface")
Cc: <stable@vger.kernel.org>

---
Changes since v2:
1. Remove FIXME note.

Changes since v1:
1. Don't unregister hwmon device because previous patch solves this by
   using devm-like function.
---
 drivers/platform/x86/compal-laptop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index eb9885e7fb0e..bceb30b539f3 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -1036,7 +1036,9 @@ static int compal_probe(struct platform_device *pdev)
 
 	/* Power supply */
 	initialize_power_supply_data(data);
-	power_supply_register(&compal_device->dev, &data->psy);
+	err = power_supply_register(&compal_device->dev, &data->psy);
+	if (err < 0)
+		goto remove;
 
 	platform_set_drvdata(pdev, data);
 
-- 
1.9.1
