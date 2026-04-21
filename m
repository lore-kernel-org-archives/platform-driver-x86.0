Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3063DD53A;
	Tue, 21 Apr 2026 20:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802279; cv=none; b=hXxktQUxvpsQ46C4eobOKuN/PL+50UJ1BAyd5OMgScwmANiUJByBm5i4rrycTP6K0k5nDY4V7Qmi8QWdqpb8LXCqpYVy9w/71HOMf2oGc52GaevQL5yQC55hfmW9TktQ+imllS1nJQ1NGMvFBTcE3IKRAs6yMtjkRQOiBou1W8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802279; c=relaxed/simple;
	bh=qCbCb0yTbJlaKSVsdtR+FMXXyNsYZ3o4vXKnK/NHzl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHfCV09bgmG4SUneHDhS31JIjQNewvbZEkCQC/5vdC4nBJfpEU/S0MeVaQJVDTUJTxZ96sktMTAeCciyIdtDI2fjJImoUeDca6v2GCBn20Vh1MA8x8MUHRauDR3q+XQ6xAdaDMEVYKG2UP2j4kOO8TyF2AB74EK8ay0OAdp0fgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=e7lE/icL; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="e7lE/icL"
Received: from wse-pc.fritz.box (i5C75F683.versanet.de [92.117.246.131])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 65DEE2FC0226;
	Tue, 21 Apr 2026 22:11:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1776802269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dpakQoIyJoSYNr0v6zw1c6XEmfX8aaFSo0XKYFTgz1U=;
	b=e7lE/icLJjwZbtQkNpE9VYjYoD1uDslbpy1iUDhvFSmnhT1vFEP0fziVwgYPOchGjfkdo4
	V1SZfGuehVLvx0vhhAV/1xkZ2e9Zo+q4fmqdQHm74sSV/2vOmTCUPjx9VTUwcjK53LqkKh
	UrnW5+QP1w3CgBbGDiOYAUbknMAExPw=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [RFC PATCH 3/3] platform/x86: uniwill-laptop: Offer support to activate local dimming
Date: Tue, 21 Apr 2026 22:01:27 +0200
Message-ID: <20260421201103.142403-4-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421201103.142403-1-wse@tuxedocomputers.com>
References: <20260421201103.142403-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds a sysfs variable local_dimming to supported devices.
Setting it to true enables local dimming for the internal notebook display.

Currently only TUXEDO Stellaris 16 Gen7 Intel/AMD with mLED displays are
supported.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 162 +++++++++++++++++++-
 1 file changed, 158 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 62d56cc67e2e8..909d8608a2f80 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -275,6 +275,9 @@
 #define EC_ADDR_USB_C_POWER_PRIORITY	0x07CC
 #define USB_C_POWER_PRIORITY		BIT(7)
 
+#define EC_ADDR_LOCAL_DIMMING_SUPPORT	0x0D4F
+#define LOCAL_DIMMING_SUPPORT		BIT(0)
+
 /* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
 #define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
 
@@ -296,6 +299,14 @@
 
 #define EC_ADDR_GPU_FAN_SPEED_TABLE	0x0F50
 
+#define WMI_GUID_BC			"ABBC0F6F-8EA1-11D1-00A0-C90629100000"
+#define WMI_DEFAULT_INSTANCE		0x00
+#define WMI_DEFAULT_METHOD		0x04
+
+#define WMI_FUNC_SET_FEATURE		0x00000500
+#define WMI_FEATURE_LOCAL_DIMMING_OFF	0x0d
+#define WMI_FEATURE_LOCAL_DIMMING_ON	0x0e
+
 /*
  * Those two registers technically allow for manual fan control,
  * but are unstable on some models and are likely not meant to
@@ -332,6 +343,7 @@
 #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(9)
 #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(10)
 #define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(11)
+#define UNIWILL_FEATURE_LOCAL_DIMMING		BIT(12)
 
 enum usb_c_power_priority_options {
 	USB_C_POWER_PRIORITY_CHARGING = 0,
@@ -367,6 +379,8 @@ struct uniwill_data {
 	struct notifier_block nb;
 	struct mutex usb_c_power_priority_lock; /* Protects dependent bit write and state safe */
 	enum usb_c_power_priority_options last_usb_c_power_priority_option;
+	struct mutex local_dimming_lock; /* Protects call to local dimming wmi method */
+	bool last_local_dimming_option;
 };
 
 struct uniwill_battery_entry {
@@ -774,7 +788,7 @@ static int super_key_enable_init(struct uniwill_data *data)
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
 		return 0;
 
-	return devm_mutex_init(&data->dev, &data->super_key_lock);
+	return devm_mutex_init(data->dev, &data->super_key_lock);
 }
 
 static int uniwill_write_touchpad_toggle_enable(struct uniwill_data *data, bool status)
@@ -1086,6 +1100,87 @@ static int usb_c_power_priority_init(struct uniwill_data *data)
 	return 0;
 }
 
