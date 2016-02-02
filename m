From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH v3 6/6] alienware-wmi: whitespace improvements
Date: Tue,  2 Feb 2016 15:38:57 -0600
Message-ID: <1454449137-16478-7-git-send-email-mario_limonciello@dell.com>
References: <1454449137-16478-1-git-send-email-mario_limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454449137-16478-1-git-send-email-mario_limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

These were some items that were pointed out in previous patches that
weren't caught be previous reviewers, but should be applied to other
parts of the driver as well.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/alienware-wmi.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 0cbcda1..536fee6 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -229,7 +229,7 @@ static u8 global_brightness;
 
 /*
  * Helpers used for zone control
-*/
+ */
 static int parse_rgb(const char *buf, struct platform_zone *zone)
 {
 	long unsigned int rgb;
@@ -269,7 +269,7 @@ static struct platform_zone *match_zone(struct device_attribute *attr)
 
 /*
  * Individual RGB zone control
-*/
+ */
 static int alienware_update_led(struct platform_zone *zone)
 {
 	int method_id;
@@ -342,7 +342,7 @@ static ssize_t zone_set(struct device *dev, struct device_attribute *attr,
 
 /*
  * LED Brightness (Global)
-*/
+ */
 static int wmax_brightness(int brightness)
 {
 	acpi_status status;
@@ -386,7 +386,7 @@ static struct led_classdev global_led = {
 
 /*
  * Lighting control state device attribute (Global)
-*/
+ */
 static ssize_t show_control_state(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
@@ -590,14 +590,12 @@ static ssize_t toggle_hdmi_source(struct device *dev,
 	status = alienware_wmax_command(&args, WMAX_METHOD_HDMI_SOURCE, NULL);
 
 	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n",
-		       status);
+		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", status);
 	return count;
 }
 
 static DEVICE_ATTR(cable, S_IRUGO, show_hdmi_cable, NULL);
-static DEVICE_ATTR(source, S_IRUGO | S_IWUSR, show_hdmi_source,
-		   toggle_hdmi_source);
+static DEVICE_ATTR(source, S_IRUGO | S_IWUSR, show_hdmi_source, toggle_hdmi_source);
 
 static struct attribute *hdmi_attrs[] = {
 	&dev_attr_cable.attr,
@@ -622,11 +620,7 @@ static int create_hdmi(struct platform_device *dev)
 
 	ret = sysfs_create_group(&dev->dev.kobj, &hdmi_attribute_group);
 	if (ret)
-		goto error_create_hdmi;
-	return 0;
-
-error_create_hdmi:
-	remove_hdmi(dev);
+		remove_hdmi(dev);
 	return ret;
 }
 
-- 
1.9.1
