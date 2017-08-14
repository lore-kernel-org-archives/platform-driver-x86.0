From: Hao Wei Tee <angelsl@in04.sg>
Subject: [PATCH v2] platform/x86: ideapad-laptop: Expose conservation mode
 switch
Date: Mon, 14 Aug 2017 22:17:44 +0800
Message-ID: <cd64f959-5fa0-50e2-183a-70c28aa121d9@in04.sg>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f42.google.com ([74.125.83.42]:34515 "EHLO
        mail-pg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751098AbdHNOS2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2017 10:18:28 -0400
Received: by mail-pg0-f42.google.com with SMTP id u185so48014264pgb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2017 07:18:28 -0700 (PDT)
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>

This exposes the battery conservation mode present on some (?) IdeaPads.
The mode is set by calling ACPI method SBMC with argument 3 (on) or
5 (off). Status is reported in bit 5 of the return value of ACPI method
GBMD.

Signed-off-by: Hao Wei Tee <angelsl@in04.sg>
---
 drivers/platform/x86/ideapad-laptop.c | 70 +++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 603fc6050971..fffc7f65072e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -42,6 +42,8 @@
 
 #define IDEAPAD_RFKILL_DEV_NUM	(3)
 
+#define GBMD_CONSERVATION_BIT (5)
+
 #define CFG_BT_BIT	(16)
 #define CFG_3G_BIT	(17)
 #define CFG_WIFI_BIT	(18)
@@ -54,6 +56,11 @@ static const char *const ideapad_wmi_fnesc_events[] = {
 };
 #endif
 
+enum {
+	SBMC_CONSERVATION_ON = 3,
+	SBMC_CONSERVATION_OFF = 5,
+};
+
 enum {
 	VPCCMD_R_VPC1 = 0x10,
 	VPCCMD_R_BL_MAX,
@@ -123,6 +130,23 @@ static int read_method_int(acpi_handle handle, const char *method, int *val)
 	}
 }
 
+static int method_gbmd(acpi_handle handle, unsigned long *ret)
+{
+	int val;
+	int result = read_method_int(handle, "GBMD", &val);
+
+	*ret = val;
+	return result;
+}
+
+static int method_sbmc(acpi_handle handle, int cmd)
+{
+	acpi_status status;
+
+	status = acpi_execute_simple_method(handle, "SBMC", cmd);
+	return ACPI_FAILURE(status) ? -1 : 0;
+}
+
 static int method_vpcr(acpi_handle handle, int cmd, int *ret)
 {
 	acpi_status status;
@@ -250,6 +274,13 @@ static int debugfs_status_show(struct seq_file *s, void *data)
 	if (!read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &value))
 		seq_printf(s, "Camera status:\t%s(%lu)\n",
 			   value ? "On" : "Off", value);
+	seq_puts(s, "=====================\n");
+
+	if (!method_gbmd(priv->adev->handle, &value)) {
+		seq_printf(s, "Conservation mode:\t%s(%lu)\n",
+			   test_bit(GBMD_CONSERVATION_BIT, &value) ? "On" : "Off",
+			   value);
+	}
 
 	return 0;
 }
@@ -456,10 +487,46 @@ static ssize_t __maybe_unused touchpad_store(struct device *dev,
 
 static DEVICE_ATTR_RO(touchpad);
 
+static ssize_t show_ideapad_conservation(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	unsigned long result;
+	struct ideapad_private *priv = dev_get_drvdata(dev);
+
+	if (method_gbmd(priv->adev->handle, &result))
+		return sprintf(buf, "-1\n");
+	return sprintf(buf, "%u\n", test_bit(GBMD_CONSERVATION_BIT, &result));
+}
+
+static ssize_t store_ideapad_conservation(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	int ret;
+	bool state;
+	struct ideapad_private *priv = dev_get_drvdata(dev);
+
+	ret = kstrtobool(buf, &state);
+	if (ret)
+		return ret;
+
+	ret = method_sbmc(priv->adev->handle, state ?
+					      SBMC_CONSERVATION_ON :
+					      SBMC_CONSERVATION_OFF);
+	if (ret < 0)
+		return -EIO;
+	return count;
+}
+
+static DEVICE_ATTR(conservation_mode, 0644, show_ideapad_conservation,
+					    store_ideapad_conservation);
+
 static struct attribute *ideapad_attributes[] = {
 	&dev_attr_camera_power.attr,
 	&dev_attr_fan_mode.attr,
 	&dev_attr_touchpad.attr,
+	&dev_attr_conservation_mode.attr,
 	NULL
 };
 
@@ -477,6 +544,9 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 		unsigned long value;
 		supported = !read_ec_data(priv->adev->handle, VPCCMD_R_FAN,
 					  &value);
+	} else if (attr == &dev_attr_conservation_mode.attr) {
+		supported = acpi_has_method(priv->adev->handle, "GBMD") &&
+			    acpi_has_method(priv->adev->handle, "SBMC");
 	} else
 		supported = true;
 
-- 
2.14.1
