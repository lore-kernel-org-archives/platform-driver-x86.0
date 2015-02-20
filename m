From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFT PATCH v2 1/2] compal-laptop: Fix leaking hwmon device
Date: Fri, 20 Feb 2015 14:04:39 +0100
Message-ID: <1424437480-22364-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Matthew Garrett <matthew.garrett@nebula.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The commit c2be45f09bb0 ("compal-laptop: Use
devm_hwmon_device_register_with_groups") wanted to change the
registering of hwmon device to resource-managed version. It mostly did
it except the main thing - it forgot to use devm-like function so the
hwmon device leaked after device removal or probe failure.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Fixes: c2be45f09bb0 ("compal-laptop: Use devm_hwmon_device_register_with_groups")
Cc: <stable@vger.kernel.org>

---
Changes since v1:
1. New patch.
---
 drivers/platform/x86/compal-laptop.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 15c0fab2bfa1..eb9885e7fb0e 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -1026,9 +1026,9 @@ static int compal_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	hwmon_dev = hwmon_device_register_with_groups(&pdev->dev,
-						      "compal", data,
-						      compal_hwmon_groups);
+	hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
+							   "compal", data,
+							   compal_hwmon_groups);
 	if (IS_ERR(hwmon_dev)) {
 		err = PTR_ERR(hwmon_dev);
 		goto remove;
-- 
1.9.1
