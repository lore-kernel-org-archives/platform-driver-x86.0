From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v3 07/11] platform/x86: asus-wmi: Organize code into sections
Date: Fri, 19 Apr 2019 12:12:11 +0200
Message-ID: <9a4351a5-ab04-2ebb-9961-1c50dda9800d@gmail.com>
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

The driver has grown pretty big and will grow more, which makes it hard to
navigate and understand. Add uniform comments to the code and ensure that
it is sorted into logical sections.

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 94 ++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 48 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index f782dac4cbe7..e69e55635afb 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -193,6 +193,8 @@ struct asus_wmi {
 	struct asus_wmi_driver *driver;
 };
 
+/* Input **********************************************************************/
+
 static int asus_wmi_input_init(struct asus_wmi *asus)
 {
 	int err;
@@ -230,6 +232,8 @@ static void asus_wmi_input_exit(struct asus_wmi *asus)
 	asus->inputdev = NULL;
 }
 
+/* WMI ************************************************************************/
+
 static int asus_wmi_evaluate_method_3dw(u32 method_id, u32 arg0, u32 arg1,
 		u32 arg2, u32 *retval)
 {
@@ -248,7 +252,7 @@ static int asus_wmi_evaluate_method_3dw(u32 method_id, u32 arg0, u32 arg1,
 				     &input, &output);
 
 	if (ACPI_FAILURE(status))
-		goto exit;
+		return -EIO;
 
 	obj = (union acpi_object *)output.pointer;
 	if (obj && obj->type == ACPI_TYPE_INTEGER)
@@ -259,10 +263,6 @@ static int asus_wmi_evaluate_method_3dw(u32 method_id, u32 arg0, u32 arg1,
 
 	kfree(obj);
 
-exit:
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
 	if (tmp == ASUS_WMI_UNSUPPORTED_METHOD)
 		return -ENODEV;
 
@@ -346,9 +346,8 @@ static int asus_wmi_get_devstate_simple(struct asus_wmi *asus, u32 dev_id)
 					  ASUS_WMI_DSTS_STATUS_BIT);
 }
 
-/*
- * LEDs
- */
+/* LEDs ***********************************************************************/
+
 /*
  * These functions actually update the LED's, and are called from a
  * workqueue. By doing this as separate work rather than when the LED
@@ -658,6 +657,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 	return rv;
 }
 
+/* RF *************************************************************************/
 
 /*
  * PCI hotplug (for wlan rfkill)
@@ -1080,6 +1080,8 @@ static int asus_wmi_rfkill_init(struct asus_wmi *asus)
 	return result;
 }
 
+/* Quirks *********************************************************************/
+
 static void asus_wmi_set_xusb2pr(struct asus_wmi *asus)
 {
 	struct pci_dev *xhci_pdev;
@@ -1112,9 +1114,8 @@ static void asus_wmi_set_als(void)
 	asus_wmi_set_devstate(ASUS_WMI_DEVID_ALS_ENABLE, 1, NULL);
 }
 
