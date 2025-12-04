Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0D823183B;
	Thu,  4 Dec 2025 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764856296; cv=none; b=bLnYAylsYv2mNAhYHDIJnKC7wrKOehkJtL9p9u4ZRSz+ToommlvGcXjwRTC7z8lZIetkhfIwxg27InNAvOSnUL/rcyC5OjY7PAgIWz1z6rJiua3rctwri+O+2ML61IPJywtuid9qZ4pLtrmB1FK0xmgUXSvNWdkRrCkDO/kXvLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764856296; c=relaxed/simple;
	bh=TPQdn1JhWT0b1oOwy+jrVD0yrGrCPFhFfkEy/GzEi+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2Jxx9ydOI37e5J5XXCTXDeDu5yGZG4FAieoc1Ho2f8XMnW1rSmZzFT3bDuoeNErmhAAiQKydgNqnkB3hl9WE4fMwn4csgopM2qfdwjbyuUzEyrlXQX1FYFBSz4V4BKx178RKyzpqFK2cZeAeiKfXGONTfgZK0ZuyT+BZ4r6MI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=F0cIXAub; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="F0cIXAub"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 3A6152FC0094;
	Thu,  4 Dec 2025 14:51:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764856286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hq6k8gATY4zLlojMf3WynQ4C5Iuygyovd2v0U+Wzcvc=;
	b=F0cIXAub6eq/yKntgtGIni0cVpjo4KuStCGcL8u9Z/lrX0PoHlC/n0shCX3s6AhS7G7KZc
	bpkJFmF/KN5Z3NzF/1aBik/OdxQjPYHtU8QirZ3nDOziOIhdr+XCoAnMZIri5lRAbugFBk
	D34D4gaV8pm99hNAT6H1CVVj0gfrXpM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 2/2] platform/x86/uniwill: Implement cTGP setting
Date: Thu,  4 Dec 2025 14:50:04 +0100
Message-ID: <20251204135121.435905-3-wse@tuxedocomputers.com>
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

Uniwill offers user setable cTGP for their EC on devices using NVIDIA 3000
Series and newer GPUs. This patch implements this setting as a sysfs
attribute.

For one device, the TUXEDO InfinityBook Gen7, the variant with and without
NVIDIA GPU can't be differentiated using only the DMI strings, so the new
probe callback needs to be used to test a bit from the EC memory.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 160 +++++++++++++++++---
 1 file changed, 135 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 01192c32608e5..f87f6e9d08234 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -88,6 +88,9 @@
 
 #define EC_ADDR_GPU_TEMP		0x044F
 
+#define EC_ADDR_SYSTEM_ID		0x0456
+#define HAS_GPU				BIT(7)
+
 #define EC_ADDR_MAIN_FAN_RPM_1		0x0464
 
 #define EC_ADDR_MAIN_FAN_RPM_2		0x0465
@@ -122,11 +125,11 @@
 #define CTGP_DB_DB_ENABLE		BIT(1)
 #define CTGP_DB_CTGP_ENABLE		BIT(2)
 
-#define EC_ADDR_CTGP_OFFSET		0x0744
+#define EC_ADDR_CTGP_DB_CTGP_OFFSET	0x0744
 
-#define EC_ADDR_TPP_OFFSET		0x0745
+#define EC_ADDR_CTGP_DB_TPP_OFFSET	0x0745
 
-#define EC_ADDR_MAX_TGP			0x0746
+#define EC_ADDR_CTGP_DB_DB_OFFSET	0x0746
 
 #define EC_ADDR_LIGHTBAR_AC_CTRL	0x0748
 #define LIGHTBAR_APP_EXISTS		BIT(0)
@@ -317,6 +320,7 @@
 #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
 #define UNIWILL_FEATURE_BATTERY			BIT(4)
 #define UNIWILL_FEATURE_HWMON			BIT(5)
