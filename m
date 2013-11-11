From: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
Subject: [PATCH 2/4] thinkpad_acpi: battery: Add
	force_discharge attribute
Date: Mon, 11 Nov 2013 14:56:31 +0100
Message-ID: <1384178195-12218-3-git-send-email-jak@jak-linux.org>
References: <1384178195-12218-1-git-send-email-jak@jak-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1384178195-12218-1-git-send-email-jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org>
Cc: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, "open list:THINKPAD ACPI EXT..." <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:THINKPAD ACPI EXT..." <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

This makes it possible to forcefully discharge a battery.

Signed-off-by: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
---
 Documentation/laptops/thinkpad-acpi.txt |  4 +++
 drivers/platform/x86/thinkpad_acpi.c    | 49 ++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/laptops/thinkpad-acpi.txt b/Documentation/laptops/thinkpad-acpi.txt
index 97b150a..72882bb 100644
--- a/Documentation/laptops/thinkpad-acpi.txt
+++ b/Documentation/laptops/thinkpad-acpi.txt
@@ -1370,6 +1370,10 @@ battery sysfs attribute: stop_charge_thresh
 	A percentage value from 1-99%, controlling when charging should stop, or
 	0 for the default value.
 
+battery sysfs attribute: force_discharge
+
+	Force discharging (0 or 1)
+
 Multiple Commands, Module Parameters
 ------------------------------------
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 66e629e..67ce469 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8358,7 +8358,7 @@ static struct ibm_struct fan_driver_data = {
 
 /* Modify battery_init() if you modify them */
 #define BATTERY_MAX_COUNT 3
-#define BATTERY_MAX_ATTRS 2
+#define BATTERY_MAX_ATTRS 3
 
 static struct battery {
 	char name[3 + 1 + 1];
@@ -8437,6 +8437,46 @@ static ssize_t battery_stop_charge_thresh_show(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", value & 0xFF);
 }
 
+static ssize_t battery_force_discharge_show(struct device *dev,
+						struct device_attribute *attr,
+						char *buf)
+{
+	int bat = battery_attribute_get_battery(attr);
+	int value;
+
+	if (!hkey_handle || !acpi_evalf(hkey_handle, &value, "BDSG",
+					"dd", bat))
+		return -EIO;
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", value & 0x1);
+}
+
+static ssize_t battery_force_discharge_store(struct device *dev,
+						struct device_attribute *attr,
+						const char *buf, size_t count)
+{
+	int bat = battery_attribute_get_battery(attr);
+	int res = -EINVAL;
+	unsigned long value;
+
+	res = kstrtoul(buf, 0, &value);
+	if (res || value > 1)
+		return res ? res : -EINVAL;
+
+	if (!hkey_handle || !acpi_evalf(hkey_handle, &res, "BDSG", "dd", bat))
+		return -EIO;
+
+	/* Keep the break on AC disconnect state */
+	value |= (res >> 1) & 0x1;
+	/* Set the battery */
+	value |= (bat << 8);
+
+	if (!hkey_handle || !acpi_evalf(hkey_handle, &res, "BDSS",
+					"dd", (int) value) || res < 0)
+		return -EIO;
+	return count;
+}
+
 static int __init battery_init(struct ibm_init_struct *iibm)
 {
 	int res;
@@ -8482,6 +8522,13 @@ static int __init battery_init(struct ibm_init_struct *iibm)
 				       battery_stop_charge_thresh_store),
 			.var = (void *) (unsigned long) (i + 1)
 		};
+		batteries[i].attributes[j++] = (struct dev_ext_attribute) {
+			.attr = __ATTR(force_discharge,
+				       S_IWUSR | S_IRUGO,
+				       battery_force_discharge_show,
+				       battery_force_discharge_store),
+			.var = (void *) (unsigned long) (i + 1)
+		};
 
 		strncpy(batteries[i].name, "BAT", 3);
 		batteries[i].name[3] = '0' + i;
-- 
1.8.4.2


------------------------------------------------------------------------------
November Webinars for C, C++, Fortran Developers
Accelerate application performance with scalable programming models. Explore
techniques for threading, error checking, porting, and tuning. Get the most 
from the latest Intel processors and coprocessors. See abstracts and register
http://pubads.g.doubleclick.net/gampad/clk?id=60136231&iu=/4140/ostg.clktrk