-/*
- * Hwmon device
- */
+/* Hwmon device ***************************************************************/
+
 static int asus_hwmon_agfn_fan_speed_read(struct asus_wmi *asus, int fan,
 					  int *speed)
 {
@@ -1390,7 +1391,6 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 	else if (attr == &dev_attr_temp1_input.attr)
 		dev_id = ASUS_WMI_DEVID_THERMAL_CTRL;
 
-
 	if (attr == &dev_attr_fan1_input.attr
 	    || attr == &dev_attr_fan1_label.attr
 	    || attr == &dev_attr_pwm1.attr
@@ -1453,9 +1453,27 @@ static int asus_wmi_hwmon_init(struct asus_wmi *asus)
 	return 0;
 }
 
-/*
- * Backlight
- */
+static int asus_wmi_fan_init(struct asus_wmi *asus)
+{
+	int status;
+
+	asus->asus_hwmon_pwm = -1;
+	asus->asus_hwmon_num_fans = -1;
+	asus->asus_hwmon_fan_manual_mode = false;
+
+	status = asus_hwmon_get_fan_number(asus, &asus->asus_hwmon_num_fans);
+	if (status) {
+		asus->asus_hwmon_num_fans = 0;
+		pr_warn("Could not determine number of fans: %d\n", status);
+		return -ENXIO;
+	}
+
+	pr_info("Number of fans: %d\n", asus->asus_hwmon_num_fans);
+	return 0;
+}
+
+/* Backlight ******************************************************************/
+
 static int read_backlight_power(struct asus_wmi *asus)
 {
 	int ret;
@@ -1637,6 +1655,8 @@ static int is_display_toggle(int code)
 	return 0;
 }
 
+/* WMI events *****************************************************************/
+
 static int asus_wmi_get_next_event(u32 value)
 {
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -1762,9 +1782,8 @@ static int asus_wmi_notify_queue_flush(struct asus_wmi *asus)
 	return -EIO;
 }
 
-/*
- * Sys helpers
- */
+/* Sysfs **********************************************************************/
+
 static int parse_arg(const char *buf, unsigned long count, int *val)
 {
 	if (!count)
@@ -1903,9 +1922,8 @@ static int asus_wmi_sysfs_init(struct platform_device *device)
 	return sysfs_create_group(&device->dev.kobj, &platform_attribute_group);
 }
 
-/*
- * Platform device
- */
+/* Platform device ************************************************************/
+
 static int asus_wmi_platform_init(struct asus_wmi *asus)
 {
 	int rv;
@@ -1990,9 +2008,8 @@ static void asus_wmi_platform_exit(struct asus_wmi *asus)
 	asus_wmi_sysfs_exit(asus->platform_device);
 }
 
-/*
- * debugfs
- */
+/* debugfs ********************************************************************/
+
 struct asus_wmi_debugfs_node {
 	struct asus_wmi *asus;
 	char *name;
@@ -2139,28 +2156,8 @@ static int asus_wmi_debugfs_init(struct asus_wmi *asus)
 	return -ENOMEM;
 }
 
-static int asus_wmi_fan_init(struct asus_wmi *asus)
-{
-	int status;
-
-	asus->asus_hwmon_pwm = -1;
-	asus->asus_hwmon_num_fans = -1;
-	asus->asus_hwmon_fan_manual_mode = false;
-
-	status = asus_hwmon_get_fan_number(asus, &asus->asus_hwmon_num_fans);
-	if (status) {
-		asus->asus_hwmon_num_fans = 0;
-		pr_warn("Could not determine number of fans: %d\n", status);
-		return -ENXIO;
-	}
-
-	pr_info("Number of fans: %d\n", asus->asus_hwmon_num_fans);
-	return 0;
-}
+/* Init / exit ****************************************************************/
 
-/*
- * WMI Driver
- */
 static int asus_wmi_add(struct platform_device *pdev)
 {
 	struct platform_driver *pdrv = to_platform_driver(pdev->dev.driver);
@@ -2288,9 +2285,8 @@ static int asus_wmi_remove(struct platform_device *device)
 	return 0;
 }
 
-/*
- * Platform driver - hibernate/resume callbacks
- */
+/* Platform driver - hibernate/resume callbacks *******************************/
+
 static int asus_hotk_thaw(struct device *device)
 {
 	struct asus_wmi *asus = dev_get_drvdata(device);
@@ -2362,6 +2358,8 @@ static const struct dev_pm_ops asus_pm_ops = {
 	.resume = asus_hotk_resume,
 };
 
+/* Registration ***************************************************************/
+
 static int asus_wmi_probe(struct platform_device *pdev)
 {
 	struct platform_driver *pdrv = to_platform_driver(pdev->dev.driver);
-- 
2.17.1
