From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH] platform/x86: huawei-wmi: Remove unnecessary battery mutex
Date: Sat, 19 Oct 2019 21:24:58 -0400
Message-ID: <20191020012504.17919-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, Mattias Jacobsson <2pi@mok.nu>, Takashi Iwai <tiwai@suse.de>, kbuild test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

battery_lock mutex is never used and not needed.

Fixes: 355a070b09ab ("platform/x86: huawei-wmi: Add battery charging thresholds")
Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 7373a65a61d3..a2d846c4a7ee 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -67,7 +67,6 @@ struct huawei_wmi {
 	struct led_classdev cdev;
 	struct device *dev;
 
-	struct mutex battery_lock;
 	struct mutex wmi_lock;
 };
 
@@ -807,7 +806,6 @@ static int huawei_wmi_probe(struct platform_device *pdev)
 
 	if (wmi_has_guid(HWMI_METHOD_GUID)) {
 		mutex_init(&huawei_wmi->wmi_lock);
-		mutex_init(&huawei_wmi->battery_lock);
 
 		huawei_wmi_leds_setup(&pdev->dev);
 		huawei_wmi_fn_lock_setup(&pdev->dev);

base-commit: fd13c8622a5ad4f7317b64de4f6aa2de1962220e
prerequisite-patch-id: 7639f479e344d2a1be074f93dc5e5530611928f9
prerequisite-patch-id: ad5932635d0c0d531a99e15e239f81ecc69b47d6
-- 
2.21.0