+struct __packed uniwill_wmi_input {
+	u8 args[4];
+	u32 function;
+	/* Prevent accidential out of bounds access by the ACPI code */
+	u32 reserved[8];
+};
+
+static int set_local_dimming(bool enable)
+{
+	struct __packed uniwill_wmi_input wmi_input;
+	struct acpi_buffer wmi_buf = { (acpi_size) sizeof(wmi_input), &wmi_input };
+	acpi_status status;
+
+	wmi_input.function = WMI_FUNC_SET_FEATURE;
+	wmi_input.args[0] = enable ? WMI_FEATURE_LOCAL_DIMMING_ON : WMI_FEATURE_LOCAL_DIMMING_OFF;
+
+	status = wmi_evaluate_method(WMI_GUID_BC, WMI_DEFAULT_INSTANCE, WMI_DEFAULT_METHOD,
+				     &wmi_buf, &wmi_buf);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
+static ssize_t local_dimming_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct uniwill_data *data = dev_get_drvdata(dev);
+	bool enable;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret < 0)
+		return ret;
+
+	guard(mutex)(&data->local_dimming_lock);
+
+	ret = set_local_dimming(enable);
+	if (ret)
+		return ret;
+
+	data->last_local_dimming_option = enable;
+
+	return count;
+}
+
+static ssize_t local_dimming_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct uniwill_data *data = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", data->last_local_dimming_option);
+}
+
+static DEVICE_ATTR_RW(local_dimming);
+
+static int local_dimming_restore(struct uniwill_data *data)
+{
+	guard(mutex)(&data->local_dimming_lock);
+
+	return set_local_dimming(data->last_local_dimming_option);
+}
+
+static int local_dimming_init(struct uniwill_data *data)
+{
+	int ret;
+
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_LOCAL_DIMMING))
+		return 0;
+
+	ret = devm_mutex_init(data->dev, &data->local_dimming_lock);
+	if (ret < 0)
+		return ret;
+
+	data->last_local_dimming_option = 0;
+
+	return local_dimming_restore(data);
+}
+
 static struct attribute *uniwill_attrs[] = {
 	/* Keyboard-related */
 	&dev_attr_fn_lock.attr,
@@ -1097,6 +1192,7 @@ static struct attribute *uniwill_attrs[] = {
 	/* Power-management-related */
 	&dev_attr_ctgp_offset.attr,
 	&dev_attr_usb_c_power_priority.attr,
+	&dev_attr_local_dimming.attr,
 	NULL
 };
 
@@ -1136,6 +1232,11 @@ static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attribute *a
 			return attr->mode;
 	}
 
+	if (attr == &dev_attr_local_dimming.attr) {
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_LOCAL_DIMMING))
+			return attr->mode;
+	}
+
 	return 0;
 }
 
@@ -1922,6 +2023,10 @@ static int uniwill_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = local_dimming_init(data);
+	if (ret < 0)
+		return ret;
+
 	return uniwill_input_init(data);
 }
 
@@ -2075,6 +2180,14 @@ static int uniwill_resume_usb_c_power_priority(struct uniwill_data *data)
 	return usb_c_power_priority_restore(data);
 }
 
+static int uniwill_resume_local_dimming(struct uniwill_data *data)
+{
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_LOCAL_DIMMING))
+		return 0;
+
+	return local_dimming_restore(data);
+}
+
 static int uniwill_resume(struct device *dev)
 {
 	struct uniwill_data *data = dev_get_drvdata(dev);
@@ -2106,7 +2219,11 @@ static int uniwill_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	return uniwill_resume_usb_c_power_priority(data);
+	ret = uniwill_resume_usb_c_power_priority(data);
+	if (ret < 0)
+		return ret;
+
+	return uniwill_resume_local_dimming(data);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwill_resume);
@@ -2222,6 +2339,17 @@ static struct uniwill_device_descriptor tux_featureset_3_nvidia_descriptor __ini
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
 };
 
+static struct uniwill_device_descriptor tux_featureset_3_nvidia_mled_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_LOCAL_DIMMING,
+};
+
 static int phxtxx1_probe(struct uniwill_data *data)
 {
 	unsigned int value;
@@ -2272,6 +2400,32 @@ static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __initdata =
 	.probe = phxarx1_phxaqf1_probe,
 };
 
+static int x6fr5xxy_probe(struct uniwill_data *data)
+{
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(data->regmap, EC_ADDR_LOCAL_DIMMING_SUPPORT, &value);
+	if (ret < 0)
+		return ret;
+
+	if (value != 0xff && value & LOCAL_DIMMING_SUPPORT)
+		data->features |= UNIWILL_FEATURE_LOCAL_DIMMING;
+
+	return 0;
+};
+
+static struct uniwill_device_descriptor x6fr5xxy_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
+	.probe = x6fr5xxy_probe,
+};
+
 static struct uniwill_device_descriptor pf5pu1g_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
@@ -2662,7 +2816,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &x6fr5xxy_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -2678,7 +2832,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
 		},
-		.driver_data = &tux_featureset_3_nvidia_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_mled_descriptor,
 	},
 	{
 		.ident = "TUXEDO Book BA15 Gen10 AMD",
-- 
2.43.0

