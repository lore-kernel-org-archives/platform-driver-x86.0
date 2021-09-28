Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD11C43217
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 22:15:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A77F7613A5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 22:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243107AbhI1WRV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 18:17:21 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:48045 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243095AbhI1WRQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 18:17:16 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 3405F3201E3E;
        Tue, 28 Sep 2021 18:15:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 28 Sep 2021 18:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=ZZAV87qsnFQrFPuRkM1zBzSPPYgUf3RPBFnvfLT0bAM=; b=a6Vzq4TH
        9/+utav4aV3Gc/7w+MWa2AvHXNQGPnbav9hwYqg4/8aQvgLNr7BTp6kJqBPZCIaL
        8qCp09rVLx2/eq0C5nsZk1B1Km48dO/xxNK/mlX5rsv1sBS+6Mm+TH+KNZ1Q7ewn
        PQ7ijga7weovgCKOy0mVz939Oz2hMDiKjGNWLzyW78SbVB7R5Ie7s0Up62mmAhUW
        qO8fR5/pa9LdfyVhVyZ3zMdP2nX1A1n53I0V/WeAHWY2rNTIMeGXWA9nf/RJrM4a
        4Xner45mW4GzsOWGclq+udxhHifOqfFYjf3eeSMP9fLKUu0N/AWJFokaAU9/PzFo
        Knp/w0jd7qlRuA==
X-ME-Sender: <xms:BpRTYQe8dVcW-K5oqXa0-XXoA6o1vZRwrVapvZHrICCmtWQ9f-GlzQ>
    <xme:BpRTYSN1ebTESlE9zg44UGuGQfpJclMULIQLoQFY_Iltr1dOqWySBTtM6_cR6iRjv
    3kLZBUEMvyXtsdaqA>
X-ME-Received: <xmr:BpRTYRiqmERK56q1EgHBpCWHUvI2luoJsZTCMWaPn79BygeuEKK-R9Fyh0SEQBZbaA23vTw41TZ0aeprvF2qS3TPKiHIyWqtZcjnCuY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekuddgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepvfhimhcuvehrrgiffhhorhguuceothgtrhgrfihfohhruges
    shihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpeeifeelvdfgueeiteefhe
    eghfeiudelleffgeetkeejudeugfekueehkefhhefftdenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehttghrrgiffhhorhgusehshihsthgvmh
    ejiedrtghomh
X-ME-Proxy: <xmx:BpRTYV9o1UBZMRw6EUdgYW6cnsqYbuOZOz0teRePuhv98kZf-mx2tQ>
    <xmx:BpRTYcuOeiy-ym5TGAbsyGCTjWjJi0B9QAy-vhRdWOTp6m94uWck2g>
    <xmx:BpRTYcHKgzpwi5u6s5jTzozlBfB2BI-xNsQedZgYJqY4yuHZN-HMUQ>
    <xmx:BpRTYS3yF0-Qrn9PD65t8DJZaU8LPM6iWPRu6dSuHdtrZ3S9rnxUnw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 18:15:34 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH v2 3/3] platform/x86: system76_acpi: Add battery charging thresholds
Date:   Tue, 28 Sep 2021 16:15:29 -0600
Message-Id: <20210928221529.70176-4-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210928221529.70176-1-tcrawford@system76.com>
References: <20210927210629.37966-1-tcrawford@system76.com>
 <20210928221529.70176-1-tcrawford@system76.com>
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
 drivers/platform/x86/system76_acpi.c | 162 +++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index e7c86b543930..5c525c242211 100644
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
@@ -144,6 +148,159 @@ static int system76_set(struct system76_data *data, char *method, int value)
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
@@ -544,6 +701,8 @@ static int system76_add(struct acpi_device *acpi_dev)
 		return err;
 	}
 
+	system76_battery_init();
+
 	return 0;
 }
 
@@ -553,6 +712,9 @@ static int system76_remove(struct acpi_device *acpi_dev)
 	struct system76_data *data;
 
 	data = acpi_driver_data(acpi_dev);
+
+	system76_battery_exit();
+
 	if (data->kb_color >= 0)
 		device_remove_file(data->kb_led.dev, &kb_led_color_dev_attr);
 
-- 
2.31.1

