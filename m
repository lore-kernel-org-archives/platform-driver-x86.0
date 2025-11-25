Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A626ED2F;
	Tue, 25 Nov 2025 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079068; cv=none; b=O8s1Q9W/9yWVXPEDU+gNKYqmBp+FFihwXn2IltTk0JWv/byAjxNDv8B70gMVdAhR4aWTtcIHGXU5zZEJVDim3nxx4olxQxqWqEGWNxazSERHQM7wjlzszEe3fwZ4iyNNirlfbHO5BfmtzcJ4vXjZCmedeoepOHhkfEGvtR7zILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079068; c=relaxed/simple;
	bh=tBTNSA3+tsJnkPvsgEXrIv6VoMXci7TidXD19kJzDPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIk/yzxE18uhfe2ijDJtnF5gG8xtkQJuPxdNkKzJ0V5U6YFt+7XZavXxQehJPYx/LgOV/Kl9gNXLO431Vv1Cykh/MGB6Q8rxQofP74z+i9azOLlQunB6kywhj79NfNKI81Vr5lGXA/s8/mff7VmKlrLj0TzBfwPgjfmIcBCcrmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=VBwv+Bwu; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="VBwv+Bwu"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 51DC92FC0052;
	Tue, 25 Nov 2025 14:57:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764079063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fxfpnLzA1A0DGBa5Pc2ZNN1Tf6yE3JaWHSEO0KWOjE=;
	b=VBwv+BwumW9qMZx6s07xjKFIq4Zz56U1EFF1LbDx6pnLapJ4I6uvgf7pw/0EHvw7V+5K2j
	d5dELUCBrtqQbctcdIvW6iQcn5LEBog2kiq6Az2TXrolQML4t4fme19N8dbIXEwsKFEENG
	2N/oH4Qt8oHZdftz5lJ2B9Cys2nzdvs=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [RFC PATCH 2/2] platform/x86/uniwill: Implement cTGP setting
Date: Tue, 25 Nov 2025 14:49:12 +0100
Message-ID: <20251125135729.487837-3-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125135729.487837-1-wse@tuxedocomputers.com>
References: <20251125135729.487837-1-wse@tuxedocomputers.com>
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
 drivers/platform/x86/uniwill/uniwill-acpi.c | 157 ++++++++++++++++----
 1 file changed, 132 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index f6a1054379ee1..503de3858cc0b 100644
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
@@ -514,6 +518,10 @@ static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
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
@@ -547,6 +555,10 @@ static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
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
@@ -802,6 +814,68 @@ static ssize_t breathing_in_suspend_show(struct device *dev, struct device_attri
 
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
+DEVICE_ATTR_RW(ctgp_offset);
+
+static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
+{
+	int ret;
+
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
+		return 0;
+
+	ret = regmap_update_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
+				 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE,
+				 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE);
+	if (ret < 0)
+		return ret;
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
+	return 0;
+}
+
 static struct attribute *uniwill_attrs[] = {
 	/* Keyboard-related */
 	&dev_attr_fn_lock_toggle_enable.attr,
@@ -810,6 +884,8 @@ static struct attribute *uniwill_attrs[] = {
 	/* Lightbar-related */
 	&dev_attr_rainbow_animation.attr,
 	&dev_attr_breathing_in_suspend.attr,
+	/* Power-management-related */
+	&dev_attr_ctgp_offset.attr,
 	NULL
 };
 
@@ -839,6 +915,11 @@ static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct attribute *a
 			return attr->mode;
 	}
 
+	if (attr == &dev_attr_ctgp_offset.attr) {
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
+			return attr->mode;
+	}
+
 	return 0;
 }
 
@@ -1405,6 +1486,10 @@ static int uniwill_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = uniwill_nvidia_ctgp_init(data);
+	if (ret < 0)
+		return ret;
+
 	return uniwill_input_init(data);
 }
 
@@ -1545,6 +1630,28 @@ struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
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
+	if (value & HAS_GPU)
+		data->features |= UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
+
+	return 0;
+};
+
+struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __initdata = {
+	.probe = phxarx1_phxaqf1_probe
+};
+
+struct uniwill_device_descriptor tux_featureset_1_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL
+};
+
 struct uniwill_device_descriptor void_descriptor __initdata = {};
 
 static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
@@ -1594,7 +1701,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
@@ -1602,7 +1709,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Book Pro Gen 7",
@@ -1610,7 +1717,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -1626,7 +1733,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
@@ -1634,7 +1741,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
@@ -1802,7 +1909,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 Intel",
@@ -1810,7 +1917,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
@@ -1818,7 +1925,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
@@ -1826,7 +1933,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
@@ -1834,7 +1941,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 15 Gen4 Intel",
@@ -1842,7 +1949,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen5 AMD",
@@ -1850,7 +1957,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen5 AMD",
@@ -1858,7 +1965,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
@@ -1866,7 +1973,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
@@ -1874,7 +1981,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim 15 Gen6",
@@ -1882,7 +1989,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -1890,7 +1997,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -1898,7 +2005,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
@@ -1906,7 +2013,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 AMD",
@@ -1914,7 +2021,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -1922,7 +2029,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -1930,7 +2037,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
 		},
-		.driver_data = &void_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 14 Gen1 AMD",
-- 
2.43.0

