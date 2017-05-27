From: Hao Wei Tee <angelsl@angelsl.xyz>
Subject: [PATCH] platform/x86: ideapad-laptop: Expose conservation mode switch
Date: Sat, 27 May 2017 15:31:22 +0800
Message-ID: <b667a2be-8021-93a0-d87a-e6fa6b2aa633@angelsl.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

This exposes the battery conservation mode present on some (?) IdeaPads.
The mode is set by calling ACPI method SBMC with argument 3 (on) or
5 (off). Status is reported in bit 5 of the return value of ACPI method
GBMD.

This patch was written based on an IdeaPad U430p. I'm not sure if the ACPI
methods are the same across all IdeaPads, so it would be great if this got more
testing across other models before it's merged.

Signed-off-by: Hao Wei Tee <angelsl@angelsl.xyz>
---
 drivers/platform/x86/ideapad-laptop.c | 70 +++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index d48962569364..3798a1ab1604 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -42,6 +42,7 @@
 
 #define IDEAPAD_RFKILL_DEV_NUM	(3)
 
+#define GBMD_CONSERVATION_BIT (5)
 #define CFG_BT_BIT	(16)
 #define CFG_3G_BIT	(17)
 #define CFG_WIFI_BIT	(18)
@@ -55,6 +56,8 @@ static const char *const ideapad_wmi_fnesc_events[] = {
 #endif
 
 enum {
+	VPCCMD_CONSERVATION_ON = 3,
+	VPCCMD_CONSERVATION_OFF = 5,
 	VPCCMD_R_VPC1 = 0x10,
 	VPCCMD_R_BL_MAX,
 	VPCCMD_R_BL,
@@ -123,6 +126,27 @@ static int read_method_int(acpi_handle handle, const char *method, int *val)
 	}
 }
 
+static int conservation_mode_status(acpi_handle handle, bool *ret)
+{
+	acpi_status status;
+	unsigned long long result;
+
+	status = acpi_evaluate_integer(handle, "GBMD", NULL, &result);
+	if (ACPI_FAILURE(status))
+		return -1;
+
+	*ret = (result & (1 << GBMD_CONSERVATION_BIT)) != 0;
+	return 0;
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
@@ -218,6 +242,7 @@ static int debugfs_status_show(struct seq_file *s, void *data)
 {
 	struct ideapad_private *priv = s->private;
 	unsigned long value;
+	bool boolval;
 
 	if (!priv)
 		return -EINVAL;
@@ -250,6 +275,12 @@ static int debugfs_status_show(struct seq_file *s, void *data)
 	if (!read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &value))
 		seq_printf(s, "Camera status:\t%s(%lu)\n",
 			   value ? "On" : "Off", value);
+	seq_puts(s, "=====================\n");
+
+	if (!conservation_mode_status(priv->adev->handle, &boolval)) {
+		seq_printf(s, "Conservation mode:\t%s(%u)\n",
+			   boolval ? "On" : "Off", boolval);
+	}
 
 	return 0;
 }
@@ -456,10 +487,46 @@ static ssize_t __maybe_unused touchpad_store(struct device *dev,
 
 static DEVICE_ATTR_RO(touchpad);
 
+static ssize_t show_ideapad_conservation(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	bool result;
+	struct ideapad_private *priv = dev_get_drvdata(dev);
+
+	if (conservation_mode_status(priv->adev->handle, &result))
+		return sprintf(buf, "-1\n");
+	return sprintf(buf, "%u\n", result);
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
+					      VPCCMD_CONSERVATION_ON :
+					      VPCCMD_CONSERVATION_OFF);
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
2.13.0
