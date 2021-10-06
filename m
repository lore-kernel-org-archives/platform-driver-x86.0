Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F794C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 20:22:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7847761163
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 20:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239437AbhJFUYA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Oct 2021 16:24:00 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:38763 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229992AbhJFUX6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Oct 2021 16:23:58 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id E28603200B7A;
        Wed,  6 Oct 2021 16:22:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 06 Oct 2021 16:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=Rb7swU8LCvzyS/0kIcUtH3qgaKMBA3eL9t9aDvVdh
        Iw=; b=c/3XpNIC8wX2L6Q7Sv9OVjmRqu1sR+M9qBX93mJdeoQaciZLvuZHPqYfY
        ARGiRMF9mPUOuDhMTZbPHJgA9WiNvgxjH9n91iOUqL5a9ZSXAqMtPZ/hjSQakpzW
        u/MQ2DcfOv11kHNe3kucSfQVoxESvkXZkyPR9zkuw+FxvV/ZE12nUPNPveiLVcGf
        GRDdg22s7bDKjIl34FMY3NfQlN1mVC7p979uEd23Fy5O4CZW3I3OumatNHnprZAa
        TdV8Dn9WYbh3/BK/exjVoIpJORCclOLV0/TIIlF5zCt9g6XcAFtaihAOUEnfG1C5
        doYuJJXR4wPh8NTPXRMl7SPB2/jvw==
X-ME-Sender: <xms:bQVeYSI83vk-RSLgkGnZmh_4bErKdLoz1qeiPCU0L301uYGjxGWDuQ>
    <xme:bQVeYaJC9EBY-RQ8gW5stcUAtysZd8Q3KCZ_UVwBjpz_6DGHA50U52csg3PhXhikP
    iVR81sVxYPtQpGGXA>
X-ME-Received: <xmr:bQVeYStDlvwWLtayCvDQ_DWU5z4tNYTDBfiTOCSNd3qqTcUTovzC2R9XvCz8FiXirMKxyj3Xv6MXMzFRNgECyHMjojunBwDBlLxSexI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeliedgudeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefvihhm
    ucevrhgrfihfohhrugcuoehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomheqne
    cuggftrfgrthhtvghrnhepheeludfhhfeugedtvefhledtkeffjeehudduueegtdfhffeg
    jeetffeffeevheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepthgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhm
X-ME-Proxy: <xmx:bQVeYXan2gawjOyEJCN0JXOwHO7NCKIBdAj3eBW6Lfvgj6qkIGtIiw>
    <xmx:bQVeYZYVmU7zm4OyswZplj1FYTyZSGbOZs51bL8ovJmdCbmY4d6sNA>
    <xmx:bQVeYTCRwXuviAJT41dXjD20337UvWtPJzcULRewf8_l2Vk9ZQ7BSw>
    <xmx:bQVeYYzrlklLSaVQTk4Ji6gteyyA0e4FKoZPjoRaeleMKEInqUrFsg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Oct 2021 16:22:05 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com, Jeremy Soller <jeremy@system76.com>
Subject: [PATCH v4 1/4] platform/x86: system76_acpi: Report temperature and fan speed
Date:   Wed,  6 Oct 2021 14:21:59 -0600
Message-Id: <20211006202202.7479-2-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006202202.7479-1-tcrawford@system76.com>
References: <20211006202202.7479-1-tcrawford@system76.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Jeremy Soller <jeremy@system76.com>

Add a hwmon interface to report CPU/GPU temperature and fan speed.
sensors now reports an ACPI interface with the entries:

system76_acpi-acpi-0
Adapter: ACPI interface
CPU fan:        0 RPM
GPU fan:        0 RPM
CPU temp:     +47.0°C
GPU temp:      +0.0°C

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 drivers/platform/x86/system76_acpi.c | 222 ++++++++++++++++++++++++++-
 1 file changed, 218 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index c14fd22ba196..2a78ac64d689 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -10,6 +10,8 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
