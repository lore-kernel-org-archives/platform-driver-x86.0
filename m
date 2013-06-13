From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] hp-wmi: add supports for POST code error
Date: Thu, 13 Jun 2013 16:46:25 +0800
Message-ID: <1371113185-20542-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:49899 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758442Ab3FMIqb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Jun 2013 04:46:31 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org
Cc: Alex Hung <alex.hung@canonical.com>

HP laptops include a POST code error query 0x2A that reports
which point BIOS fails to boot at. The error code is kept in CMOS
until it is cleared.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/hp-wmi.c |   47 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index d111c86..d6970f4 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -55,6 +55,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 #define HPWMI_WIRELESS_QUERY 0x5
 #define HPWMI_HOTKEY_QUERY 0xc
 #define HPWMI_WIRELESS2_QUERY 0x1b
+#define HPWMI_POSTCODEERROR_QUERY 0x2a
 
 enum hp_wmi_radio {
 	HPWMI_WIFI = 0,
@@ -386,6 +387,16 @@ static int hp_wmi_rfkill2_refresh(void)
 	return 0;
 }
 
+static int hp_wmi_post_code_state(void)
+{
+	int state = 0;
+	int ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, 0, &state,
+				       sizeof(state), sizeof(state));
+	if (ret)
+		return -EINVAL;
+	return state;
+}
+
 static ssize_t show_display(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
@@ -431,6 +442,16 @@ static ssize_t show_tablet(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", value);
 }
 
+static ssize_t show_postcode(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	/* Get the POST error code of previous boot failure. */
+	int value = hp_wmi_post_code_state();
+	if (value < 0)
+		return -EINVAL;
+	return sprintf(buf, "0x%x\n", value);
+}
+
 static ssize_t set_als(struct device *dev, struct device_attribute *attr,
 		       const char *buf, size_t count)
 {
@@ -443,11 +464,33 @@ static ssize_t set_als(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static ssize_t set_postcode(struct device *dev, struct device_attribute *attr,
+		       const char *buf, size_t count)
+{
+	int ret;
+	u32 tmp;
+	long unsigned int tmp2;
+
+	ret = kstrtoul(buf, 10, &tmp2);
+	if (ret || tmp2 != 1)
+		return -EINVAL;
+
+	/* Clear the POST error code. It is kept until until cleared. */
+	tmp = (u32) tmp2;
+	ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, 1, &tmp,
+				       sizeof(tmp), sizeof(tmp));
+	if (ret)
+		return -EINVAL;
+
+	return count;
+}
+
 static DEVICE_ATTR(display, S_IRUGO, show_display, NULL);
 static DEVICE_ATTR(hddtemp, S_IRUGO, show_hddtemp, NULL);
 static DEVICE_ATTR(als, S_IRUGO | S_IWUSR, show_als, set_als);
 static DEVICE_ATTR(dock, S_IRUGO, show_dock, NULL);
 static DEVICE_ATTR(tablet, S_IRUGO, show_tablet, NULL);
+static DEVICE_ATTR(postcode, S_IRUGO | S_IWUSR, show_postcode, set_postcode);
 
 static void hp_wmi_notify(u32 value, void *context)
 {
@@ -628,6 +671,7 @@ static void cleanup_sysfs(struct platform_device *device)
 	device_remove_file(&device->dev, &dev_attr_als);
 	device_remove_file(&device->dev, &dev_attr_dock);
 	device_remove_file(&device->dev, &dev_attr_tablet);
+	device_remove_file(&device->dev, &dev_attr_postcode);
 }
 
 static int hp_wmi_rfkill_setup(struct platform_device *device)
@@ -845,6 +889,9 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 	err = device_create_file(&device->dev, &dev_attr_tablet);
 	if (err)
 		goto add_sysfs_error;
+	err = device_create_file(&device->dev, &dev_attr_postcode);
+	if (err)
+		goto add_sysfs_error;
 	return 0;
 
 add_sysfs_error:
-- 
1.7.9.5
