Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B85C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 20:22:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B25761139
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 20:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239496AbhJFUYC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Oct 2021 16:24:02 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:35473 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239377AbhJFUYB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Oct 2021 16:24:01 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 9A5C33200B7A;
        Wed,  6 Oct 2021 16:22:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 06 Oct 2021 16:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=ySD87VqAaf5Lzt1oVGDiJYDPFFIZN3YL5i48Lm9289w=; b=SEiVfYOZ
        NM5R30m9ojJyZ4hNbxLctyBANk7Hueeh0WXv5wCJs1OzjeGs8GC45rRNJf/Pdeks
        apGgBCHvBVm9u+Ir1pp6163zQ72iNQGv7swyKn4jgV7WMqo6hgrijq+Ih17KGU6X
        eF8a5527SXFa+7OEs1V0tPOqQdWnT12yXcQ4Jh0o5pjW2RyJlaRqmyO6JUA/Yqw+
        2RYpk/eBBqdi30lDKYHWkjPnfo4+N4naJZm/oZWqfboPu0uP0lxR3aO3oniKDKd8
        ZVktWYhke6oB17l9fssN7rffk3rNYtkU1qNCT/gdPMFMh2NCtNL2+9lPdPgdaS0Q
        U4vcbwQyOSNvcg==
X-ME-Sender: <xms:cAVeYZ572p9EP483dyMVtyFdqMOXdPAj4IS7VDPsVHCbuxldwXjrLg>
    <xme:cAVeYW6ytJyz7eA0BOjjKyO947ztURPJSrz_89Zvk2af9jq54wI3ibK-VB1E8WnD_
    aTMOpXj5kpl1_5S4g>
X-ME-Received: <xmr:cAVeYQclB-odRM1-md6ED9gDyKiXRzxuZp-vDBrCVmNG99rsRx83Vlz4DIykX_DzNYnFXWk4FJC-6v_Xyq5d6he9oHCWHeDHtmVjd1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeliedgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgu
    sehshihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepieefledvgfeuieetfe
    ehgefhieduleelffegteekjeduuefgkeeuheekhfehffdtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvg
    hmjeeirdgtohhm
X-ME-Proxy: <xmx:cAVeYSJ6polhD2s1o3k_ZwGIbN9J6vPY87AIicUM0Dl_NEle4IM6VA>
    <xmx:cAVeYdJQOH0ujQYr5Hmp_3Z-iOZ6vFbR19U5Q1sjSC9GTFEAVu_-bA>
    <xmx:cAVeYbyxFQjvZ1jk0qSMb9hYJ3wv1x-5WUP54uZdg8ju5DN3cLW1ZA>
    <xmx:cAVeYfw7O3aQBV9xq4Ioesbg5X-S-oek8YThdtlpO4wY-WXt7RfkQQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Oct 2021 16:22:07 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH v4 3/4] platform/x86: system76_acpi: Add battery charging thresholds
Date:   Wed,  6 Oct 2021 14:22:01 -0600
Message-Id: <20211006202202.7479-4-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006202202.7479-1-tcrawford@system76.com>
References: <20211006202202.7479-1-tcrawford@system76.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

System76 laptops running open source EC firmware support configuring
charging thresholds through ACPI methods. Expose this functionality
through the standard sysfs entries charge_control_{start,end}_threshold.

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 drivers/platform/x86/system76_acpi.c | 157 +++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index 9e525b51a267..70d0490e23f5 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -18,8 +18,12 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/pci_ids.h>
+#include <linux/power_supply.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 
+#include <acpi/battery.h>
+
 struct system76_data {
 	struct acpi_device *acpi_dev;
 	struct led_classdev ap_led;
@@ -143,6 +147,154 @@ static int system76_set(struct system76_data *data, char *method, int value)
 		return -1;
 }
 
