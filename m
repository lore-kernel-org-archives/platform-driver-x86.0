Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571C9373BF4;
	Thu, 12 Mar 2026 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343509; cv=none; b=iL8zeuIWoNbFXc05Q3TRKXGp9HciIkzfAKt5JI7ib3+otOf07wopWv7TIVZesLlTKQVUWAjm3bK++yPGM50Mrqz1TW6g0kOUN4h8dt7a+BfOtLgdlbO/dBKLQHgHn19qDTfWUJS4iFpdDsxZzJXlcqkwBZn3CXXI7OCA6rUFG5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343509; c=relaxed/simple;
	bh=s4C9X7gH6eJBAa9CnjLnOx5ipES4R8Tquh5QaWkRebw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2uDVm4vKy8hJKVh6OdlpQp/9k5SQppBF2kEAjXSpdO/pGn9XwKrWVTP/g38MKJJnUt3O4ruoJqeYsfAsfGN+Cuq2pa8O8CwKTKh530qdRaqXfh1BsKYJ9eFjtl5V5EOh08mVdkK2BxFIlHA/EzQVWiWfneK3br3FH8ixY40EoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=oLYjAFPi; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="oLYjAFPi"
Received: from wse-pc.fritz.box (i5C75F5CE.versanet.de [92.117.245.206])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id D018F2FC005B;
	Thu, 12 Mar 2026 20:25:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1773343505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isj+OJlk6h6Vzih+t4vVCOgw4y+NobdyltAlPVh4h+0=;
	b=oLYjAFPiscm37c5JA6E1NH/63+5USMUaZyiqXkP8NEhjxnpYsOtrBXteV7aV9PPqLRbAGz
	Urw3Q+WmZOvFvmYPWTIjIYViuNgDOiJbn68hlXjiu4sPixpyMs6UOHPOds3IwSX9RtRJhM
	C7e7L1ZMC/VsyLNEkMIHYShGjWojhTA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v5 4/5] platform/x86: uniwill-laptop: Apply features across all TUXEDO devices
Date: Thu, 12 Mar 2026 20:23:00 +0100
Message-ID: <20260312192456.75913-5-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312192456.75913-1-wse@tuxedocomputers.com>
References: <20260312192456.75913-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Uses the more fine granular and/or new feature defines to enable more
features across the TUXEDO device lineup.

Also adds features to TUXEDO devices that where already present in the
driver, but not tested until now.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 210 ++++++++++++++------
 1 file changed, 154 insertions(+), 56 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index ff9d6a4921a29..56504e06cfb71 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -110,6 +110,8 @@
 #define EC_ADDR_BAT_CYCLE_COUNT_2	0x04A7
 
 #define EC_ADDR_PROJECT_ID		0x0740
+#define PROJECT_ID_PH4TRX1		0x12
+#define PROJECT_ID_PH6TRX1		0x15
 
 #define EC_ADDR_AP_OEM			0x0741
 #define	ENABLE_MANUAL_CTRL		BIT(0)
@@ -1861,6 +1863,15 @@ static struct platform_driver uniwill_driver = {
 	.shutdown = uniwill_shutdown,
 };
 
+static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN,
+};
+
 static struct uniwill_device_descriptor lapac71h_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
@@ -1884,6 +1895,85 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
 		    UNIWILL_FEATURE_SECONDARY_FAN,
 };
 
+/*
+ * The featuresets below reflect somewhat chronological changes:
+ * 1 -> 2: UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL is added to the EC firmware.
+ * 2 -> 3: UNIWILL_FEATURE_USB_C_POWER_PRIORITY is removed from the EC firmware.
+ * Some devices might divert from this timeline.
+ */
+
+static struct uniwill_device_descriptor tux_featureset_1_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+};
+
+static struct uniwill_device_descriptor tux_featureset_1_nvidia_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+};
+
+static struct uniwill_device_descriptor tux_featureset_2_nvidia_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+};
+
+static struct uniwill_device_descriptor tux_featureset_3_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN,
+};
+
+static struct uniwill_device_descriptor tux_featureset_3_nvidia_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
+};
+
+static int phxtxx1_probe(struct uniwill_data *data)
+{
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
+	if (ret < 0)
+		return ret;
+
+	if (value == PROJECT_ID_PH4TRX1 || value == PROJECT_ID_PH6TRX1)
+		data->features |= UNIWILL_FEATURE_SECONDARY_FAN;
+
+	return 0;
+};
+
+static struct uniwill_device_descriptor phxtxx1_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+	.probe = phxtxx1_probe,
+};
+
 static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
 {
 	unsigned int value;
@@ -1894,21 +1984,29 @@ static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
 		return ret;
 
 	if (value & HAS_GPU)
-		data->features |= UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
+		data->features |= UNIWILL_FEATURE_GPU_TEMP |
+				  UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
 
 	return 0;
 };
 
 static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
 	.probe = phxarx1_phxaqf1_probe,
 };
 