+#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(6)
 
 struct uniwill_data {
 	struct device *dev;
@@ -515,6 +519,10 @@ static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_LIGHTBAR_BAT_RED:
 	case EC_ADDR_LIGHTBAR_BAT_GREEN:
 	case EC_ADDR_LIGHTBAR_BAT_BLUE:
+	case EC_ADDR_CTGP_DB_CTRL:
+	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
+	case EC_ADDR_CTGP_DB_TPP_OFFSET:
+	case EC_ADDR_CTGP_DB_DB_OFFSET:
 		return true;
 	default:
 		return false;
@@ -548,6 +556,10 @@ static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
 	case EC_ADDR_LIGHTBAR_BAT_RED:
 	case EC_ADDR_LIGHTBAR_BAT_GREEN:
 	case EC_ADDR_LIGHTBAR_BAT_BLUE:
+	case EC_ADDR_CTGP_DB_CTRL:
+	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
+	case EC_ADDR_CTGP_DB_TPP_OFFSET:
+	case EC_ADDR_CTGP_DB_DB_OFFSET:
 		return true;
 	default:
 		return false;
@@ -803,6 +815,69 @@ static ssize_t breathing_in_suspend_show(struct device *dev, struct device_attri
 
 static DEVICE_ATTR_RW(breathing_in_suspend);
 
+static ssize_t ctgp_offset_store(struct device *dev, struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct uniwill_data *data = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &value);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, value);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t ctgp_offset_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	struct uniwill_data *data = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, &value);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", value);
+}
+
+static DEVICE_ATTR_RW(ctgp_offset);
+
+static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
+{
+	int ret;
+
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
+				     UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
+		return 0;
+
+	ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_TPP_OFFSET, 255);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_DB_OFFSET, 25);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
+				 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE,
+				 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static struct attribute *uniwill_attrs[] = {
 	/* Keyboard-related */
 	&dev_attr_fn_lock_toggle_enable.attr,
@@ -811,6 +886,8 @@ static struct attribute *uniwill_attrs[] = {
 	/* Lightbar-related */
 	&dev_attr_rainbow_animation.attr,
 	&dev_attr_breathing_in_suspend.attr,
+	/* Power-management-related */
+	&dev_attr_ctgp_offset.attr,
 	NULL
 };
 
@@ -844,6 +921,12 @@ static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attribute *a
 			return attr->mode;
 	}
 
+	if (attr == &dev_attr_ctgp_offset.attr) {
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
+					    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
+			return attr->mode;
+	}
+
 	return 0;
 }
 
@@ -1413,6 +1496,10 @@ static int uniwill_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = uniwill_nvidia_ctgp_init(data);
+	if (ret < 0)
+		return ret;
+
 	return uniwill_input_init(data);
 }
 
@@ -1557,6 +1644,29 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
 		    UNIWILL_FEATURE_HWMON
 };
 
+static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
+{
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(data->regmap, EC_ADDR_SYSTEM_ID, &value);
+	if (ret < 0)
+		return ret;
+
+	if (value & HAS_GPU)
+		data->features |= UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
+
+	return 0;
+};
+
+static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __initdata = {
+	.probe = phxarx1_phxaqf1_probe
+};
+
+static struct uniwill_device_descriptor tux_featureset_1_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL
+};
+
 static struct uniwill_device_descriptor empty_descriptor __initdata = {};
 
 static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
@@ -1606,7 +1716,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
@@ -1614,7 +1724,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &phxarx1_phxaqf1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Book Pro Gen 7",
@@ -1622,7 +1732,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -1638,7 +1748,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
@@ -1646,7 +1756,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
@@ -1814,7 +1924,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 Intel",
@@ -1822,7 +1932,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
@@ -1830,7 +1940,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
@@ -1838,7 +1948,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
@@ -1846,7 +1956,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 15 Gen4 Intel",
@@ -1854,7 +1964,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen5 AMD",
@@ -1862,7 +1972,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen5 AMD",
@@ -1870,7 +1980,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
@@ -1878,7 +1988,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
@@ -1886,7 +1996,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim 15 Gen6",
@@ -1894,7 +2004,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -1902,7 +2012,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -1910,7 +2020,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
@@ -1918,7 +2028,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 AMD",
@@ -1926,7 +2036,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -1934,7 +2044,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -1942,7 +2052,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 14 Gen1 AMD",
-- 
2.43.0