@@ -24,6 +26,9 @@ struct system76_data {
 	enum led_brightness kb_brightness;
 	enum led_brightness kb_toggle_brightness;
 	int kb_color;
+	struct device *therm;
+	union acpi_object *nfan;
+	union acpi_object *ntmp;
 };
 
 static const struct acpi_device_id device_ids[] = {
@@ -63,9 +68,57 @@ static int system76_get(struct system76_data *data, char *method)
 	handle = acpi_device_handle(data->acpi_dev);
 	status = acpi_evaluate_integer(handle, method, NULL, &ret);
 	if (ACPI_SUCCESS(status))
-		return (int)ret;
-	else
-		return -1;
+		return ret;
+	return -ENODEV;
+}
+
+// Get a System76 ACPI device value by name with index
+static int system76_get_index(struct system76_data *data, char *method, int index)
+{
+	union acpi_object obj;
+	struct acpi_object_list obj_list;
+	acpi_handle handle;
+	acpi_status status;
+	unsigned long long ret = 0;
+
+	obj.type = ACPI_TYPE_INTEGER;
+	obj.integer.value = index;
+	obj_list.count = 1;
+	obj_list.pointer = &obj;
+
+	handle = acpi_device_handle(data->acpi_dev);
+	status = acpi_evaluate_integer(handle, method, &obj_list, &ret);
+	if (ACPI_SUCCESS(status))
+		return ret;
+	return -ENODEV;
+}
+
+// Get a System76 ACPI device object by name
+static int system76_get_object(struct system76_data *data, char *method, union acpi_object **obj)
+{
+	acpi_handle handle;
+	acpi_status status;
+	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
+
+	handle = acpi_device_handle(data->acpi_dev);
+	status = acpi_evaluate_object(handle, method, NULL, &buf);
+	if (ACPI_SUCCESS(status)) {
+		*obj = buf.pointer;
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
+// Get a name from a System76 ACPI device object
+static char *system76_name(union acpi_object *obj, int index)
+{
+	if (obj && obj->type == ACPI_TYPE_PACKAGE && index <= obj->package.count) {
+		if (obj->package.elements[index].type == ACPI_TYPE_STRING)
+			return obj->package.elements[index].string.pointer;
+	}
+
+	return NULL;
 }
 
 // Set a System76 ACPI device value by name
@@ -270,6 +323,146 @@ static void kb_led_hotkey_color(struct system76_data *data)
 	kb_led_notify(data);
 }
 
+static umode_t thermal_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	const struct system76_data *data = drvdata;
+
+	switch (type) {
+	case hwmon_fan:
+	case hwmon_pwm:
+		if (system76_name(data->nfan, channel))
+			return 0444;
+		break;
+
+	case hwmon_temp:
+		if (system76_name(data->ntmp, channel))
+			return 0444;
+		break;
+
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static int thermal_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+			int channel, long *val)
+{
+	struct system76_data *data = dev_get_drvdata(dev);
+	int raw;
+
+	switch (type) {
+	case hwmon_fan:
+		if (attr == hwmon_fan_input) {
+			raw = system76_get_index(data, "GFAN", channel);
+			if (raw < 0)
+				return raw;
+			*val = (raw >> 8) & 0xFFFF;
+			return 0;
+		}
+		break;
+
+	case hwmon_pwm:
+		if (attr == hwmon_pwm_input) {
+			raw = system76_get_index(data, "GFAN", channel);
+			if (raw < 0)
+				return raw;
+			*val = raw & 0xFF;
+			return 0;
+		}
+		break;
+
+	case hwmon_temp:
+		if (attr == hwmon_temp_input) {
+			raw = system76_get_index(data, "GTMP", channel);
+			if (raw < 0)
+				return raw;
+			*val = raw * 1000;
+			return 0;
+		}
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int thermal_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+			       int channel, const char **str)
+{
+	struct system76_data *data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_fan:
+		if (attr == hwmon_fan_label) {
+			*str = system76_name(data->nfan, channel);
+			if (*str)
+				return 0;
+		}
+		break;
+
+	case hwmon_temp:
+		if (attr == hwmon_temp_label) {
+			*str = system76_name(data->ntmp, channel);
+			if (*str)
+				return 0;
+		}
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops thermal_ops = {
+	.is_visible = thermal_is_visible,
+	.read = thermal_read,
+	.read_string = thermal_read_string,
+};
+
+// Allocate up to 8 fans and temperatures
+static const struct hwmon_channel_info *thermal_channel_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL,
+		HWMON_F_INPUT | HWMON_F_LABEL),
+	HWMON_CHANNEL_INFO(pwm,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT,
+		HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(temp,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL,
+		HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info thermal_chip_info = {
+	.ops = &thermal_ops,
+	.info = thermal_channel_info,
+};
+
 // Handle ACPI notification
 static void system76_notify(struct acpi_device *acpi_dev, u32 event)
 {
@@ -346,7 +539,26 @@ static int system76_add(struct acpi_device *acpi_dev)
 			return err;
 	}
 
+	err = system76_get_object(data, "NFAN", &data->nfan);
+	if (err)
+		goto error;
+
+	err = system76_get_object(data, "NTMP", &data->ntmp);
+	if (err)
+		goto error;
+
+	data->therm = devm_hwmon_device_register_with_info(&acpi_dev->dev,
+		"system76_acpi", data, &thermal_chip_info, NULL);
+	err = PTR_ERR_OR_ZERO(data->therm);
+	if (err)
+		goto error;
+
 	return 0;
+
+error:
+	kfree(data->ntmp);
+	kfree(data->nfan);
+	return err;
 }
 
 // Remove a System76 ACPI device
@@ -359,9 +571,11 @@ static int system76_remove(struct acpi_device *acpi_dev)
 		device_remove_file(data->kb_led.dev, &kb_led_color_dev_attr);
 
 	devm_led_classdev_unregister(&acpi_dev->dev, &data->ap_led);
-
 	devm_led_classdev_unregister(&acpi_dev->dev, &data->kb_led);
 
+	kfree(data->nfan);
+	kfree(data->ntmp);
+
 	system76_get(data, "FINI");
 
 	return 0;
-- 
2.31.1