+#define BATTERY_THRESHOLD_INVALID	0xFF
+
+enum {
+	THRESHOLD_START,
+	THRESHOLD_END,
+};
+
+static ssize_t battery_get_threshold(int which, char *buf)
+{
+	struct acpi_object_list input;
+	union acpi_object param;
+	acpi_handle handle;
+	acpi_status status;
+	unsigned long long ret = BATTERY_THRESHOLD_INVALID;
+
+	handle = ec_get_handle();
+	if (!handle)
+		return -ENODEV;
+
+	input.count = 1;
+	input.pointer = &param;
+	// Start/stop selection
+	param.type = ACPI_TYPE_INTEGER;
+	param.integer.value = which;
+
+	status = acpi_evaluate_integer(handle, "GBCT", &input, &ret);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	if (ret == BATTERY_THRESHOLD_INVALID)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%d\n", (int)ret);
+}
+
+static ssize_t battery_set_threshold(int which, const char *buf, size_t count)
+{
+	struct acpi_object_list input;
+	union acpi_object params[2];
+	acpi_handle handle;
+	acpi_status status;
+	unsigned int value;
+	int ret;
+
+	handle = ec_get_handle();
+	if (!handle)
+		return -ENODEV;
+
+	ret = kstrtouint(buf, 10, &value);
+	if (ret)
+		return ret;
+
+	if (value > 100)
+		return -EINVAL;
+
+	input.count = 2;
+	input.pointer = params;
+	// Start/stop selection
+	params[0].type = ACPI_TYPE_INTEGER;
+	params[0].integer.value = which;
+	// Threshold value
+	params[1].type = ACPI_TYPE_INTEGER;
+	params[1].integer.value = value;
+
+	status = acpi_evaluate_object(handle, "SBCT", &input, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t charge_control_start_threshold_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	return battery_get_threshold(THRESHOLD_START, buf);
+}
+
+static ssize_t charge_control_start_threshold_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count)
+{
+	return battery_set_threshold(THRESHOLD_START, buf, count);
+}
+
+static DEVICE_ATTR_RW(charge_control_start_threshold);
+
+static ssize_t charge_control_end_threshold_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	return battery_get_threshold(THRESHOLD_END, buf);
+}
+
+static ssize_t charge_control_end_threshold_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count)
+{
+	return battery_set_threshold(THRESHOLD_END, buf, count);
+}
+
+static DEVICE_ATTR_RW(charge_control_end_threshold);
+
+static struct attribute *system76_battery_attrs[] = {
+	&dev_attr_charge_control_start_threshold.attr,
+	&dev_attr_charge_control_end_threshold.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(system76_battery);
+
+static int system76_battery_add(struct power_supply *battery)
+{
+	// System76 EC only supports 1 battery
+	if (strcmp(battery->desc->name, "BAT0") != 0)
+		return -ENODEV;
+
+	if (device_add_groups(&battery->dev, system76_battery_groups))
+		return -ENODEV;
+
+	return 0;
+}
+
+static int system76_battery_remove(struct power_supply *battery)
+{
+	device_remove_groups(&battery->dev, system76_battery_groups);
+	return 0;
+}
+
+static struct acpi_battery_hook system76_battery_hook = {
+	.add_battery = system76_battery_add,
+	.remove_battery = system76_battery_remove,
+	.name = "System76 Battery Extension",
+};
+
+static void system76_battery_init(void)
+{
+	acpi_handle handle;
+
+	handle = ec_get_handle();
+	if (handle && acpi_has_method(handle, "GBCT"))
+		battery_hook_register(&system76_battery_hook);
+}
+
+static void system76_battery_exit(void)
+{
+	acpi_handle handle;
+
+	handle = ec_get_handle();
+	if (handle && acpi_has_method(handle, "GBCT"))
+		battery_hook_unregister(&system76_battery_hook);
+}
+
 // Get the airplane mode LED brightness
 static enum led_brightness ap_led_get(struct led_classdev *led)
 {
@@ -581,6 +733,8 @@ static int system76_add(struct acpi_device *acpi_dev)
 	if (err)
 		goto error;
 
+	system76_battery_init();
+
 	return 0;
 
 error:
@@ -596,6 +750,9 @@ static int system76_remove(struct acpi_device *acpi_dev)
 	struct system76_data *data;
 
 	data = acpi_driver_data(acpi_dev);
+
+	system76_battery_exit();
+
 	if (data->kb_color >= 0)
 		device_remove_file(data->kb_led.dev, &kb_led_color_dev_attr);
 
-- 
2.31.1

