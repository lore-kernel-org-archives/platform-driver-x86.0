From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH 4/6] msi-laptop: Add MSI Wind U90/U100 support
Date: Sun, 25 Nov 2012 00:28:59 +0200
Message-ID: <1353796141-1470-5-git-send-email-maxtram95@gmail.com>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:37842 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752502Ab2KXW3W (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 24 Nov 2012 17:29:22 -0500
Received: by mail-ee0-f46.google.com with SMTP id e53so3898085eek.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Nov 2012 14:29:21 -0800 (PST)
In-Reply-To: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@novell.com, mjg@redhat.com
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

Add MSI Wind U90/U100 to separate DMI table, add U90/U100 specific
workarounds and add some missing EC features support such as basic fan
control, turbo and ECO modes and touchpad state.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/platform/x86/msi-laptop.c | 199 ++++++++++++++++++++++++++++++++------
 1 file changed, 171 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 3b6f494..16e9863 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -82,8 +82,19 @@
 #define MSI_STANDARD_EC_SCM_LOAD_ADDRESS	0x2d
 #define MSI_STANDARD_EC_SCM_LOAD_MASK		(1 << 0)
 
-#define MSI_STANDARD_EC_TOUCHPAD_ADDRESS	0xe4
+#define MSI_STANDARD_EC_POWER_ADDRESS		0xe4
+/* Power LED is orange - Turbo mode */
+#define MSI_STANDARD_EC_TURBO_MASK		(1 << 1)
+/* Power LED is green - ECO mode */
+#define MSI_STANDARD_EC_ECO_MASK		(1 << 3)
+/* Touchpad is turned on */
 #define MSI_STANDARD_EC_TOUCHPAD_MASK		(1 << 4)
+/* If this bit != bit 1, turbo mode can't be toggled */
+#define MSI_STANDARD_EC_TURBO_COOLDOWN_MASK	(1 << 7)
+
+#define MSI_STANDARD_EC_FAN_ADDRESS		0x33
+/* If zero, fan rotates at maximal speed */
+#define MSI_STANDARD_EC_AUTOFAN_MASK		(1 << 0)
 
 #ifdef CONFIG_PM_SLEEP
 static int msi_laptop_resume(struct device *device);
@@ -123,6 +134,13 @@ static int threeg_exists;
  * e.g. MSI N034 netbook
  */
 static bool load_scm_model;
+
+/* Some MSI Wind netbooks (e.g. MSI Wind U100) need loading SCM to get some
+ * features working (e.g. ECO mode), but we cannot change Wlan/Bluetooth state
+ * in software and we can only read its state.
+ */
+static bool ec_read_only;
+
 static struct rfkill *rfk_wlan, *rfk_bluetooth, *rfk_threeg;
 
 /* Hardware access */
@@ -195,6 +213,9 @@ static ssize_t set_device_state(const char *buf, size_t count, u8 mask)
 	if (sscanf(buf, "%i", &status) != 1 || (status < 0 || status > 1))
 		return -EINVAL;
 
+	if (ec_read_only)
+		return -EOPNOTSUPP;
+
 	/* read current device state */
 	result = ec_read(MSI_STANDARD_EC_COMMAND_ADDRESS, &rdata);
 	if (result < 0)
@@ -417,18 +438,115 @@ static ssize_t store_auto_brightness(struct device *dev,
 	return count;
 }
 
+static ssize_t show_touchpad(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+
+	u8 rdata;
+	int result;
+
+	result = ec_read(MSI_STANDARD_EC_POWER_ADDRESS, &rdata);
+	if (result < 0)
+		return result;
+
+	return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_TOUCHPAD_MASK));
+}
+
+static ssize_t show_turbo(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+
+	u8 rdata;
+	int result;
+
+	result = ec_read(MSI_STANDARD_EC_POWER_ADDRESS, &rdata);
+	if (result < 0)
+		return result;
+
+	return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_TURBO_MASK));
+}
+
+static ssize_t show_eco(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+
+	u8 rdata;
+	int result;
+
+	result = ec_read(MSI_STANDARD_EC_POWER_ADDRESS, &rdata);
+	if (result < 0)
+		return result;
+
+	return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_ECO_MASK));
+}
+
+static ssize_t show_turbo_cooldown(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+
+	u8 rdata;
+	int result;
+
+	result = ec_read(MSI_STANDARD_EC_POWER_ADDRESS, &rdata);
+	if (result < 0)
+		return result;
+
+	return sprintf(buf, "%i\n", (!!(rdata & MSI_STANDARD_EC_TURBO_MASK)) |
+		(!!(rdata & MSI_STANDARD_EC_TURBO_COOLDOWN_MASK) << 1));
+}
+
+static ssize_t show_auto_fan(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+
+	u8 rdata;
+	int result;
+
+	result = ec_read(MSI_STANDARD_EC_FAN_ADDRESS, &rdata);
+	if (result < 0)
+		return result;
+
+	return sprintf(buf, "%i\n", !!(rdata & MSI_STANDARD_EC_AUTOFAN_MASK));
+}
+
+static ssize_t store_auto_fan(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count)
+{
+
+	int enable, result;
+
+	if (sscanf(buf, "%i", &enable) != 1 || (enable != (enable & 1)))
+		return -EINVAL;
+
+	result = ec_write(MSI_STANDARD_EC_FAN_ADDRESS, enable);
+	if (result < 0)
+		return result;
+
+	return count;
+}
+
 static DEVICE_ATTR(lcd_level, 0644, show_lcd_level, store_lcd_level);
 static DEVICE_ATTR(auto_brightness, 0644, show_auto_brightness,
 		   store_auto_brightness);
 static DEVICE_ATTR(bluetooth, 0444, show_bluetooth, NULL);
 static DEVICE_ATTR(wlan, 0444, show_wlan, NULL);
 static DEVICE_ATTR(threeg, 0444, show_threeg, NULL);
