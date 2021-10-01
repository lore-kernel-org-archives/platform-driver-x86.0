Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3658C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 16:08:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D05FA61881
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 16:08:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbhJAQKD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 1 Oct 2021 12:10:03 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:47391 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231675AbhJAQKD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 Oct 2021 12:10:03 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id AC0B43202361;
        Fri,  1 Oct 2021 12:08:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 01 Oct 2021 12:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=ZZAV87qsnFQrFPuRkM1zBzSPPYgUf3RPBFnvfLT0bAM=; b=ffpMe08B
        0vg9JJCCBZjJF/jknzDSTIuOITQ+vxwkBhRSY4euLhJApaEGCZeCvKfFdsQjiv46
        1KZ8NkXo13u0gN9FUpjtSopl6gIASC2y9+v+p6YX5moFYgh/5E3M90/GsNNOGbfJ
        3K6xcjk9UtP3/sjpF1Y1MEKAVMCMcGZWiR2plMJMRdGQP2rjUpRvMdQDkEj0fSER
        nlEWbA89hwjCNoAsfxwDL1PaMxN5KDnxSxzpvDdhsuXMm9sEBHS38yGPEFPg8uq9
        kFiGwM6BFodxwLqoEsW/N/qvmtv8+74WbOBAr8tUu8LuDCAfA4quDtvA6DZ1wLXM
        H4IoFJzzftU0Rg==
X-ME-Sender: <xms:cjJXYYku7V-1WRIuB8n3Q4p-EXcOoTqQqo2xs2jzlBu-W1k8PTagTQ>
    <xme:cjJXYX0CDuz9Xq_jh-4Wg1DoNDVTdrB4ruIdYrFdZlmJ3H3fh2l3Fp1ZHiaRusqMV
    uT1QxIv4_aksp-9Pg>
X-ME-Received: <xmr:cjJXYWq1z8Ce2dF72pogsnH-_MuPoHcarOFA5BUA4G-4471oLKU-P6ljGm9gLlwRET8mNT3zo_IxKAQe62c--3oTWX151EjFvG7dlTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekiedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepvfhimhcuvehrrgiffhhorhguuceothgtrhgrfihfohhruges
    shihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpeeifeelvdfgueeiteefhe
    eghfeiudelleffgeetkeejudeugfekueehkefhhefftdenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehttghrrgiffhhorhgusehshihsthgvmh
    ejiedrtghomh
X-ME-Proxy: <xmx:cjJXYUnmCCQ5fc1VYU2BTCJyTzPQ1SD1fJ94lTSJpGGFSNzs5fRQZg>
    <xmx:cjJXYW1nPyyc23H3uixodN-xSI2AiJ0Qi64h1bK1Z4dTGN7UXccjNQ>
    <xmx:cjJXYbuTTS3wqDCJFtnKxmMsveG3a0SR8yUmmcBtbDPevxL8gqmcyA>
    <xmx:cjJXYb9VEhMip1UmEgLHOEgxR1QQWu0xyjrvPVLe7KW4BM8A6g9r5A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Oct 2021 12:08:17 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
Subject: [PATCH 3/4] platform/x86: system76_acpi: Add battery charging thresholds
Date:   Fri,  1 Oct 2021 10:08:11 -0600
Message-Id: <20211001160812.22535-4-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001160812.22535-1-tcrawford@system76.com>
References: <20211001160812.22535-1-tcrawford@system76.com>
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

