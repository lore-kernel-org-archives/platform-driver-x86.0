From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH 3/4] Add support for deep sleep control.
Date: Thu, 21 Jan 2016 18:04:59 -0600
Message-ID: <1453421100-12984-4-git-send-email-mario_limonciello@dell.com>
References: <1453421100-12984-1-git-send-email-mario_limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453421100-12984-1-git-send-email-mario_limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

This allows configuration the system for wakeup with a controller.

Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
---
 drivers/platform/x86/alienware-wmi.c | 103 ++++++++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index e6f6322..e66c34d 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -1,7 +1,7 @@
 /*
  * Alienware AlienFX control
  *
- * Copyright (C) 2014 Dell Inc <mario_limonciello@dell.com>
+ * Copyright (C) 2014-2016 Dell Inc <mario_limonciello@dell.com>
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -34,6 +34,8 @@
 #define WMAX_METHOD_ZONE_CONTROL	0x4
 #define WMAX_METHOD_HDMI_CABLE		0x5
 #define WMAX_METHOD_AMPLIFIER_CABLE	0x6
+#define WMAX_METHOD_DEEP_SLEEP_CONTROL	0x0B
+#define WMAX_METHOD_DEEP_SLEEP_STATUS	0x0C
 
 MODULE_AUTHOR("Mario Limonciello <mario_limonciello@dell.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
@@ -62,6 +64,7 @@ struct quirk_entry {
 	u8 num_zones;
 	u8 hdmi_mux;
 	u8 amplifier;
+	u8 deepslp;
 };
 
 static struct quirk_entry *quirks;
@@ -70,24 +73,28 @@ static struct quirk_entry quirk_unknown = {
 	.num_zones = 2,
 	.hdmi_mux = 0,
 	.amplifier = 0,
+	.deepslp = 0,
 };
 
 static struct quirk_entry quirk_x51_r1_r2 = {
 	.num_zones = 3,
 	.hdmi_mux = 0,
 	.amplifier = 0,
+	.deepslp = 0,
 };
 
 static struct quirk_entry quirk_x51_r3 = {
 	.num_zones = 4,
 	.hdmi_mux = 0,
 	.amplifier = 1,
+	.deepslp = 0,
 };
 
 static struct quirk_entry quirk_asm100 = {
 	.num_zones = 2,
 	.hdmi_mux = 1,
 	.amplifier = 0,
+	.deepslp = 0,
 };
 
 static int __init dmi_matched(const struct dmi_system_id *dmi)
@@ -650,6 +657,93 @@ error_create_amplifier:
 	return ret;
 }
 
+/* Deep Sleep Control support
+ * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
+*/
+static ssize_t show_deepsleep_status(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	acpi_status status;
+	u32 out_data;
+	struct wmax_basic_args in_args = {
+		.arg = 0,
+	};
+	status =
+	    alienware_wmax_command(&in_args, WMAX_METHOD_DEEP_SLEEP_STATUS,
+				   (u32 *) &out_data);
+	if (ACPI_SUCCESS(status)) {
+		if (out_data == 0)
+			return scnprintf(buf, PAGE_SIZE,
+					 "[disabled] s5 s5_s4\n");
+		else if (out_data == 1)
+			return scnprintf(buf, PAGE_SIZE,
+					 "disabled [s5] s5_s4\n");
+		else if (out_data == 2)
+			return scnprintf(buf, PAGE_SIZE,
+					 "disabled s5 [s5_s4]\n");
+	}
+	pr_err("alienware-wmi: unknown deep sleep status: %d\n", status);
+	return scnprintf(buf, PAGE_SIZE, "disabled s5 s5_s4 [unknown]\n");
+}
+
+static ssize_t toggle_deepsleep(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	acpi_status status;
+	struct wmax_basic_args args;
+
+	if (strcmp(buf, "disabled\n") == 0)
+		args.arg = 0;
+	else if (strcmp(buf, "s5\n") == 0)
+		args.arg = 1;
+	else
+		args.arg = 2;
+	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
+
+	status =
+	    alienware_wmax_command(&args, WMAX_METHOD_DEEP_SLEEP_CONTROL, NULL);
+
+	if (ACPI_FAILURE(status))
+		pr_err
+		    ("alienware-wmi: deep sleep control failed: results: %u\n",
+		     status);
+	return count;
+}
+
+static DEVICE_ATTR(deepsleep, S_IRUGO | S_IWUSR, show_deepsleep_status,
+		   toggle_deepsleep);
+
+static struct attribute *deepsleep_attrs[] = {
+	&dev_attr_deepsleep.attr,
+	NULL,
+};
+
+static struct attribute_group deepsleep_attribute_group = {
+	.name = "deepsleep",
+	.attrs = deepsleep_attrs,
+};
+
+static void remove_deepsleep(struct platform_device *dev)
+{
+	if (quirks->deepslp > 0)
+		sysfs_remove_group(&dev->dev.kobj, &deepsleep_attribute_group);
+}
+
+static int create_deepsleep(struct platform_device *dev)
+{
+	int ret;
+
+	ret = sysfs_create_group(&dev->dev.kobj, &deepsleep_attribute_group);
+	if (ret)
+		goto error_create_deepsleep;
+	return 0;
+
+error_create_deepsleep:
+	remove_deepsleep(dev);
+	return ret;
+}
+
 static int __init alienware_wmi_init(void)
 {
 	int ret;
@@ -691,6 +785,12 @@ static int __init alienware_wmi_init(void)
 			goto fail_prep_amplifier;
 	}
 
+	if (quirks->deepslp > 0) {
+		ret = create_deepsleep(platform_device);
+		if (ret)
+			goto fail_prep_deepsleep;
+	}
+
 	ret = alienware_zone_init(platform_device);
 	if (ret)
 		goto fail_prep_zones;
@@ -699,6 +799,7 @@ static int __init alienware_wmi_init(void)
 
 fail_prep_zones:
 	alienware_zone_exit(platform_device);
+fail_prep_deepsleep:
 fail_prep_amplifier:
 fail_prep_hdmi:
 	platform_device_del(platform_device);
-- 
1.9.1
