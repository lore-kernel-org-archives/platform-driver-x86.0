From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH 08/11] platform/x86: asus-wmi: Enhance detection of thermal
 data
Date: Wed, 10 Apr 2019 22:32:26 +0200
Message-ID: <91702752-5e6d-43c8-5b41-a52a34b10d26@gmail.com>
References: <a8dd77f3-1e28-6416-5f04-aff44d5bb6d6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a8dd77f3-1e28-6416-5f04-aff44d5bb6d6@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The obviously wrong value 1 for temperature device ID in this driver is
returned by at least some devices, including TUF Gaming series laptops,
instead of 0 as expected previously. Observable effect is that a
temp1_input in hwmon reads temperature near absolute zero.

* Consider 0.1 K as erroneous value in addition to 0 K.
* Refactor detection of thermal input availability to a separate function.

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 46 ++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b9a6dc224e08..175ecd5b7c51 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -176,6 +176,7 @@ struct asus_wmi {
 	struct asus_rfkill gps;
 	struct asus_rfkill uwb;
 
+	bool asus_hwmon_thermal_available;
 	bool asus_hwmon_fan_manual_mode;
 	int asus_hwmon_num_fans;
 	int asus_hwmon_pwm;
@@ -1373,6 +1374,32 @@ static struct attribute *hwmon_attributes[] = {
 	NULL
 };
 
+static int asus_hwmon_check_thermal_available(struct asus_wmi *asus)
+{
+	u32 value = ASUS_WMI_UNSUPPORTED_METHOD;
+	int err;
+
+	asus->asus_hwmon_thermal_available = false;
+	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_THERMAL_CTRL, &value);
+
+	if (err < 0) {
+		if (err == -ENODEV)
+			return 0;
+
+		return err;
+	}
+
+	/*
+	 * If the temperature value in deci-Kelvin is near the absolute
+	 * zero temperature, something is clearly wrong.
+	 */
+	if (!value || value == 1)
+		return 0;
+
+	asus->asus_hwmon_thermal_available = true;
+	return 0;
+}
+
 static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 					  struct attribute *attr, int idx)
 {
@@ -1386,8 +1413,6 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_pwm1.attr)
 		dev_id = ASUS_WMI_DEVID_FAN_CTRL;
-	else if (attr == &dev_attr_temp1_input.attr)
-		dev_id = ASUS_WMI_DEVID_THERMAL_CTRL;
 
 	if (attr == &dev_attr_fan1_input.attr
 	    || attr == &dev_attr_fan1_label.attr
@@ -1412,15 +1437,13 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 		 * - reverved bits are non-zero
 		 * - sfun and presence bit are not set
 		 */
-		if (value == ASUS_WMI_UNSUPPORTED_METHOD || value & 0xFFF80000
+		if (value == ASUS_WMI_UNSUPPORTED_METHOD || (value & 0xFFF80000)
 		    || (!asus->sfun && !(value & ASUS_WMI_DSTS_PRESENCE_BIT)))
 			ok = false;
 		else
 			ok = fan_attr <= asus->asus_hwmon_num_fans;
-	} else if (dev_id == ASUS_WMI_DEVID_THERMAL_CTRL) {
-		/* If value is zero, something is clearly wrong */
-		if (!value)
-			ok = false;
+	} else if (attr == &dev_attr_temp1_input.attr) {
+		ok = asus->asus_hwmon_thermal_available;
 	} else if (fan_attr <= asus->asus_hwmon_num_fans && fan_attr != -1) {
 		ok = true;
 	} else {
@@ -1476,6 +1499,15 @@ static int asus_wmi_fan_init(struct asus_wmi *asus)
 	}
 
 	pr_info("Number of fans: %d\n", asus->asus_hwmon_num_fans);
+
+	status = asus_hwmon_check_thermal_available(asus);
+	if (status) {
+		pr_warn("Could not check if thermal available: %d\n", status);
+		return -ENXIO;
+	}
+
+	pr_info(PR "Thermal available: %d\n",
+			asus->asus_hwmon_thermal_available);
 	return 0;
 }
 
-- 
2.17.1
