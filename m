Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAB0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 16:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59D6E61452
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 16:08:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhJAQKA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 1 Oct 2021 12:10:00 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:37181 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231698AbhJAQKA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 Oct 2021 12:10:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id A7B773201C35;
        Fri,  1 Oct 2021 12:08:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 01 Oct 2021 12:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=dX5R+t1s2y/VmAcZ1GbiFyiNaJ5HdQKqC8aE59zCg
        Po=; b=arVR/UgjttJdUnqTwB+LrI3Wop/3CAxapoxWW8cPdoWNU1jF3LUtKDTjq
        6hlhZ0ioMmIl5cI0aUsMf9qjHOfPeVhXGOksjDgVxCqvxKMriCSkhLB1GNiFJ6su
        GZ1HJ1nu6KgIMBnZ351hek25nOmAaFwWhtFcXRsWQG4j0TnxP8mEG/fh+M20KHk5
        2bkgEF+OKokFn3ljXppqbuQZ1eFBP+eE5xDW/ApB+ts+Gl2sUY4rS27RAOK9XmC7
        KH2M/19mVnrLoTjOi4pONQ18+vWc7Q9DM2vVzi0mGemMN8isw/fPJErR92iQ1exw
        Uf+h9iUZJdlWaf9CBcMKqJvASzMig==
X-ME-Sender: <xms:bzJXYZgks30EWxgk-eemCv8jdhuzfuAPcPlORDoBUvmPJ2RYhbp7_A>
    <xme:bzJXYeBAPUx7h1Z9sSwOcFJ7v-gSZvcHdTqvTr6szPkc7J-eA6KNwAQJF3F1yY9o7
    1x7n5DFDT3EeGDhOQ>
X-ME-Received: <xmr:bzJXYZE3PoQxmU9eVn1f5Z2SD5Hx_1bbSuq1D6VEr-Cn-6IOS3Y8W2OUTUenfQ5CUnnKdeR8qLMSE3-xGiBgroNyihn3z6puJQtxxcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekiedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepvfhimhcu
    vehrrgiffhhorhguuceothgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehleduhffhueegtdevhfeltdekffejheduudeugedthfffgeej
    tefffeefveehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomh
X-ME-Proxy: <xmx:bzJXYeRa-XAJNaq0EKaJp_SuSfPHXlvqqdpfoApj_EWUgcE9I8Ib1Q>
    <xmx:bzJXYWxPSOBnQroOv-jr8QnwXhII7-sSiQT8d8cx_dU4bM6pMPZwcg>
    <xmx:bzJXYU51m9bseFAaIoecs3OvcG2uRUTZkkuazVjAq0DGOPtSwadPLA>
    <xmx:bzJXYbpe40nQ1quLUI7pwaQfc4_MhUMGIxtAY3QaKFn1IOBBQabhVA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Oct 2021 12:08:14 -0400 (EDT)
From:   Tim Crawford <tcrawford@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com, Jeremy Soller <jeremy@system76.com>
Subject: [PATCH 1/4] platform/x86: system76_acpi: Report temperature and fan speed
Date:   Fri,  1 Oct 2021 10:08:09 -0600
Message-Id: <20211001160812.22535-2-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001160812.22535-1-tcrawford@system76.com>
References: <20211001160812.22535-1-tcrawford@system76.com>
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
 drivers/platform/x86/system76_acpi.c | 172 ++++++++++++++++++++++++++-
 1 file changed, 171 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index c14fd22ba196..11f0e42386ba 100644
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
@@ -68,6 +73,55 @@ static int system76_get(struct system76_data *data, char *method)
 		return -1;
 }
 
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
+		return (int)ret;
+	return -1;
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
+		*obj = (union acpi_object *)buf.pointer;
+		return 0;
+	}
+
+	return -1;
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
+}
+
 // Set a System76 ACPI device value by name
 static int system76_set(struct system76_data *data, char *method, int value)
 {
@@ -270,6 +324,112 @@ static void kb_led_hotkey_color(struct system76_data *data)
 	kb_led_notify(data);
 }
 
+static umode_t thermal_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	const struct system76_data *data = drvdata;
+
+	if (type == hwmon_fan || type == hwmon_pwm) {
+		if (system76_name(data->nfan, channel))
+			return 0444;
+	} else if (type == hwmon_temp) {
+		if (system76_name(data->ntmp, channel))
+			return 0444;
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
+	if (type == hwmon_fan && attr == hwmon_fan_input) {
+		raw = system76_get_index(data, "GFAN", channel);
+		if (raw >= 0) {
+			*val = (long)((raw >> 8) & 0xFFFF);
+			return 0;
+		}
+	} else if (type == hwmon_pwm && attr == hwmon_pwm_input) {
+		raw = system76_get_index(data, "GFAN", channel);
+		if (raw >= 0) {
+			*val = (long)(raw & 0xFF);
+			return 0;
+		}
+	} else if (type == hwmon_temp && attr == hwmon_temp_input) {
+		raw = system76_get_index(data, "GTMP", channel);
+		if (raw >= 0) {
+			*val = (long)(raw * 1000);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int thermal_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+			       int channel, const char **str)
+{
+	struct system76_data *data = dev_get_drvdata(dev);
+
+	if (type == hwmon_fan && attr == hwmon_fan_label) {
+		*str = system76_name(data->nfan, channel);
+		if (*str)
+			return 0;
+	} else if (type == hwmon_temp && attr == hwmon_temp_label) {
+		*str = system76_name(data->ntmp, channel);
+		if (*str)
+			return 0;
+	}
+
+	return -EINVAL;
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
@@ -346,6 +506,14 @@ static int system76_add(struct acpi_device *acpi_dev)
 			return err;
 	}
 
+	system76_get_object(data, "NFAN", &data->nfan);
+	system76_get_object(data, "NTMP", &data->ntmp);
+
+	data->therm = devm_hwmon_device_register_with_info(&acpi_dev->dev,
+		"system76_acpi", data, &thermal_chip_info, NULL);
+	if (IS_ERR(data->therm))
+		return PTR_ERR(data->therm);
+
 	return 0;
 }
 
@@ -359,9 +527,11 @@ static int system76_remove(struct acpi_device *acpi_dev)
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

