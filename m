From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH 2/3] platform/x86: huawei-wmi: No need to check for battery name
Date: Sun, 20 Oct 2019 13:00:08 -0400
Message-ID: <20191020170020.26251-2-ayman.bagabas@gmail.com>
References: <20191020170020.26251-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191020170020.26251-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ayman Bagabas <ayman.bagabas@gmail.com>, Mattias Jacobsson <2pi@mok.nu>, Takashi Iwai <tiwai@suse.de>, Dan Carpenter <dan.carpenter@oracle.com>, kbuild test robot <lkp@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

No need to check for battery name, we already check if the WMI function is
available in huawei_wmi_battery_setup.

Fixes: 355a070b09ab ("platform/x86: huawei-wmi: Add battery charging thresholds")
Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 26041d44286a..7373a65a61d3 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -471,10 +471,6 @@ static DEVICE_ATTR_RW(charge_control_thresholds);
 
 static int huawei_wmi_battery_add(struct power_supply *battery)
 {
-	/* Huawei laptops come with one battery only */
-	if (strcmp(battery->desc->name, "BAT") != 1)
-		return -ENODEV;
-
 	device_create_file(&battery->dev, &dev_attr_charge_control_start_threshold);
 	device_create_file(&battery->dev, &dev_attr_charge_control_end_threshold);
 
-- 
2.21.0
