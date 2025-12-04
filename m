Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2169F23D7C4;
	Thu,  4 Dec 2025 13:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764856295; cv=none; b=dYwOIPC8Dmn+MK8o0eSyx34eWvnc7z79PTE5/X+fs0Wn/OjWUYFBq2gwHGSxsX9YVHlhqTEJMevhbOPBU6UZ+Gx4fabJwaaFJOwxnsc3A0v9xJ3/Yq6z+pWYpTqkRWzuW+QdLinZWKqFhaea6/Tp2P779MLeyGyFWDhknmZIUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764856295; c=relaxed/simple;
	bh=uaBlp18RghFHum3+2l5MqMj28EBp7N8P5n5Jj6zIAZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEbSYEVLcoRoSrnkUDGAoO2FpKl2VrntZGaHPrwYKzIZZNzA/q6/vXIdQ5qmE77Pjx8f91JJfhxFoykPFc0FrzGllu2lHTMOzK0s61VpVoUE/2lrWpm6xfiO0bVf0SOxwbY5polkScVsLgH4gwB/UKHZZfGZ7xSsb50myk9Vy3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=XO6OZW8d; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XO6OZW8d"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 847452FC0095;
	Thu,  4 Dec 2025 14:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764856285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lhsS7yX+gkI2gb3SOcFrx5jsA9mtPA0a7sOVkQ3AgAw=;
	b=XO6OZW8d6fX05Ho7RdLTwz1upNVp4cPwWjNbu0a8q1S9OGSD2WZW9VjuUOdhO1e8j91SKH
	7sIg0rMfqn115TJIcVuVtT7Typ1vsXJcx/mM3wMna6t3ERGG01CXN1Mq3UF9P4Mb0Mv/hG
	Bze1lFjRq1WXwmdh1twkJondRqVRNYM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 1/2] platform/x86: uniwill-laptop: Introduce device descriptor system
Date: Thu,  4 Dec 2025 14:50:03 +0100
Message-ID: <20251204135121.435905-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204135121.435905-1-wse@tuxedocomputers.com>
References: <20251204135121.435905-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Wolf <W_Armin@gmx.de>

Future additions to the driver will depend on device-specific
initialization steps. Extend the DMI-based feature detection system
to include device descriptors. Each descriptor contains a bitmap of
supported features and a set of callback for performing
device-specific initialization.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 168 +++++++++++++++++---
 1 file changed, 142 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index bd7e63dd51810..01192c32608e5 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -322,6 +322,7 @@ struct uniwill_data {
 	struct device *dev;
 	acpi_handle handle;
 	struct regmap *regmap;
+	unsigned int features;
 	struct acpi_battery_hook hook;
 	unsigned int last_charge_ctrl;
 	struct mutex battery_lock;	/* Protects the list of currently registered batteries */
@@ -341,12 +342,21 @@ struct uniwill_battery_entry {
 	struct power_supply *battery;
 };
 
+struct uniwill_device_descriptor {
+	unsigned int features;
+	/* Executed during driver probing */
+	int (*probe)(struct uniwill_data *data);
+};
+
 static bool force;
 module_param_unsafe(force, bool, 0);
 MODULE_PARM_DESC(force, "Force loading without checking for supported devices\n");
 
-/* Feature bitmask since the associated registers are not reliable */
-static unsigned int supported_features;
+/*
+ * Contains device specific data like the feature bitmap since
+ * the associated registers are not always reliable.
+ */
+static struct uniwill_device_descriptor device_descriptor __ro_after_init;
 
 static const char * const uniwill_temp_labels[] = {
 	"CPU",
@@ -411,6 +421,13 @@ static const struct key_entry uniwill_keymap[] = {
 	{ KE_END }
 };
 
+static inline bool uniwill_device_supports(struct uniwill_data *data,
+					   unsigned int features_mask,
+					   unsigned int features)
+{
+	return (data->features & features_mask) == features;
+}
+
 static int uniwill_ec_reg_write(void *context, unsigned int reg, unsigned int val)
 {
 	union acpi_object params[2] = {
@@ -799,24 +816,31 @@ static struct attribute *uniwill_attrs[] = {
 
 static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
 {
+	struct device *dev = kobj_to_dev(kobj);
+	struct uniwill_data *data = dev_get_drvdata(dev);
+
 	if (attr == &dev_attr_fn_lock_toggle_enable.attr) {
-		if (supported_features & UNIWILL_FEATURE_FN_LOCK_TOGGLE)
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK_TOGGLE,
+					    UNIWILL_FEATURE_FN_LOCK_TOGGLE))
 			return attr->mode;
 	}
 
 	if (attr == &dev_attr_super_key_toggle_enable.attr) {
-		if (supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE)
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
+					    UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
 			return attr->mode;
 	}
 
 	if (attr == &dev_attr_touchpad_toggle_enable.attr) {
-		if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_TOUCHPAD_TOGGLE,
+					    UNIWILL_FEATURE_TOUCHPAD_TOGGLE))
 			return attr->mode;
 	}
 
 	if (attr == &dev_attr_rainbow_animation.attr ||
 	    attr == &dev_attr_breathing_in_suspend.attr) {
-		if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR,
+					    UNIWILL_FEATURE_LIGHTBAR))
 			return attr->mode;
 	}
 