+static DEVICE_ATTR(touchpad, 0444, show_touchpad, NULL);
+static DEVICE_ATTR(turbo_mode, 0444, show_turbo, NULL);
+static DEVICE_ATTR(eco_mode, 0444, show_eco, NULL);
+static DEVICE_ATTR(turbo_cooldown, 0444, show_turbo_cooldown, NULL);
+static DEVICE_ATTR(auto_fan, 0644, show_auto_fan, store_auto_fan);
 
 static struct attribute *msipf_attributes[] = {
 	&dev_attr_lcd_level.attr,
 	&dev_attr_auto_brightness.attr,
 	&dev_attr_bluetooth.attr,
 	&dev_attr_wlan.attr,
+	&dev_attr_touchpad.attr,
+	&dev_attr_turbo_mode.attr,
+	&dev_attr_eco_mode.attr,
+	&dev_attr_turbo_cooldown.attr,
+	&dev_attr_auto_fan.attr,
 	NULL
 };
 
@@ -553,6 +671,19 @@ static struct dmi_system_id __initdata msi_load_scm_models_dmi_table[] = {
 	{ }
 };
 
+static struct dmi_system_id __initdata msi_load_scm_ro_models_dmi_table[] = {
+	{
+		.ident = "MSI U90/U100",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+				"MICRO-STAR INTERNATIONAL CO., LTD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "U90/U100"),
+		},
+		.callback = dmi_check_cb
+	},
+	{ }
+};
+
 static int rfkill_bluetooth_set(void *data, bool blocked)
 {
 	/* Do something with blocked...*/
@@ -560,32 +691,26 @@ static int rfkill_bluetooth_set(void *data, bool blocked)
 	 * blocked == false is on
 	 * blocked == true is off
 	 */
-	if (blocked)
-		set_device_state("0", 0, MSI_STANDARD_EC_BLUETOOTH_MASK);
-	else
-		set_device_state("1", 0, MSI_STANDARD_EC_BLUETOOTH_MASK);
+	int result = set_device_state(blocked ? "0" : "1", 0,
+		MSI_STANDARD_EC_BLUETOOTH_MASK);
 
-	return 0;
+	return result < 0 ? result : 0;
 }
 
 static int rfkill_wlan_set(void *data, bool blocked)
 {
-	if (blocked)
-		set_device_state("0", 0, MSI_STANDARD_EC_WLAN_MASK);
-	else
-		set_device_state("1", 0, MSI_STANDARD_EC_WLAN_MASK);
+	int result = set_device_state(blocked ? "0" : "1", 0,
+		MSI_STANDARD_EC_WLAN_MASK);
 
-	return 0;
+	return result < 0 ? result : 0;
 }
 
 static int rfkill_threeg_set(void *data, bool blocked)
 {
-	if (blocked)
-		set_device_state("0", 0, MSI_STANDARD_EC_3G_MASK);
-	else
-		set_device_state("1", 0, MSI_STANDARD_EC_3G_MASK);
+	int result = set_device_state(blocked ? "0" : "1", 0,
+		MSI_STANDARD_EC_3G_MASK);
 
-	return 0;
+	return result < 0 ? result : 0;
 }
 
 static const struct rfkill_ops rfkill_bluetooth_ops = {
@@ -600,16 +725,24 @@ static const struct rfkill_ops rfkill_threeg_ops = {
 	.set_block = rfkill_threeg_set
 };
 
+static bool msi_rfkill_set_state(struct rfkill *rfkill, bool blocked)
+{
+	if (ec_read_only)
+		return rfkill_set_hw_state(rfkill, blocked);
+	else
+		return rfkill_set_sw_state(rfkill, blocked);
+}
+
 static void msi_update_rfkill(struct work_struct *ignored)
 {
 	get_wireless_state_ec_standard();
 
 	if (rfk_wlan)
-		rfkill_set_sw_state(rfk_wlan, !wlan_s);
+		msi_rfkill_set_state(rfk_wlan, !wlan_s);
 	if (rfk_bluetooth)
-		rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
+		msi_rfkill_set_state(rfk_bluetooth, !bluetooth_s);
 	if (rfk_threeg)
-		rfkill_set_sw_state(rfk_threeg, !threeg_s);
+		msi_rfkill_set_state(rfk_threeg, !threeg_s);
 }
 static DECLARE_WORK(msi_rfkill_work, msi_update_rfkill);
 
@@ -638,7 +771,7 @@ static void msi_send_touchpad_key(struct work_struct *ignored)
 	u8 rdata;
 	int result;
 
-	result = ec_read(MSI_STANDARD_EC_TOUCHPAD_ADDRESS, &rdata);
+	result = ec_read(MSI_STANDARD_EC_POWER_ADDRESS, &rdata);
 	if (result < 0)
 		return;
 
@@ -802,13 +935,15 @@ static int __init load_scm_model_init(struct platform_device *sdev)
 	u8 data;
 	int result;
 
-	/* allow userland write sysfs file  */
-	dev_attr_bluetooth.store = store_bluetooth;
-	dev_attr_wlan.store = store_wlan;
-	dev_attr_threeg.store = store_threeg;
-	dev_attr_bluetooth.attr.mode |= S_IWUSR;
-	dev_attr_wlan.attr.mode |= S_IWUSR;
-	dev_attr_threeg.attr.mode |= S_IWUSR;
+	if (!ec_read_only) {
+		/* allow userland write sysfs file  */
+		dev_attr_bluetooth.store = store_bluetooth;
+		dev_attr_wlan.store = store_wlan;
+		dev_attr_threeg.store = store_threeg;
+		dev_attr_bluetooth.attr.mode |= S_IWUSR;
+		dev_attr_wlan.attr.mode |= S_IWUSR;
+		dev_attr_threeg.attr.mode |= S_IWUSR;
+	}
 
 	/* disable hardware control by fn key */
 	result = ec_read(MSI_STANDARD_EC_SCM_LOAD_ADDRESS, &data);
@@ -860,8 +995,15 @@ static int __init msi_init(void)
 	if (force || dmi_check_system(msi_dmi_table))
 		old_ec_model = 1;
 
-	if (!old_ec_model)
+	if (!old_ec_model) {
 		get_threeg_exists();
+		if (dmi_check_system(msi_load_scm_models_dmi_table))
+			load_scm_model = 1;
+		else if (dmi_check_system(msi_load_scm_ro_models_dmi_table)) {
+			load_scm_model = 1;
+			ec_read_only = 1;
+		}
+	}
 
 	if (!old_ec_model && dmi_check_system(msi_load_scm_models_dmi_table))
 		load_scm_model = 1;
@@ -992,3 +1134,4 @@ MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N051:*");
 MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N014:*");
 MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnCR620:*");
 MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnU270series:*");
+MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnU90/U100:*");
-- 
1.8.0
