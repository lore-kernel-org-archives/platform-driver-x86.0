From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH 2/4] Add support for alienware graphics amplifier
Date: Thu, 21 Jan 2016 18:04:58 -0600
Message-ID: <1453421100-12984-3-git-send-email-mario_limonciello@dell.com>
References: <1453421100-12984-1-git-send-email-mario_limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453421100-12984-1-git-send-email-mario_limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/alienware-wmi.c | 114 ++++++++++++++++++++++++++++-------
 1 file changed, 93 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index dcd4f81..e6f6322 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -33,6 +33,7 @@
 #define WMAX_METHOD_BRIGHTNESS		0x3
 #define WMAX_METHOD_ZONE_CONTROL	0x4
 #define WMAX_METHOD_HDMI_CABLE		0x5
+#define WMAX_METHOD_AMPLIFIER_CABLE	0x6
 
 MODULE_AUTHOR("Mario Limonciello <mario_limonciello@dell.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
@@ -60,6 +61,7 @@ enum WMAX_CONTROL_STATES {
 struct quirk_entry {
 	u8 num_zones;
 	u8 hdmi_mux;
+	u8 amplifier;
 };
 
 static struct quirk_entry *quirks;
@@ -67,21 +69,25 @@ static struct quirk_entry *quirks;
 static struct quirk_entry quirk_unknown = {
 	.num_zones = 2,
 	.hdmi_mux = 0,
+	.amplifier = 0,
 };
 
 static struct quirk_entry quirk_x51_r1_r2 = {
 	.num_zones = 3,
-	.hdmi_mux = 0.
+	.hdmi_mux = 0,
+	.amplifier = 0,
 };
 
 static struct quirk_entry quirk_x51_r3 = {
 	.num_zones = 4,
 	.hdmi_mux = 0,
+	.amplifier = 1,
 };
 
 static struct quirk_entry quirk_asm100 = {
 	.num_zones = 2,
 	.hdmi_mux = 1,
+	.amplifier = 0,
 };
 
 static int __init dmi_matched(const struct dmi_system_id *dmi)
@@ -147,7 +153,7 @@ struct wmax_brightness_args {
 	u32 percentage;
 };
 
-struct hdmi_args {
+struct wmax_basic_args {
 	u8 arg;
 };
 
@@ -232,16 +238,16 @@ static int alienware_update_led(struct platform_zone *zone)
 	char *guid;
 	struct acpi_buffer input;
 	struct legacy_led_args legacy_args;
-	struct wmax_led_args wmax_args;
+	struct wmax_led_args wmax_basic_args;
 	if (interface == WMAX) {
-		wmax_args.led_mask = 1 << zone->location;
-		wmax_args.colors = zone->colors;
-		wmax_args.state = lighting_control_state;
+		wmax_basic_args.led_mask = 1 << zone->location;
+		wmax_basic_args.colors = zone->colors;
+		wmax_basic_args.state = lighting_control_state;
 		guid = WMAX_CONTROL_GUID;
 		method_id = WMAX_METHOD_ZONE_CONTROL;
 
-		input.length = (acpi_size) sizeof(wmax_args);
-		input.pointer = &wmax_args;
+		input.length = (acpi_size) sizeof(wmax_basic_args);
+		input.pointer = &wmax_basic_args;
 	} else {
 		legacy_args.colors = zone->colors;
 		legacy_args.brightness = global_brightness;
@@ -449,11 +455,7 @@ static void alienware_zone_exit(struct platform_device *dev)
 	kfree(zone_attrs);
 }
 
-/*
-	The HDMI mux sysfs node indicates the status of the HDMI input mux.
-	It can toggle between standard system GPU output and HDMI input.
-*/
-static acpi_status alienware_hdmi_command(struct hdmi_args *in_args,
+static acpi_status alienware_wmax_command(struct wmax_basic_args *in_args,
 					  u32 command, int *out_data)
 {
 	acpi_status status;
@@ -481,17 +483,21 @@ static acpi_status alienware_hdmi_command(struct hdmi_args *in_args,
 
 }
 
+/*
+ *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
+ *	It can toggle between standard system GPU output and HDMI input.
+*/
 static ssize_t show_hdmi_cable(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	acpi_status status;
 	u32 out_data;
-	struct hdmi_args in_args = {
+	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
 	status =
-	    alienware_hdmi_command(&in_args, WMAX_METHOD_HDMI_CABLE,
-				   (u32 *) & out_data);
+	    alienware_wmax_command(&in_args, WMAX_METHOD_HDMI_CABLE,
+				   (u32 *) &out_data);
 	if (ACPI_SUCCESS(status)) {
 		if (out_data == 0)
 			return scnprintf(buf, PAGE_SIZE,
@@ -509,12 +515,12 @@ static ssize_t show_hdmi_source(struct device *dev,
 {
 	acpi_status status;
 	u32 out_data;
-	struct hdmi_args in_args = {
+	struct wmax_basic_args in_args = {
 		.arg = 0,
 	};
 	status =
-	    alienware_hdmi_command(&in_args, WMAX_METHOD_HDMI_STATUS,
-				   (u32 *) & out_data);
+	    alienware_wmax_command(&in_args, WMAX_METHOD_HDMI_STATUS,
+				   (u32 *) &out_data);
 
 	if (ACPI_SUCCESS(status)) {
 		if (out_data == 1)
@@ -533,7 +539,7 @@ static ssize_t toggle_hdmi_source(struct device *dev,
 				  const char *buf, size_t count)
 {
 	acpi_status status;
-	struct hdmi_args args;
+	struct wmax_basic_args args;
 	if (strcmp(buf, "gpu\n") == 0)
 		args.arg = 1;
 	else if (strcmp(buf, "input\n") == 0)
@@ -542,7 +548,7 @@ static ssize_t toggle_hdmi_source(struct device *dev,
 		args.arg = 3;
 	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
 
-	status = alienware_hdmi_command(&args, WMAX_METHOD_HDMI_SOURCE, NULL);
+	status = alienware_wmax_command(&args, WMAX_METHOD_HDMI_SOURCE, NULL);
 
 	if (ACPI_FAILURE(status))
 		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n",
@@ -585,6 +591,65 @@ error_create_hdmi:
 	return ret;
 }
 
+/* Alienware GFX amplifier support
+ * - Currently supports reading cable status
+ * - Leaving expansion room to possibly support dock/undock events later
+*/
+static ssize_t show_amplifier_status(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	acpi_status status;
+	u32 out_data;
+	struct wmax_basic_args in_args = {
+		.arg = 0,
+	};
+	status =
+	    alienware_wmax_command(&in_args, WMAX_METHOD_AMPLIFIER_CABLE,
+				   (u32 *) &out_data);
+	if (ACPI_SUCCESS(status)) {
+		if (out_data == 0)
+			return scnprintf(buf, PAGE_SIZE,
+					 "[unconnected] connected unknown\n");
+		else if (out_data == 1)
+			return scnprintf(buf, PAGE_SIZE,
+					 "unconnected [connected] unknown\n");
+	}
+	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", status);
+	return scnprintf(buf, PAGE_SIZE, "unconnected connected [unknown]\n");
+}
+
+static DEVICE_ATTR(status, S_IRUGO, show_amplifier_status, NULL);
+
+static struct attribute *amplifier_attrs[] = {
+	&dev_attr_status.attr,
+	NULL,
+};
+
+static struct attribute_group amplifier_attribute_group = {
+	.name = "amplifier",
+	.attrs = amplifier_attrs,
+};
+
+static void remove_amplifier(struct platform_device *dev)
+{
+	if (quirks->amplifier > 0)
+		sysfs_remove_group(&dev->dev.kobj, &amplifier_attribute_group);
+}
+
+static int create_amplifier(struct platform_device *dev)
+{
+	int ret;
+
+	ret = sysfs_create_group(&dev->dev.kobj, &amplifier_attribute_group);
+	if (ret)
+		goto error_create_amplifier;
+	return 0;
+
+error_create_amplifier:
+	remove_amplifier(dev);
+	return ret;
+}
+
 static int __init alienware_wmi_init(void)
 {
 	int ret;
@@ -620,6 +685,12 @@ static int __init alienware_wmi_init(void)
 			goto fail_prep_hdmi;
 	}
 
+	if (quirks->amplifier > 0) {
+		ret = create_amplifier(platform_device);
+		if (ret)
+			goto fail_prep_amplifier;
+	}
+
 	ret = alienware_zone_init(platform_device);
 	if (ret)
 		goto fail_prep_zones;
@@ -628,6 +699,7 @@ static int __init alienware_wmi_init(void)
 
 fail_prep_zones:
 	alienware_zone_exit(platform_device);
+fail_prep_amplifier:
 fail_prep_hdmi:
 	platform_device_del(platform_device);
 fail_platform_device2:
-- 
1.9.1