@@ -944,7 +968,8 @@ static int uniwill_hwmon_init(struct uniwill_data *data)
 {
 	struct device *hdev;
 
-	if (!(supported_features & UNIWILL_FEATURE_HWMON))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_HWMON,
+				     UNIWILL_FEATURE_HWMON))
 		return 0;
 
 	hdev = devm_hwmon_device_register_with_info(data->dev, "uniwill", data,
@@ -1019,7 +1044,8 @@ static int uniwill_led_init(struct uniwill_data *data)
 	unsigned int value;
 	int ret;
 
-	if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR,
+				     UNIWILL_FEATURE_LIGHTBAR))
 		return 0;
 
 	ret = devm_mutex_init(data->dev, &data->led_lock);
@@ -1232,7 +1258,8 @@ static int uniwill_battery_init(struct uniwill_data *data)
 {
 	int ret;
 
-	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
+				     UNIWILL_FEATURE_BATTERY))
 		return 0;
 
 	ret = devm_mutex_init(data->dev, &data->battery_lock);
@@ -1361,6 +1388,19 @@ static int uniwill_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	data->features = device_descriptor.features;
+
+	/*
+	 * Some devices might need to perform some device-specific initialization steps
+	 * before the supported features are initialized. Because of this we have to call
+	 * this callback just after the EC itself was initialized.
+	 */
+	if (device_descriptor.probe) {
+		ret = device_descriptor.probe(data);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = uniwill_battery_init(data);
 	if (ret < 0)
 		return ret;
@@ -1385,7 +1425,8 @@ static void uniwill_shutdown(struct platform_device *pdev)
 
 static int uniwill_suspend_keyboard(struct uniwill_data *data)
 {
-	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
+				     UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
 		return 0;
 
 	/*
@@ -1397,7 +1438,8 @@ static int uniwill_suspend_keyboard(struct uniwill_data *data)
 
 static int uniwill_suspend_battery(struct uniwill_data *data)
 {
-	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
+				     UNIWILL_FEATURE_BATTERY))
 		return 0;
 
 	/*
@@ -1432,7 +1474,8 @@ static int uniwill_resume_keyboard(struct uniwill_data *data)
 	unsigned int value;
 	int ret;
 
-	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
+				     UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
 		return 0;
 
 	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
@@ -1448,7 +1491,8 @@ static int uniwill_resume_keyboard(struct uniwill_data *data)
 
 static int uniwill_resume_battery(struct uniwill_data *data)
 {
-	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
+				     UNIWILL_FEATURE_BATTERY))
 		return 0;
 
 	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL_MASK,
@@ -1496,6 +1540,25 @@ static struct platform_driver uniwill_driver = {
 	.shutdown = uniwill_shutdown,
 };
 
+static struct uniwill_device_descriptor lapac71h_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK_TOGGLE |
+		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
+		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
+		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_HWMON
+};
+
+static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK_TOGGLE |
+		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
+		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
+		    UNIWILL_FEATURE_LIGHTBAR |
+		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_HWMON
+};
+
+static struct uniwill_device_descriptor empty_descriptor __initdata = {};
+
 static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 	{
 		.ident = "XMG FUSION 15",
@@ -1503,6 +1566,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "XMG FUSION 15",
@@ -1510,6 +1574,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "Intel NUC x15",
@@ -1517,11 +1582,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPAC71H"),
 		},
-		.driver_data = (void *)(UNIWILL_FEATURE_FN_LOCK_TOGGLE |
-					UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
-					UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
-					UNIWILL_FEATURE_BATTERY |
-					UNIWILL_FEATURE_HWMON),
+		.driver_data = &lapac71h_descriptor,
 	},
 	{
 		.ident = "Intel NUC x15",
@@ -1529,12 +1590,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPKC71F"),
 		},
-		.driver_data = (void *)(UNIWILL_FEATURE_FN_LOCK_TOGGLE |
-					UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
-					UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
-					UNIWILL_FEATURE_LIGHTBAR |
-					UNIWILL_FEATURE_BATTERY |
-					UNIWILL_FEATURE_HWMON),
+		.driver_data = &lapkc71f_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen6 Intel",
@@ -1542,6 +1598,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen6 Intel",
@@ -1549,6 +1606,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
@@ -1556,6 +1614,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Book Pro Gen 7",
@@ -1563,6 +1622,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -1570,6 +1630,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -1577,6 +1638,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
@@ -1584,6 +1646,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
@@ -1591,6 +1654,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia-Book 15 Gen9",
@@ -1598,6 +1662,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
@@ -1605,6 +1670,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
@@ -1612,6 +1678,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 15 Gen10 Intel",
@@ -1619,6 +1686,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 15 Gen10 AMD",
@@ -1626,6 +1694,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
@@ -1633,6 +1702,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
@@ -1640,6 +1710,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 15 Gen10 Intel",
@@ -1647,6 +1718,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 Intel",
@@ -1654,6 +1726,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 AMD",
@@ -1661,6 +1734,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 AMD",
@@ -1668,6 +1742,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 AMD",
@@ -1675,6 +1750,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 AMD",
@@ -1682,6 +1758,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 Intel",
@@ -1689,6 +1766,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 Intel",
@@ -1696,6 +1774,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 Intel",
@@ -1703,6 +1782,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 Intel",
@@ -1710,6 +1790,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Trinity 15 Intel Gen1",
@@ -1717,6 +1798,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Trinity 17 Intel Gen1",
@@ -1724,6 +1806,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 AMD",
@@ -1731,6 +1814,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 Intel",
@@ -1738,6 +1822,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
@@ -1745,6 +1830,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
@@ -1752,6 +1838,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
@@ -1759,6 +1846,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 15 Gen4 Intel",
@@ -1766,6 +1854,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen5 AMD",
@@ -1773,6 +1862,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen5 AMD",
@@ -1780,6 +1870,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
@@ -1787,6 +1878,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
@@ -1794,6 +1886,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim 15 Gen6",
@@ -1801,6 +1894,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -1808,6 +1902,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -1815,6 +1910,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
@@ -1822,6 +1918,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 AMD",
@@ -1829,6 +1926,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -1836,6 +1934,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -1843,6 +1942,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 14 Gen1 AMD",
@@ -1850,6 +1950,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 15 Gen1 AMD",
@@ -1857,6 +1958,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 15 Gen2 AMD",
@@ -1864,6 +1966,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
 		},
+		.driver_data = &empty_descriptor,
 	},
 	{ }
 };
@@ -1871,6 +1974,7 @@ MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
 
 static int __init uniwill_init(void)
 {
+	const struct uniwill_device_descriptor *descriptor;
 	const struct dmi_system_id *id;
 	int ret;
 
@@ -1880,10 +1984,22 @@ static int __init uniwill_init(void)
 			return -ENODEV;
 
 		/* Assume that the device supports all features */
-		supported_features = UINT_MAX;
+		device_descriptor.features = UINT_MAX;
 		pr_warn("Loading on a potentially unsupported device\n");
 	} else {
-		supported_features = (uintptr_t)id->driver_data;
+		/*
+		 * Some devices might support additional features depending on
+		 * the BIOS version/date, so we call this callback to let them
+		 * modify their device descriptor accordingly.
+		 */
+		if (id->callback) {
+			ret = id->callback(id);
+			if (ret < 0)
+				return ret;
+		}
+
+		descriptor = id->driver_data;
+		device_descriptor = *descriptor;
 	}
 
 	ret = platform_driver_register(&uniwill_driver);
-- 
2.43.0

