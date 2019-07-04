From: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [Patch v2 10/10] platform/x86/asus-wmi: using dev_get_drvdata directly
Date: Thu,  4 Jul 2019 10:36:47 +0800
Message-ID: <20190704023647.4873-1-huangfq.daxian@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fuqian Huang <huangfq.daxian@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Several drivers cast a struct device pointer to a struct
platform_device pointer only to then call platform_get_drvdata().
To improve readability, these constructs can be simplified
by using dev_get_drvdata() directly.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Make the commit message more clearly.

 drivers/platform/x86/asus-wmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 9b18a184e0aa..49049b02a015 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1353,8 +1353,7 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 					  struct attribute *attr, int idx)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
-	struct platform_device *pdev = to_platform_device(dev->parent);
-	struct asus_wmi *asus = platform_get_drvdata(pdev);
+	struct asus_wmi *asus = dev_get_drvdata(dev->parent);
 	int dev_id = -1;
 	int fan_attr = -1;
 	u32 value = ASUS_WMI_UNSUPPORTED_METHOD;
-- 
2.11.0