-static struct uniwill_device_descriptor tux_featureset_1_descriptor __initdata = {
-	.features = UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
+static struct uniwill_device_descriptor pf5pu1g_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN,
 };
 
-static struct uniwill_device_descriptor empty_descriptor __initdata = {};
-
 static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 	{
 		.ident = "XMG FUSION 15 (L19)",
@@ -1916,7 +2014,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &lapqc71a_lapqc71b_descriptor,
 	},
 	{
 		.ident = "XMG FUSION 15 (L19)",
@@ -1924,7 +2022,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &lapqc71a_lapqc71b_descriptor,
 	},
 	{
 		.ident = "XMG FUSION 15 (L19)",
@@ -1932,7 +2030,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &lapqc71a_lapqc71b_descriptor,
 	},
 	{
 		.ident = "XMG FUSION 15 (L19)",
@@ -1940,7 +2038,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &lapqc71a_lapqc71b_descriptor,
 	},
 	{
 		.ident = "Intel NUC x15",
@@ -1964,7 +2062,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &phxtxx1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen6 Intel",
@@ -1972,7 +2070,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
@@ -1988,7 +2086,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -1996,7 +2094,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -2004,7 +2102,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
@@ -2012,7 +2110,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
@@ -2020,7 +2118,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia-Book 15 Gen9",
@@ -2028,7 +2126,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
@@ -2036,7 +2134,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
@@ -2044,7 +2142,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 15 Gen10 Intel",
@@ -2052,7 +2150,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 15 Gen10 AMD",
@@ -2060,7 +2158,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
@@ -2068,7 +2166,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
@@ -2076,7 +2174,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 15 Gen10 Intel",
@@ -2084,7 +2182,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 Intel",
@@ -2092,7 +2190,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 AMD",
@@ -2100,7 +2198,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 AMD",
@@ -2108,7 +2206,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 AMD",
@@ -2116,7 +2214,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 AMD",
@@ -2124,7 +2222,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 Intel",
@@ -2132,7 +2230,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 Intel",
@@ -2140,7 +2238,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 Intel",
@@ -2148,7 +2246,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 Intel",
@@ -2156,7 +2254,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Trinity 15 Intel Gen1",
@@ -2164,7 +2262,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Trinity 17 Intel Gen1",
@@ -2172,7 +2270,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 AMD",
@@ -2180,7 +2278,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 Intel",
@@ -2188,7 +2286,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
@@ -2196,7 +2294,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
@@ -2204,7 +2302,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
@@ -2212,7 +2310,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 15 Gen4 Intel",
@@ -2220,7 +2318,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen5 AMD",
@@ -2228,7 +2326,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen5 AMD",
@@ -2236,7 +2334,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
@@ -2244,7 +2342,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
@@ -2252,7 +2350,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim 15 Gen6",
@@ -2260,7 +2358,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -2268,7 +2366,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -2276,7 +2374,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
@@ -2284,7 +2382,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 AMD",
@@ -2292,7 +2390,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -2300,7 +2398,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -2308,7 +2406,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Book BA15 Gen10 AMD",
@@ -2316,7 +2414,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &pf5pu1g_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 14 Gen1 AMD",
@@ -2324,7 +2422,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 15 Gen1 AMD",
@@ -2332,7 +2430,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 15 Gen2 AMD",
@@ -2340,7 +2438,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{ }
 };
-- 
2.43.0

