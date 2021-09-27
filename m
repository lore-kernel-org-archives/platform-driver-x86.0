Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498E9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 21:06:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22FEB60FF2
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 21:06:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237040AbhI0VIO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 17:08:14 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:37309 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230046AbhI0VIO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 17:08:14 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 09481320051E;
        Mon, 27 Sep 2021 17:06:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 27 Sep 2021 17:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=JzgrcBZ0f6zcWcGGBJnvmvMGm8SDDUs/IfEjiRGP1wc=; b=Xl9VzFN8
        D2t8wOtzQQmISnKnvbblk6EBAqdhulkuY5uPqE+eHwmQlmhpdiVt/5wGNCbfmYFS
        meVTVE6rmuh0Zj9OWd8j6s+skt/Z/zJVSYZP4FDQwlTKiGp5ekkaQy9xcrSr7VWj
        7t9Qmulr4Ex+mE/XXpAyMJhgYJU4VBV2Y7fQss9bmmMzVUf8J/TxUENmv55ACIkg
        p8DmvT4cg7WvNc8yesPE8VrvWW/i3imaELwhnVw1ylyKHl7QplEFiI3b0GNQPpeu
        zLNpRh1upO64ppk1lBsrvzfp37hS9ed1H8ANyAslh+B/AH868KWfO5lUTj8rbjWF
        6oOoJ2KwMagpgg==
X-ME-Sender: <xms:WzJSYTTX8AXxKxnEXrWyy8poW0EY5M1klGARffpVQsSZ-MrL-G6QHQ>
    <xme:WzJSYUx1yqyWwEaWUSr1U-qhjpGAUR1U7lz4sC12vv3O6-vuZ9-uN9uSNI0o-0LWo
    Te4aLhVwkmjAPByEg>
X-ME-Received: <xmr:WzJSYY2RBnlaZJGomCi6pLLTTS7zSjZhshuWw6_HD1T6R4jsWH5W_vbfqEg5COyW4OE5gZpyWqd99oK3-8ugcPna6nqZVPKfVJT66ZM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgu
    sehshihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepieefledvgfeuieetfe
    ehgefhieduleelffegteekjeduuefgkeeuheekhfehffdtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvg
    hmjeeirdgtohhm
X-ME-Proxy: <xmx:WzJSYTATcCcu0keAesSDCPfOHEtDsrjyUk8L1YtJ9QKsWkPIJTfx0A>
    <xmx:WzJSYcgPeQhxLAhXscrSYIeOAf08UGf50QhlAhnYx-9erfjjBZbKXg>
    <xmx:WzJSYXoEAN2V4j_u0z70g9z-97vf7gGK_05hEeCNbIhK7M0ucfpUrg>
    <xmx:WzJSYUJz7XL6czVmZLTRHSgMNCvfPpEhu4J-H1u6fbie6xfd7nN1HQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 17:06:35 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH 3/3] platform/x86: system76_acpi: Add battery charging thresholds
Date:   Mon, 27 Sep 2021 15:06:29 -0600
Message-Id: <20210927210629.37966-4-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210927210629.37966-1-tcrawford@system76.com>
References: <20210927210629.37966-1-tcrawford@system76.com>
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
 drivers/platform/x86/system76_acpi.c | 153 +++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index 06f6509980e2..b42c4a384ba9 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -18,8 +18,11 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/pci_ids.h>
+#include <linux/power_supply.h>
 #include <linux/types.h>
 
+#include <acpi/battery.h>
+
 struct system76_data {
 	struct acpi_device *acpi_dev;
 	struct led_classdev ap_led;
@@ -144,6 +147,151 @@ static int system76_set(struct system76_data *data, char *method, int value)
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
+	return sprintf(buf, "%d\n", (int)ret);
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
+static ssize_t charge_control_start_threshold_show(
+	struct device *dev,
+	struct device_attribute *attr,
+	char *buf)
+{
+	return battery_get_threshold(THRESHOLD_START, buf);
+}
+
+static ssize_t charge_control_start_threshold_store(
+	struct device *dev,
+	struct device_attribute *attr,
+	const char *buf,
+	size_t count)
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
+static int system76_battery_add(struct power_supply *battery)
+{
+	// System76 EC only supports 1 battery
+	if (strcmp(battery->desc->name, "BAT0") != 0)
+		return -ENODEV;
+
+	device_create_file(&battery->dev, &dev_attr_charge_control_start_threshold);
+	device_create_file(&battery->dev, &dev_attr_charge_control_end_threshold);
+	return 0;
+}
+
+static int system76_battery_remove(struct power_supply *battery)
+{
+	device_remove_file(&battery->dev, &dev_attr_charge_control_start_threshold);
+	device_remove_file(&battery->dev, &dev_attr_charge_control_end_threshold);
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
@@ -545,6 +693,8 @@ static int system76_add(struct acpi_device *acpi_dev)
 		return err;
 	}
 
+	system76_battery_init();
+
 	return 0;
 }
 
@@ -554,6 +704,9 @@ static int system76_remove(struct acpi_device *acpi_dev)
 	struct system76_data *data;
 
 	data = acpi_driver_data(acpi_dev);
+
+	system76_battery_exit();
+
 	if (data->kb_color >= 0)
 		device_remove_file(data->kb_led.dev, &kb_led_color_dev_attr);
 
-- 
2.31.1

