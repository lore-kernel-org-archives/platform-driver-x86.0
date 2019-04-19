From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v3 01/11] platform/x86: asus-wmi: Fix hwmon device cleanup
Date: Fri, 19 Apr 2019 12:00:39 +0200
Message-ID: <a548ce35-5bbc-1c61-2a52-808462000091@gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The driver does not clean up the hwmon device on exit or error. To
reproduce the bug, repeat rmmod, insmod to verify that device number
/sys/devices/platform/asus-nb-wmi/hwmon/hwmon?? grows every time. Replace
call for registering device with devm_* version that unregisters it
automatically.

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index ee1fa93708ec..d865eb95054c 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1425,9 +1425,10 @@ static int asus_wmi_hwmon_init(struct asus_wmi *asus)
 {
 	struct device *hwmon;
 
-	hwmon = hwmon_device_register_with_groups(&asus->platform_device->dev,
-						  "asus", asus,
-						  hwmon_attribute_groups);
+	hwmon = devm_hwmon_device_register_with_groups(
+			&asus->platform_device->dev, "asus", asus,
+			hwmon_attribute_groups);
+
 	if (IS_ERR(hwmon)) {
 		pr_err("Could not register asus hwmon device\n");
 		return PTR_ERR(hwmon);
-- 
2.17.1
