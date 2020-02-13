From: Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
Date: Thu, 13 Feb 2020 15:42:32 +0900
Message-ID: <20200213064232.13267-1-njoshi1@lenovo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, mpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

  This feature is supported on some Thinkpad products like T490s, Thinkpad
  X1 yoga 4th Gen etc . The lcdshadow feature can be enabled and disabled
  when user press "Fn" + "D" key. Currently, no user feedback is given for
  this action. Adding as sysfs entry allows userspace to show an On Screen
  Display whenever the setting changes.

  Summary of changes is mentioned below :

 - Added TP_HKEY_EV_LCDSHADOW_CHANGED for consistency inside the driver
 - Added unmapped LCDSHADOW to keymap
 - Added lcdshadow_get function to read value using ACPI
 - Added lcdshadow_refresh function to re-read value and send notification
 - Added sysfs group creation to tpaci_lcdshadow_init
 - Added lcdshadow_exit to remove sysfs group again
 - Implemented lcdshadow_enable_show/lcdshadow_enable_store
 - Added handler to tpacpi_driver_event to update refresh lcdshadow
 - Explicitly call tpacpi_driver_event for extended keyset

 Patch is tested on kernel 5.5 on Thinkpad X1 Yoga 4th Gen.

Co-developed-by: Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Benjamin Berg <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Mark Pearson <mpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 117 +++++++++++++++++++++++----
 1 file changed, 102 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index da794dcfdd92..bd137cc7baee 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -155,6 +155,7 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_VOL_UP		= 0x1015, /* Volume up or unmute */
 	TP_HKEY_EV_VOL_DOWN		= 0x1016, /* Volume down or unmute */
 	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output mute */
+	TP_HKEY_EV_LCDSHADOW_CHANGED	= 0x130f, /* Eprivacy status changed */
 
 	/* Reasons for waking up from S3/S4 */
 	TP_HKEY_EV_WKUP_S3_UNDOCK	= 0x2304, /* undock requested, S3 */
@@ -1925,6 +1926,7 @@ enum {	/* hot key scan codes (derived from ACPI DSDT) */
 
 	/* Lenovo extended keymap, starting at 0x1300 */
 	TP_ACPI_HOTKEYSCAN_EXTENDED_START,
+	TP_ACPI_HOTKEYSCAN_LCDSHADOW = 67,
 	/* first new observed key (star, favorites) is 0x1311 */
 	TP_ACPI_HOTKEYSCAN_STAR = 69,
 	TP_ACPI_HOTKEYSCAN_CLIPPING_TOOL2,
@@ -3342,7 +3344,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
-		KEY_UNKNOWN, KEY_UNKNOWN
+		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 
 		},
 
@@ -3444,7 +3446,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
-		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
+		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
+		KEY_RESERVED,         /* LCD Shadow/ePrivacy */
 		KEY_UNKNOWN,
 
 		KEY_BOOKMARKS,       /* Favorite app, 0x311 */
@@ -3921,6 +3924,7 @@ static bool hotkey_notify_hotkey(const u32 hkey,
 		scancode -= (0x300 - TP_ACPI_HOTKEYSCAN_EXTENDED_START);
 		if (scancode >= TP_ACPI_HOTKEYSCAN_EXTENDED_START &&
 		    scancode < TPACPI_HOTKEY_MAP_LEN) {
+			tpacpi_driver_event(hkey);
 			tpacpi_input_send_key(scancode);
 			return true;
 		}
@@ -9717,6 +9721,12 @@ static struct ibm_struct battery_driver_data = {
 
 static int lcdshadow_state;
 
+static void lcdshadow_notify_change(void)
+{
+	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
+		     "lcdshadow_enable");
+}
+
 static int lcdshadow_on_off(bool state)
 {
 	acpi_handle set_shadow_handle;
@@ -9731,6 +9741,7 @@ static int lcdshadow_on_off(bool state)
 		return -EIO;
 
 	lcdshadow_state = state;
+	lcdshadow_notify_change();
 	return 0;
 }
 
@@ -9743,27 +9754,90 @@ static int lcdshadow_set(bool on)
 	return lcdshadow_on_off(on);
 }
 
-static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
+static int lcdshadow_get(void)
 {
 	acpi_handle get_shadow_handle;
 	int output;
 
-	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GSSS", &get_shadow_handle))) {
-		lcdshadow_state = -ENODEV;
-		return 0;
-	}
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GSSS",
+					&get_shadow_handle)))
+		return -ENODEV;
 
-	if (!acpi_evalf(get_shadow_handle, &output, NULL, "dd", 0)) {
-		lcdshadow_state = -EIO;
+	if (!acpi_evalf(get_shadow_handle, &output, NULL, "dd", 0))
 		return -EIO;
+
+	if (!(output & 0x10000))
+		return -ENODEV;
+
+	return output & 0x1;
+}
+
+static void lcdshadow_refresh(void)
+{
+	int new_state;
+
+	new_state = lcdshadow_get();
+
+	if (lcdshadow_state != new_state) {
+		lcdshadow_state = new_state;
+		lcdshadow_notify_change();
 	}
-	if (!(output & 0x10000)) {
-		lcdshadow_state = -ENODEV;
-		return 0;
-	}
-	lcdshadow_state = output & 0x1;
+}
 
-	return 0;
+
+/* sysfs lcdshadow entry */
+static ssize_t lcdshadow_enable_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	if (lcdshadow_state < 0)
+		return lcdshadow_state;
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", lcdshadow_state);
+}
+
+static ssize_t lcdshadow_enable_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
+{
+	unsigned long t;
+	int res;
+
+	if (parse_strtoul(buf, 1, &t))
+		return -EINVAL;
+
+	tpacpi_disclose_usertask(attr->attr.name, "set to %ld\n", t);
+
+	res = lcdshadow_set(!!t);
+
+	return (res < 0) ? res : count;
+}
+
+static DEVICE_ATTR_RW(lcdshadow_enable);
+
+static struct attribute *lcdshadow_attributes[] = {
+	&dev_attr_lcdshadow_enable.attr,
+	NULL
+};
+
+static const struct attribute_group lcdshadow_attr_group = {
+	.attrs = lcdshadow_attributes,
+};
+
+
+static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
+{
+	int res;
+
+	lcdshadow_state = lcdshadow_get();
+
+	if (lcdshadow_state < 0 && lcdshadow_state != -ENODEV)
+		return lcdshadow_state;
+
+	res = sysfs_create_group(&tpacpi_pdev->dev.kobj,
+				  &lcdshadow_attr_group);
+
+	return res;
 }
 
 static void lcdshadow_resume(void)
@@ -9805,11 +9879,18 @@ static int lcdshadow_write(char *buf)
 	return lcdshadow_set(state);
 }
 
+static void lcdshadow_exit(void)
+{
+	sysfs_remove_group(&tpacpi_pdev->dev.kobj,
+			   &lcdshadow_attr_group);
+}
+
 static struct ibm_struct lcdshadow_driver_data = {
 	.name = "lcdshadow",
 	.resume = lcdshadow_resume,
 	.read = lcdshadow_read,
 	.write = lcdshadow_write,
+	.exit = lcdshadow_exit,
 };
 
 /****************************************************************************
@@ -9859,6 +9940,12 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 
 		mutex_unlock(&kbdlight_mutex);
 	}
+	if (lcdshadow_state >= 0) {
+		switch (hkey_event) {
+		case TP_HKEY_EV_LCDSHADOW_CHANGED:
+			lcdshadow_refresh();
+		}
+	}
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
-- 
2.17.1
