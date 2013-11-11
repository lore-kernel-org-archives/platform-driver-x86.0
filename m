From: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
Subject: [PATCH 3/4] thinkpad_acpi: battery: Add
	force_discharge_ac_break attribute
Date: Mon, 11 Nov 2013 14:56:32 +0100
Message-ID: <1384178195-12218-4-git-send-email-jak@jak-linux.org>
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

Tells the EC to stop a forceful discharging if the AC is disconnected. First
needs force_discharge set to 1 to be able to work.  Actual functionality is
untested, as that attribute is not supported on an X230.

Signed-off-by: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
---
 Documentation/laptops/thinkpad-acpi.txt |  4 +++
 drivers/platform/x86/thinkpad_acpi.c    | 50 ++++++++++++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/Documentation/laptops/thinkpad-acpi.txt b/Documentation/laptops/thinkpad-acpi.txt
index 72882bb..8ec1898 100644
--- a/Documentation/laptops/thinkpad-acpi.txt
+++ b/Documentation/laptops/thinkpad-acpi.txt
@@ -1374,6 +1374,10 @@ battery sysfs attribute: force_discharge
 
 	Force discharging (0 or 1)
 
+battery sysfs attribute: force_discharge_ac_break
+
+	Break the discharging when the AC disconnects (0 or 1)
+
 Multiple Commands, Module Parameters
 ------------------------------------
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 67ce469..6b0521a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8358,7 +8358,7 @@ static struct ibm_struct fan_driver_data = {
 
 /* Modify battery_init() if you modify them */
 #define BATTERY_MAX_COUNT 3
-#define BATTERY_MAX_ATTRS 3
+#define BATTERY_MAX_ATTRS 4
 
 static struct battery {
 	char name[3 + 1 + 1];
@@ -8477,6 +8477,47 @@ static ssize_t battery_force_discharge_store(struct device *dev,
 	return count;
 }
 
+static ssize_t battery_force_discharge_ac_break_show(struct device *dev,
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
+	return snprintf(buf, PAGE_SIZE, "%d\n", (value >> 1) & 0x1);
+}
+
+static ssize_t battery_force_discharge_ac_break_store(struct device *dev,
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
+	/* Move into the right position */
+	value <<= 1;
+	/* Keep the forcedness state */
+	value |= (res) & 0x1;
+	/* Set the battery */
+	value |= (bat << 8);
+	if (!hkey_handle || !acpi_evalf(hkey_handle, &res, "BDSS",
+					"dd", (int) value) || res < 0)
+		return -EIO;
+	return count;
+}
+
 static int __init battery_init(struct ibm_init_struct *iibm)
 {
 	int res;
@@ -8529,6 +8570,13 @@ static int __init battery_init(struct ibm_init_struct *iibm)
 				       battery_force_discharge_store),
 			.var = (void *) (unsigned long) (i + 1)
 		};
+		batteries[i].attributes[j++] = (struct dev_ext_attribute) {
+			.attr = __ATTR(force_discharge_ac_break,
+				       S_IWUSR | S_IRUGO,
+				       battery_force_discharge_ac_break_show,
+				       battery_force_discharge_ac_break_store),
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
