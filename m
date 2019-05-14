From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v4 11/13] platform/x86: asus-wmi: Enhance detection of thermal
 data
Date: Tue, 14 May 2019 21:05:46 +0200
Message-ID: <f6fe0ba2-309f-0d64-3fc8-8bc8727a40b5@gmail.com>
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The obviously wrong value 1 for temperature device ID in this driver is
returned by at least some devices, including TUF Gaming series laptops,
instead of 0 as expected previously. Observable effect is that a
temp1_input in hwmon reads temperature near absolute zero.

Consider 0.1 K an erroneous value in addition to 0 K.

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index bd9eb00f3a27..ffb4e2530ea4 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1428,8 +1428,11 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 		else
 			ok = fan_attr <= asus->asus_hwmon_num_fans;
 	} else if (dev_id == ASUS_WMI_DEVID_THERMAL_CTRL) {
-		/* If value is zero, something is clearly wrong */
-		if (!value)
+		/*
+		 * If the temperature value in deci-Kelvin is near the absolute
+		 * zero temperature, something is clearly wrong
+		 */
+		if (value == 0 || value == 1)
 			ok = false;
 	} else if (fan_attr <= asus->asus_hwmon_num_fans && fan_attr != -1) {
 		ok = true;
-- 
2.17.1
