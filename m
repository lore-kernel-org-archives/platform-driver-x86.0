From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] platform/x86: huawei-wmi: Fix misuse of strcmp() function
Date: Tue, 15 Oct 2019 13:25:49 -0500
Message-ID: <20191015182549.GA13772@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ayman Bagabas <ayman.bagabas@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: platform-driver-x86.vger.kernel.org

Comparing the result of strcmp directly with 1 may cause it to be
misinterpreted. Note that strcmp may return an integer besides -1,
0, or 1.

Fix this by returning -ENODEV only when strcmp() returns a value
other than 0.

Addresses-Coverity-ID: 1487035 ("Misuse of memcmp-style function")
Fixes: b7527d0f4502 ("platform/x86: huawei-wmi: Add battery charging thresholds")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/platform/x86/huawei-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 6720f78c60c2..b43f76acbfea 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -470,7 +470,7 @@ static DEVICE_ATTR_RW(charge_control_thresholds);
 static int huawei_wmi_battery_add(struct power_supply *battery)
 {
 	/* Huawei laptops come with one battery only */
-	if (strcmp(battery->desc->name, "BAT") != 1)
+	if (strcmp(battery->desc->name, "BAT"))
 		return -ENODEV;
 
 	device_create_file(&battery->dev, &dev_attr_charge_control_start_threshold);
-- 
2.23.0
